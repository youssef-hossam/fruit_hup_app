import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/helper_function/build_error_bar.dart';
import 'package:fruit_hub_app/core/helper_function/format_price.dart';
import 'package:fruit_hub_app/core/helper_function/get_saved_user.data.dart';
import 'package:fruit_hub_app/core/services/get_it_service.dart';
import 'package:fruit_hub_app/core/widgets/custom_button.dart';
import 'package:fruit_hub_app/core/widgets/fruit_app_bar.dart';
import 'package:fruit_hub_app/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub_app/features/checkout/presentation/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_hub_app/features/checkout/presentation/views/order_success_view.dart';
import 'package:fruit_hub_app/features/checkout/presentation/views/widgets/address_step.dart';
import 'package:fruit_hub_app/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruit_hub_app/features/checkout/presentation/views/widgets/review_step.dart';
import 'package:fruit_hub_app/features/checkout/presentation/views/widgets/shipping_step.dart';
import 'package:fruit_hub_app/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_app/features/orders/domain/repos/orders_repo.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

const double kDeliveryFee = 30;
const double kFreeDeliveryFrom = 300;

double deliveryFeeFor(double subtotal) =>
    subtotal >= kFreeDeliveryFrom ? 0 : kDeliveryFee;

class CheckoutView extends StatelessWidget {
  static const routeName = '/checkout';
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddOrderCubit(getIt<OrdersRepo>()),
      child: const _CheckoutBody(),
    );
  }
}

class _CheckoutBody extends StatefulWidget {
  const _CheckoutBody();

  @override
  State<_CheckoutBody> createState() => _CheckoutBodyState();
}

class _CheckoutBodyState extends State<_CheckoutBody> {
  final _pageController = PageController();
  final _addressFormKey = GlobalKey<FormState>();
  int _step = 0;
  String _paymentMethod = 'cash';
  late final AddressController _address =
      AddressController(fullName: getSavedUserData().name);

  @override
  void dispose() {
    _pageController.dispose();
    _address.dispose();
    super.dispose();
  }

  void _goTo(int step) {
    setState(() => _step = step);
    _pageController.animateToPage(step,
        duration: const Duration(milliseconds: 350), curve: Curves.easeOut);
  }

  void _next() {
    if (_step == 1 && !_addressFormKey.currentState!.validate()) return;
    if (_step < 2) {
      FocusScope.of(context).unfocus();
      _goTo(_step + 1);
    } else {
      _placeOrder();
    }
  }

  void _placeOrder() {
    final cart = context.read<CartCubit>();
    final subtotal = cart.subtotal;
    final fee = deliveryFeeFor(subtotal);
    final order = OrderEntity(
      id: 'FH-${10000 + Random().nextInt(89999)}',
      uid: getSavedUserData().uid,
      items: cart.state
          .map((e) => OrderItemEntity(
                productId: e.product.id,
                name: e.product.name,
                nameEn: e.product.nameEn,
                imageUrl: e.product.imageUrl,
                price: e.product.price,
                unit: e.product.unit,
                unitEn: e.product.unitEn,
                quantity: e.quantity,
              ))
          .toList(),
      subtotal: subtotal,
      deliveryFee: fee,
      total: subtotal + fee,
      paymentMethod: _paymentMethod,
      status: OrderStatus.pending,
      address: _address.toEntity(),
      createdAt: DateTime.now(),
    );
    context.read<AddOrderCubit>().addOrder(order);
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final titles = [s.shipping, s.address, s.payment];
    final subtotal = context.watch<CartCubit>().subtotal;
    final total = subtotal + deliveryFeeFor(subtotal);

    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          context.read<CartCubit>().clear();
          Navigator.pushReplacementNamed(context, OrderSuccessView.routeName,
              arguments: state.order);
        } else if (state is AddOrderFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) => PopScope(
        canPop: _step == 0,
        onPopInvoked: (didPop) {
          if (!didPop) _goTo(_step - 1);
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildFruitAppBar(context, title: titles[_step]),
          body: Column(
            children: [
              SizedBox(height: 8.h),
              CheckoutSteps(
                titles: titles,
                current: _step,
                onTap: (i) {
                  if (i < _step) _goTo(i);
                },
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ShippingStep(
                      selected: _paymentMethod,
                      total: total,
                      onChanged: (v) => setState(() => _paymentMethod = v),
                    ),
                    AddressStep(formKey: _addressFormKey, controller: _address),
                    ReviewStep(
                      address: _address.toEntity(),
                      paymentMethod: _paymentMethod,
                      onEditAddress: () => _goTo(1),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
                child: SafeArea(
                  top: false,
                  child: state is AddOrderLoading
                      ? const SizedBox(
                          height: 54,
                          child: Center(child: CircularProgressIndicator()))
                      : CustomButton(
                          text: _step < 2
                              ? s.next
                              : '${s.confirmOrder}  •  ${formatPrice(total)} ${s.currency}',
                          onPress: _next,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

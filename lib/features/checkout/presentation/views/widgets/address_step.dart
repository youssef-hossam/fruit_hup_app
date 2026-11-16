import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class AddressController {
  AddressController({String fullName = ''})
      : fullName = TextEditingController(text: fullName);

  final TextEditingController fullName;
  final phone = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();
  final floor = TextEditingController();

  ShippingAddressEntity toEntity() => ShippingAddressEntity(
        fullName: fullName.text.trim(),
        phone: phone.text.trim(),
        address: address.text.trim(),
        city: city.text.trim(),
        floor: floor.text.trim(),
      );

  void dispose() {
    for (final c in [fullName, phone, address, city, floor]) {
      c.dispose();
    }
  }
}

class AddressStep extends StatelessWidget {
  const AddressStep(
      {super.key, required this.formKey, required this.controller});
  final GlobalKey<FormState> formKey;
  final AddressController controller;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Form(
      key: formKey,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          _Field(controller: controller.fullName, hint: s.fullName),
          _Field(
            controller: controller.phone,
            hint: s.phone,
            keyboardType: TextInputType.phone,
            validator: (v) => (v == null || v.trim().length < 10)
                ? s.invalidPhone
                : null,
          ),
          _Field(controller: controller.address, hint: s.addressLine),
          _Field(controller: controller.city, hint: s.city),
          _Field(controller: controller.floor, hint: s.floor, required: false),
        ],
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.controller,
    required this.hint,
    this.keyboardType,
    this.validator,
    this.required = true,
  });

  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool required;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Color(0xffE6E9EA)),
    );
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator ??
            (v) => required && (v == null || v.trim().isEmpty)
                ? S.of(context).PleaseEnterSomeText
                : null,
        style: AppStyles.bodySmallsemiBold,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle:
              AppStyles.bodySmallBold.copyWith(color: AppColors.grayscale400),
          filled: true,
          fillColor: const Color(0xffF9FAFA),
          border: border,
          enabledBorder: border,
          focusedBorder: border.copyWith(
              borderSide: const BorderSide(color: AppColors.green1500)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub_app/core/widgets/error_view.dart';
import 'package:fruit_hub_app/core/widgets/products_sliver_grid.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/best_selling_head_line.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/featured_list.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/home_search_text_field.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/home_view_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return RefreshIndicator(
          color: const Color(0xff1B5E37),
          onRefresh: () => context.read<ProductsCubit>().getProducts(),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 12.h),
                    const HomeViewAppBar(),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: const HomeSearchTextField(),
                    ),
                    SizedBox(height: 12.h),
                    FeaturedList(
                      offers: state is ProductsSuccess ? state.offers : const [],
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: const BestSellingHeadline(),
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
              switch (state) {
                ProductsSuccess() =>
                  ProductsSliverGrid(products: state.bestSelling),
                ProductsFailure() => SliverToBoxAdapter(
                    child: ErrorView(
                      message: state.message,
                      onRetry: () => context.read<ProductsCubit>().getProducts(),
                    ),
                  ),
                _ => const ProductsSliverGridLoading(),
              },
              SliverToBoxAdapter(child: SizedBox(height: 24.h)),
            ],
          ),
        );
      },
    );
  }
}

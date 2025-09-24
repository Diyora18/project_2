import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/feature/common/reusable_app_bar.dart';

import '../../../core/utils/app_colors.dart';
import '../managers/detail_state.dart';
import '../managers/details_cubit.dart';
import '../widgets/detail_bottombar_widget.dart';
import '../widgets/detail_images_widget.dart';
import '../widgets/detail_info_widget.dart';
import '../widgets/detail_size_widget.dart';


class DetailPage extends StatelessWidget {
  final int productId;
  const DetailPage({required this.productId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DetailCubit(
        reviewRepository: context.read(),
        productRepo: context.read(),
      )..fetchProductDetail(productId),
      child: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          if (state.loading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
            return Scaffold(
              appBar:ReusableAppBar(title: "Details"),
              body: Center(
                child: Text(
                  state.errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final detail = state.detail;

          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: ReusableAppBar(title: "Details"),
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 16),
                    children: [
                      DetailImageWidget(detail: detail),
                      SizedBox(height: 12.h),
                      DetailInfoWidget(detail: detail),
                      SizedBox(height: 16.h),
                      DetailSizesWidget(sizes: detail.sizes),
                      SizedBox(height: 16.h),

                    ],
                  ),
                ),
                DetailBottomBar(price: detail.price),
              ],
            ),
          );
        },
      ),
    );
  }
}

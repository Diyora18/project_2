import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';
import '../managers/detail_state.dart';
import '../managers/details_cubit.dart';


class DetailBottomBar extends StatelessWidget {
  final num price;
  final VoidCallback? onAddToCart;
  final bool isEnabled;

  const DetailBottomBar({
    required this.price,
    this.onAddToCart,
    this.isEnabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Price
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'GeneralSans',
                ),
              ),
              Text(
                "\$ $price",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'GeneralSans',
                ),
              ),
            ],
          ),

          // Add to Cart button
          ElevatedButton(
            onPressed: isEnabled ? onAddToCart : null,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(240.w, 54.h),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              backgroundColor: isEnabled ? AppColors.black : AppColors.grey,
            ),
            child: Text(
              "Add to Cart",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'GeneralSans',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

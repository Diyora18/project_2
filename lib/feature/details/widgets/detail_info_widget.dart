import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/data/models/detail_model.dart';

class DetailInfoWidget extends StatelessWidget {
  final DetailModel detail;

  const DetailInfoWidget({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          detail.title,
          style: TextStyle(
            color: AppColors.black,
            fontFamily: "GeneralSans",
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/Star.svg',
              color: Color(0xFFFFA928),
            ),
            SizedBox(
              width: 6.w,
            ),
            Text(
              "${detail.rating.toStringAsFixed(1)}/5",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: "GeneralSans",
              ),
            ),
            SizedBox(width: 6.w),
            Text(
              "(${detail.reviewsCount} reviews)",
              style: TextStyle(
                color: AppColors.grey,
                fontFamily: "GeneralSans",
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 13.h),
        Text(
          detail.description,
          style: TextStyle(
              color: AppColors.grey,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'GeneralSans',
              height: 1.4,
              letterSpacing: 0
          ),
        ),
      ],
    );
  }
}

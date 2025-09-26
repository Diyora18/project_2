import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/app_colors.dart';


class EmptyStateWidget extends StatelessWidget {
  final String assetPath;
  final String title;
  final String subtitle;

  const EmptyStateWidget({
    super.key,
    required this.assetPath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(assetPath),
          SizedBox(height: 20.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontFamily: "GeneralSans",
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: 252.w,
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.grey,
                fontFamily: "GeneralSans",
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

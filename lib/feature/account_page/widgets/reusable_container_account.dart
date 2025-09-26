import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/utils/app_colors.dart';

class ReusableContainerAccount extends StatelessWidget {
  const ReusableContainerAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 8.h,
      decoration: BoxDecoration(color: AppColors.grey2),
    );
  }
}

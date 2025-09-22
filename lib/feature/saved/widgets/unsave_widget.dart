import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_colors.dart';

class NoSavedWidgets extends StatelessWidget {
  const NoSavedWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset('assets/Heart-duotone.svg'),

        SizedBox(
          height: 24,
        ),

        Text(
          "No Saved Items!",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'GeneralSans',
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          textAlign: TextAlign.center,
          "You don’t have any saved items.\n Go to home and add some.",
          style: TextStyle(
            color: AppColors.grey2,
            fontSize: 16.sp,
            fontFamily: "GeneralSans",
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

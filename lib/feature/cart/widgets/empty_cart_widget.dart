import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_colors.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset('assets/Cart-duotone.svg'),

        SizedBox(
          height: 24,
        ),

        Text(
          "Your Cart Is Empty!",
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
          "When you add products, they’ll\nappear here.",
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 16.sp,
            fontFamily: "GeneralSans",
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

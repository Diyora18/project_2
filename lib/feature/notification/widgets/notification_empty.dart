import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_2/core/utils/app_colors.dart';

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/Bell-duotone.svg"),
          SizedBox(
            height: 24.h,
          ),
          Text(
            "You haven’t gotten\n any notifications yet!",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 20,
              fontFamily: "GeneralSans",
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            "We’ll alert you when something\n cool happens.",
            style: TextStyle(
              color: AppColors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 16,
              fontFamily: "GeneralSans",
            ),
          ),
        ],
      ),
    );
  }
}

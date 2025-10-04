import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_2/core/utils/app_colors.dart';

class ReusableContainerHelp extends StatelessWidget {
  final String svgIcon;
  final String text;

  const ReusableContainerHelp({
    super.key,
    required this.svgIcon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 25, right: 24),
      child: Container(
        width: 341.w,
        height: 52.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              SvgPicture.asset(svgIcon),
              SizedBox(width: 12),
              Text(
                text,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "GeneralSans",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

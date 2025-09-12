import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/utils/app_colors.dart';


class ReusableTitle extends StatelessWidget {
  final String firstText;
  final String secondText;

  const ReusableTitle({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 24),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              firstText,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 32,
                fontWeight: FontWeight.w500,
                fontFamily: "GeneralSans",
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              width: 300.w,
              child: Text(
                secondText,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "GeneralSans",
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

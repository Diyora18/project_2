import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_2/feature/onboarding/widgets/reusable_text_button.dart';

import '../../../core/utils/app_colors.dart';

class CardDialog extends StatelessWidget {
  final VoidCallback? onPressed;
  const CardDialog({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 341.w,
        height: 292.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/tick.svg"),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "Congratulations!",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                width: 295,
                child: Text(
                  textAlign: TextAlign.center,
                  "Your new card has been added.",
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              ReusableTextButton(
                text: "Thanks",
                background: AppColors.black,
                onPressed: onPressed,
                textColor: AppColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

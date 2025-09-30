import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReusableTextButton extends StatelessWidget {
  final String text;
  final Color background;
  final VoidCallback? onPressed;
  final String? rightIcon;
  final Color textColor;
  final Color? borderColor;
  final String? leftIcon;

  const ReusableTextButton({
    super.key,
    required this.text,
    required this.background,
    required this.onPressed,
    this.rightIcon,
    required this.textColor,
    this.borderColor,
    this.leftIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextButton(
        style: TextButton.styleFrom(
          side: borderColor != null
              ? BorderSide(color: borderColor!, width: 2)
              : BorderSide.none,
          backgroundColor: background,
          fixedSize: Size(341.w, 54.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            if (leftIcon != null)
              SvgPicture.asset(leftIcon!),
            SizedBox(width: 10.w,),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: "GeneralSans",
              ),
            ),
            SizedBox(width: 10.w,),
            if (rightIcon != null)
              SvgPicture.asset(rightIcon!),
          ],
        ),
      ),
    );
  }
}

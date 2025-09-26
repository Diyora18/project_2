import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/feature/onboarding/widgets/reusable_text_button.dart';

import '../../../data/repositories/auth_repository.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 341.w,
        height: 336.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 131, right: 131, top: 24),
              child: SvgPicture.asset(
                "assets/WarningCircle.svg",
                width: 64.w,
                height: 64.h,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Logout?",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: "GeneralSans",
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "Are you sure you want to logout?",
              style: TextStyle(
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontFamily: "GeneralSans",
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            ReusableTextButton(
              text: "Yes, Logout",
              background: Color(0xFFED1010),
              onPressed: () async {
                await context.read<AuthRepository>().logout();
                context.go('/login-account-page');
              },

              textColor: AppColors.white,
            ),
            SizedBox(
              height: 12.h,
            ),
            ReusableTextButton(
              text: "No, Cancel",
              background: AppColors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              textColor: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}

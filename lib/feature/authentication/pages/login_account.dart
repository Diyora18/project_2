import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/feature/authentication/widgets/reusable_text_form_field.dart';
import 'package:project_2/feature/authentication/widgets/reusable_title.dart';
import 'package:project_2/feature/onboarding/widgets/reusable_text_button.dart';

class LoginAccountPage extends StatelessWidget {
  const LoginAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableTitle(
            firstText: "Login to your account",
            secondText: "It’s great to see you again.",
          ),
          SizedBox(
            height: 24.h,
          ),
          ReusableTextFormField(
            labelText: "Email",
            hintText: "Enter your email address",
          ),
          SizedBox(
            height: 16.h,
          ),
          ReusableTextFormField(
            labelText: "Password",
            hintText: "Enter your password",
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  "Forgot your password?",
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "GeneralSans",
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                GestureDetector(
                  onTap: () {
                    context.push("/forgot-password-page");
                  },
                  child: Text(
                    "Reset your password",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "GeneralSans",
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          ReusableTextButton(
            text: "Login",
            background: AppColors.grey2,
            onPressed: () {},
            textColor: Colors.white,
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 2.h,
                width: 154.w,
                decoration: BoxDecoration(color: AppColors.border),
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                "Or",
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: "GeneralSans",
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Container(
                height: 2.h,
                width: 154.w,
                decoration: BoxDecoration(color: AppColors.border),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          ReusableTextButton(
            text: "Sign Up With Google",
            background: Colors.white,
            onPressed: () {},
            textColor: AppColors.black,
            leftIcon: "assets/google.svg",
            borderColor: AppColors.border,
          ),
          SizedBox(
            height: 16.h,
          ),
          ReusableTextButton(
            text: "Sign Up With Facebook",
            background: AppColors.blue,
            onPressed: () {},
            textColor: Colors.white,
            leftIcon: "assets/logos_facebook.svg",
          ),
          SizedBox(
            height: 140.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "GeneralSans",
                ),
              ),
              SizedBox(
                width: 2,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Join",
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: "GeneralSans",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

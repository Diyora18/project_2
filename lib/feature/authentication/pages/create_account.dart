import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/feature/onboarding/widgets/reusable_text_button.dart';

import '../widgets/reusable_text_form_field.dart';
import '../widgets/reusable_title.dart';

class CreateAccountPage extends StatelessWidget {

  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableTitle(
            firstText: 'Create an Account',
            secondText: "Let's create an account",
          ),
          SizedBox(
            height: 24.h,
          ),
          ReusableTextFormField(
            labelText: 'Full Name',
            hintText: 'Enter your full name',
          ),
          SizedBox(
            height: 16.h,
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
            height: 12.h,
          ),
          SizedBox(
            width: 350,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "By signing up you agree to our Terms, Privacy Policy, and Cookie Use",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                maxLines: 2,
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          ReusableTextButton(
            text: "Create an Account",
            background: AppColors.border,
            onPressed: () {},
            textColor: AppColors.white,
            borderColor: Colors.black,
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
            height: 48.h,
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
                onTap: (){
                  context.push("/login-account-page");
                },
                child: Text(
                  "Log In",
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

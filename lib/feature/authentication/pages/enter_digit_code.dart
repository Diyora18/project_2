import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/data/models/auth/reset_password_verify.dart';
import 'package:project_2/feature/authentication/managers/forgot_password_viewmodel.dart';
import 'package:project_2/feature/authentication/widgets/otp.dart';
import 'package:project_2/feature/authentication/widgets/reusable_title.dart';
import 'package:project_2/feature/onboarding/widgets/reusable_text_button.dart';
import 'package:provider/provider.dart';

import '../../../data/models/auth/reset_password_email.dart';

class EnterCodePage extends StatelessWidget {
  const EnterCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            leading: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: SvgPicture.asset("assets/back_arrow.svg"),
              ),
            ),
            leadingWidth: 40,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusableTitle(
                firstText: "Enter 4 Digit Code",
                secondText:
                    "Enter 4 digit code that your receive on your email.",
              ),
              SizedBox(
                height: 24.h,
              ),
              OtpInput(),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Email not received?",
                    style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: "GeneralSans",
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Resend Code",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "GeneralSans",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 171.h,
              ),
              ReusableTextButton(
                text: "Continue",
                background: AppColors.black,
                onPressed: value.isLoadingEmail
                    ? null
                    : () async {

                  final model = EmailModel(email: value.email ?? '');

                  await value.fetchForgotEmail(model: model);

                  if (value.emailError != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(value.emailError!)),
                    );
                  }
                  else if (value.canGoToVerifyPage) {
                    context.push("/reset-password-page");
                  }
                },
                textColor: AppColors.white,
              ),

            ],
          ),
        );
      },
    );
  }
}

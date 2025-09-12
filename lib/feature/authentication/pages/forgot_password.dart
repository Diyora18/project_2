import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_2/feature/authentication/widgets/reusable_text_form_field.dart';
import 'package:project_2/feature/authentication/widgets/reusable_title.dart';
import 'package:project_2/feature/onboarding/widgets/reusable_text_button.dart';

import '../../../core/utils/app_colors.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset("assets/back_arrow.svg"),
        ),
        leadingWidth: 40,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableTitle(
            firstText: "Forgot password",
            secondText:
                "Enter your email for the verification process. We will send 4 digits code to your email.",
          ),
          ReusableTextFormField(
            labelText: "Email",
            hintText: "cody.fisher45@gmail.com",
          ),
          SizedBox(
            height: 191.h,
          ),
          ReusableTextButton(
            text: "Send Code",
            background: AppColors.black,
            onPressed: () {},
            textColor: AppColors.white,
          ),
        ],
      ),
    );
  }
}

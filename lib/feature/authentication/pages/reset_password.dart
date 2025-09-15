import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/feature/authentication/widgets/reusable_text_form_field.dart';
import 'package:project_2/feature/authentication/widgets/reusable_title.dart';
import 'package:project_2/feature/onboarding/widgets/reusable_text_button.dart';

import '../widgets/show_dialog.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: (){context.push("/enter-code-page");},
              child: SvgPicture.asset("assets/back_arrow.svg")),
        ),
        leadingWidth: 40,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableTitle(
            firstText: "Reset Password",
            secondText:
                "Set the new password for your account so you can login and access all the features.",
          ),
          SizedBox(
            height: 24.h,
          ),
          ReusableTextFormField(
            labelText: "Password",
            hintText: "**********",
            controller: passwordController,
            isPassword: true,
          ),
          SizedBox(height: 16.h),
          ReusableTextFormField(
            labelText: "Password",
            hintText: "**********",
            controller: passwordController,
            isPassword: true,
          ),
          SizedBox(
            height: 97.h,
          ),
          ReusableTextButton(
            text: "Continue",
            background: AppColors.black,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => PasswordDialog(),
              );
            },
            textColor: AppColors.white,
          ),
        ],
      ),
    );
  }
}

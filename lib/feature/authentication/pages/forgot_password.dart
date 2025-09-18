import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/data/models/auth/reset_password_email.dart';
import 'package:project_2/feature/authentication/widgets/reusable_text_form_field.dart';
import 'package:project_2/feature/authentication/widgets/reusable_title.dart';
import 'package:project_2/feature/onboarding/widgets/reusable_text_button.dart';

import '../managers/forgot_password_viewmodel.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthViewModel>(
      create: (context) => AuthViewModel(
        resetRepo: context.read(),
      ),
      child: Consumer<AuthViewModel>(
        builder: (context, vm, child) {
          return Scaffold(
            appBar: AppBar(
              leading: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    context.push("/login-account-page");
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
                  firstText: "Forgot password",
                  secondText:
                  "Enter your email for the verification process. We will send 4 digits code to your email.",
                ),
                ReusableTextFormField(
                  labelText: "Email",
                  hintText: "Enter your email",
                  controller: emailController,
                ),
                SizedBox(height: 191.h),
                ReusableTextButton(
                  text: vm.isLoadingEmail ? "Loading..." : "Send Code",
                  background: AppColors.black,
                  textColor: AppColors.white,
                  onPressed: vm.isLoadingEmail
                      ? null
                      : () async {
                    final model = EmailModel(email: emailController.text);
                    await vm.fetchForgotEmail(model: model);

                    if (vm.emailError != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(vm.emailError!)),
                      );
                    } else if (vm.email != null) {
                      context.push("/enter-code-page");
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

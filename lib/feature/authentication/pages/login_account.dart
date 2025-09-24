import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/feature/authentication/managers/login_view_model.dart';
import 'package:project_2/feature/authentication/widgets/reusable_text_form_field.dart';
import 'package:project_2/feature/authentication/widgets/reusable_title.dart';
import 'package:project_2/feature/onboarding/widgets/reusable_text_button.dart';
import 'package:provider/provider.dart';

import '../../../data/models/auth/login_model.dart';
import '../../../data/repositories/auth_repository.dart';

class LoginAccountPage extends StatefulWidget {
  const LoginAccountPage({super.key});

  @override
  State<LoginAccountPage> createState() => _LoginAccountPageState();
}

class _LoginAccountPageState extends State<LoginAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late final LoginViewModel _viewModel;
  bool _vmInitialized = false;
  bool isFormValid = false;

  void _validateForm() {
    setState(() {
      isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_vmInitialized) {
      final repo = Provider.of<AuthRepository>(context, listen: false);
      _viewModel = LoginViewModel(loginRepo: repo);
      _vmInitialized = true;
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>.value(
      value: _viewModel,
      child: Scaffold(
        body: Form(
          onChanged: _validateForm,
          key: _formKey,
          child: Column(
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
                controller: emailController,
              ),
              SizedBox(
                height: 16.h,
              ),
              ReusableTextFormField(
                labelText: "Password",
                hintText: "Enter your password",
                controller: passwordController,
                isPassword: true,
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
                        context.push("/home-page");
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
              Consumer<LoginViewModel>(
                builder: (context, value, child) {
                  return ReusableTextButton(
                    text: value.isLoading ? "Loading...." : "Login",
                    background: isFormValid
                        ? AppColors.black
                        : AppColors.grey2,
                    onPressed: isFormValid && !value.isLoading
                        ? () async {
                      if (_formKey.currentState!.validate()) {
                        final model = LoginModel(

                          email: emailController.text,
                          password: passwordController.text,
                        );
                        await value.login(model);

                        if (value.success) {
                          context.push("/home-page");
                        } else if (value.error != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(value.error!)),
                          );
                        }
                      }
                    }
                        : null,
                    textColor: Colors.white,
                  );
                },
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
        ),
      ),
    );
  }
}

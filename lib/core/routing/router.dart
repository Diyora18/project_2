import 'package:go_router/go_router.dart';
import 'package:project_2/feature/authentication/pages/enter_digit_code.dart';
import 'package:project_2/feature/authentication/pages/forgot_password.dart';
import 'package:project_2/feature/authentication/pages/login_account.dart';
import 'package:project_2/feature/authentication/pages/reset_password.dart';
import 'package:project_2/feature/home/pages/home_page.dart';
import 'package:project_2/feature/onboarding/page/splash_page.dart';
import 'package:project_2/feature/onboarding/page/onboarding_page.dart';

import '../../feature/authentication/pages/create_account.dart';

final router = GoRouter(
  initialLocation: "/splash-page",
  routes: [
    GoRoute(
      path: "/splash-page",
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: "/onboarding-page",
      builder: (context, state) => OnboardingPage(),
    ),
    GoRoute(
      path: "/create-account-page",
      builder: (context, state) => CreateAccountPage(),
    ),
    GoRoute(
      path: "/login-account-page",
      builder: (context, state) => LoginAccountPage(),
    ),
    GoRoute(
      path: "/forgot-password-page",
      builder: (context, state) => ForgotPasswordPage(),
    ),
    GoRoute(
      path: "/enter-code-page",
      builder: (context, state) => EnterCodePage(),
    ),
    GoRoute(
      path: "/reset-password-page",
      builder: (context, state) => ResetPasswordPage(),
    ),
    GoRoute(
      path: "/home-page",
      builder: (context, state) => HomePage(),
    ),
  ],
);

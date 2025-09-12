import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_2/feature/onboarding/widgets/reusable_text_button.dart';

import '../widgets/onboarding_painter.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 24),
        child: Stack(
          children: [
            CustomPaint(painter: OnboardingPainter(), child: Container()),
            const SizedBox(height: 60),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Define yourself in your unique way.",
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.w600,
                  fontFamily: "GeneralSans",
                  height: 0.8,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                "assets/Image.png",
              ),
            ),
            SizedBox(height: 10),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ReusableTextButton(
                  text: 'Get Started',
                  background: Colors.black,
                  onPressed: () {
                    context.push("/create-account-page");
                  },
                  rightIcon: "assets/arrow_right.svg",
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

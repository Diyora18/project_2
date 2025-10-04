import 'package:flutter/material.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/feature/common/reusable_app_bar.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ReusableAppBar(title: "Checkout"),
    );
  }
}

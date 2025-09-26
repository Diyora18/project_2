import 'package:flutter/material.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/feature/common/divider_widget.dart';
import 'package:project_2/feature/common/reusable_app_bar.dart';
import 'package:project_2/feature/notification/pages/reusable_row_account.dart';
import 'package:project_2/feature/notification/widgets/reusable_switch.dart';

class NotificationAccount extends StatelessWidget {
  const NotificationAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ReusableAppBar(title: "Notification"),
      body: Column(
        children: [
          ReusableRowAccount(text: 'General Notifications'),
          ReusableRowAccount(text: 'Sound',),
          ReusableRowAccount(text: 'Vibrate',),
          ReusableRowAccount(text: 'Special Offers',),
          ReusableRowAccount(text: 'Promo & Discounts',),
          ReusableRowAccount(text: 'Payments',),
         ]
      ),
    );
  }
}

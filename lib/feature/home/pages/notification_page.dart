import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/feature/common/reusable_app_bar.dart';
import 'package:project_2/feature/home/widgets/divider_shorter.dart';
import 'package:project_2/feature/home/widgets/reusable_column.dart';
import 'package:project_2/feature/home/widgets/divider_widget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(title: "Notifications"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DividerWidget(),
            SizedBox(
              height: 20,
            ),
            ReusableColumn(
              day: 'Today',
              svgIcon: 'assets/Discount-duotone.svg',
              text: '30% Special Discount!',
              description: 'Special promotion only valid today.',
            ),
            DividerWidget(),
            SizedBox(height: 20.h),
            ReusableColumn(
              day: 'Yesterday',
              svgIcon: 'assets/Wallet-duotone.svg',
              text: 'Top Up E-wallet Successfully!',
              description: 'You have top up your e-wallet.',
            ),
            DividerShorter(),
            ReusableColumn(
              day: '',
              svgIcon: 'assets/Location.svg',
              text: 'New Service Available!',
              description: 'Now you can track order in real-time.',
            ),
            DividerWidget(),
            SizedBox(height: 20.h,),
            ReusableColumn(
              day: 'June 7, 2023',
              svgIcon: 'assets/Card-duotone.svg',
              text: 'Credit Card Connected!',
              description: 'Credit card has been linked.',
            ),
            DividerShorter(),
            ReusableColumn(day: '', svgIcon: 'assets/User-duotone.svg', text: 'Account Setup Successfully!', description: 'Your account has been created.')
          ],
        ),
      ),
    );
  }
}

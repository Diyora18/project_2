import 'package:flutter/material.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/feature/common/divider_widget.dart';
import 'package:project_2/feature/common/reusable_app_bar.dart';
import 'package:project_2/feature/account/widgets/reusable_container_help.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ReusableAppBar(title: "Help Center"),
      body: Column(
        children: [
          DividerWidget(),
          ReusableContainerHelp(
            svgIcon: 'assets/Headphones.svg',
            text: 'Customer Service',
          ),
          ReusableContainerHelp(
            svgIcon: 'assets/Whatsapp.svg',
            text: 'Whatsapp',
          ),
          ReusableContainerHelp(
            svgIcon: 'assets/Web.svg',
            text: 'Website',
          ),
          ReusableContainerHelp(
            svgIcon: 'assets/Facebook.svg',
            text: 'Facebook',
          ),
          ReusableContainerHelp(
            svgIcon: 'assets/Twitter.svg',
            text: 'Twitter',
          ),
          ReusableContainerHelp(
            svgIcon: 'assets/Instagram.svg',
            text: 'Instagram',
          ),
        ],
      ),
    );
  }
}

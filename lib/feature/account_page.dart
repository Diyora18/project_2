import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/feature/common/divider_widget.dart';
import 'package:project_2/feature/common/reusable_app_bar.dart';
import 'package:project_2/feature/common/reusable_bottom_navigation.dart';
import 'package:project_2/feature/reusable_container_account.dart';
import 'package:project_2/feature/reusable_row.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ReusableAppBar(title: "Account"),
      body: Column(
        children: [
          DividerWidget(),
          ReusableRow(
            svgICon: 'assets/Box.svg',
            title: 'My Orders',
          ),
          SizedBox(
            height: 25,
          ),
          ReusableContainerAccount(),
          ReusableRow(svgICon: 'assets/Details.svg', title: "My Details"),
          DividerWidget(),
          ReusableRow(svgICon: 'assets/Address.svg', title: "Address Book"),
          DividerWidget(),
          ReusableRow(
            svgICon: 'assets/Card-duotone.svg',
            title: "Payment Methods",
          ),
          DividerWidget(),
          ReusableRow(svgICon: 'assets/Bell.svg', title: "Notifications"),
          SizedBox(height: 25.h,),
          ReusableContainerAccount(),
          ReusableRow(svgICon: "assets/Question.svg", title: "FAQs"),
          DividerWidget(),
          ReusableRow(svgICon: "assets/Headphones.svg", title: "Help Center"),
          SizedBox(height: 25.h,),
          ReusableContainerAccount(),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 24, right: 275),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/Logout.svg",
                ),
                SizedBox(
                  width: 19.w,
                ),
                Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w400,
                    fontFamily: "GeneralSans",
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ReusableBottomNavigation(isActive: 4),
    );
  }
}

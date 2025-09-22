import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_2/core/utils/app_colors.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const ReusableAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 100,
      leading: Center(
        child: SvgPicture.asset(
          "assets/back_arrow.svg",
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w600,
          fontSize: 24,
          fontFamily: "GeneralSans",
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: SvgPicture.asset("assets/Bell.svg"),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 56);
}

import 'package:flutter/material.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/feature/common/divider_widget.dart';
import 'package:project_2/feature/notification/widgets/reusable_switch.dart';

class ReusableRowAccount extends StatelessWidget {
  final String text;
  const ReusableRowAccount({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 24, right: 25),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                text,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "GeneralSans",
                ),
              ),
              Spacer(),
              AccountSwitch(),
            ],
          ),
          DividerWidget(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project_2/core/utils/app_colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, right: 25, left: 25),
      child: Divider(
        color: AppColors.grey2,
        height: 1,
      ),
    );
  }
}

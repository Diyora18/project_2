import 'package:flutter/material.dart';
import 'package:project_2/core/utils/app_colors.dart';

class DividerShorter extends StatelessWidget {
  const DividerShorter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 25, top: 20),
      child: Divider(
        height: 1,
        color: AppColors.grey2,
      ),
    );
  }
}

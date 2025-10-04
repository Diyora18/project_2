import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_2/core/utils/app_colors.dart';

class ReusableRow extends StatelessWidget {
  final String svgICon;
  final String title;
  final VoidCallback? onPressed;


  const ReusableRow({
    super.key,
    required this.svgICon,
    required this.title, this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 26, right: 32),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            SvgPicture.asset(svgICon),
            SizedBox(width: 18),
            Text(
              title,
              style: TextStyle(
                color: AppColors.black,
                fontFamily: "GeneralSans",
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            Spacer(),
            SvgPicture.asset("assets/right_arrow.svg"),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/feature/common/divider_widget.dart';

class RecentSearchesWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const RecentSearchesWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontFamily: "GeneralSans",
              ),
            ),
            IconButton(
              onPressed: onPressed,
              icon: SvgPicture.asset('assets/Cancel-circle.svg'),
            ),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        DividerWidget(),
      ],
    );
  }
}

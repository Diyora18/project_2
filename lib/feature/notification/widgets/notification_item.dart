import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_colors.dart';

class NotificationItem extends StatelessWidget {
  final String? day;
  final String svgIcon;
  final String text;
  final String description;

  const NotificationItem({
    super.key,
    this.day,
    required this.svgIcon,
    required this.text,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              height: 1,
              width: day != null ? double.infinity : 80,
              color: AppColors.grey2,
            ),
          ),
          SizedBox(height: 16),
          if (day != null) ...[
            Text(
              day!,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: "GeneralSans"
              ),
            ),
            SizedBox(height: 16.h),
          ],
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.network(svgIcon),
              SizedBox(width: 14.5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      fontFamily: "GeneralSans",
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    description,
                    style: const TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: "GeneralSans",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

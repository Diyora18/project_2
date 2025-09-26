import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_colors.dart';


class RowTextFormWidget extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final  bool showFilter;

  const RowTextFormWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted, this.showFilter=true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 281.w,
          height: 52.h,
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            onFieldSubmitted: onSubmitted,
            decoration: InputDecoration(
              hintText: "Search for clothes...",
              hintStyle: TextStyle(
                color: AppColors.grey2,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              prefixIcon: SvgPicture.asset(
                "assets/Search.svg",
                fit: BoxFit.scaleDown,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/Mic.svg',
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColors.hintColor,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        if (showFilter)...[
        SizedBox(width: 8.w),
        Container(
          width: 52.w,
          height: 52.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.black,
          ),
          child: SvgPicture.asset(
            "assets/Filter.svg",
            fit: BoxFit.scaleDown,
          ),
        ),
      ],
    ]);
  }
}

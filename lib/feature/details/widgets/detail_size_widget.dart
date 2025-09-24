import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/data/models/detail_model.dart';

import '../../../core/utils/app_colors.dart';


class DetailSizesWidget extends StatelessWidget {
  final List<ProductSizes> sizes;

  const DetailSizesWidget({required this.sizes, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Choose Size",
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
            fontFamily: "GeneralSans",
            fontSize: 20.sp,
          ),
        ),
        SizedBox(height: 12.h,),
        SizedBox(
          height: 50.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: sizes.length,
            separatorBuilder: (_, __) => SizedBox(width: 10.w),
            itemBuilder: (_, index) {
              final size = sizes[index];
              return Container(
                width: 50.w,
                height: 50.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: AppColors.grey),
                ),
                child: Text(size.title, style: TextStyle()),
              );
            },
          ),
        ),
      ],
    );
  }
}

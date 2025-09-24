import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/data/models/detail_model.dart';

class DetailImageWidget extends StatelessWidget {
  final DetailModel detail;

  const DetailImageWidget({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          height: 368.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(detail.images.first.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 16.h,
          right: 16.w,
          child: Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              detail.isLiked ? Icons.favorite : Icons.favorite_border,
              color: detail.isLiked ? Colors.red : AppColors.black,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}

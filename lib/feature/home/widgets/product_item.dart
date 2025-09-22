import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/feature/home/managers/product_cubit.dart';

class ProductItem extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  final num price;
  final num? discount;
  final bool isLiked;

  const ProductItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    this.discount,
    required this.id,
    required this.isLiked,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 161.w,
      height: 224.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 122.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    width: 161.w,
                    height: 122.h,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    if (isLiked) {
                      context.read<ProductCubit>().unsaveProduct(id);
                    } else {
                      context.read<ProductCubit>().saveProduct(id);
                    }
                  },
                  child: Container(
                    width: 36.w,
                    height: 36.h,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.white,
                    ),
                    child: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : AppColors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 8,
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              fontFamily: "GeneralSans",
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(
                "\$$price",
                style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                width: 6,
              ),
              if (discount != null && discount! > 0)
                Text(
                  "-${discount!}%",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

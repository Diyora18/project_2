import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_2/data/models/product_model.dart';
import 'package:project_2/feature/common/divider_widget.dart';

import '../../../core/utils/app_colors.dart';

class SearchItemWidget extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const SearchItemWidget({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    product.image,
                    width: 56.w,
                    height: 53.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "GeneralSans",
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        "\$${product.price}",
                        style: TextStyle(
                          color: AppColors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: "GeneralSans",
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                SvgPicture.asset("assets/Arrow.svg"),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            DividerWidget(),
          ],
        ),
      ),
    );
  }
}

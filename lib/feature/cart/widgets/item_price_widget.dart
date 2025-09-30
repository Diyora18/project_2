import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/feature/common/divider_widget.dart';
import 'package:project_2/feature/onboarding/widgets/reusable_text_button.dart';

import '../../../data/models/cart_model.dart';

class ItemPriceWidget extends StatelessWidget {
  final CartModel item;

  const ItemPriceWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24,top: 24, right: 26),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sub-total",
                style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: "GeneralSans",
                ),
              ),
              Text(
                "\$${item.subTotal}",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "GeneralSans",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "VAT(%)",
                style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: "GeneralSans",
                ),
              ),
              Text(
                "\$${item.vat}",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "GeneralSans",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping fee",
                style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: "GeneralSans",
                ),
              ),
              Text(
                "\$${item.shippingFee}",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "GeneralSans",
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          DividerWidget(),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: "GeneralSans",
                ),
              ),
              Text(
                "\$${item.total}",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "GeneralSans",
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

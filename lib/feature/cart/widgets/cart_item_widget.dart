import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/data/models/cart_model.dart';
import 'package:project_2/feature/cart/managers/cart_bloc.dart';
import 'package:project_2/feature/cart/managers/cart_event.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 342.w,
        maxHeight: 107.h,
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.grey2),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 14, right: 15, left: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                item.image,
                width: 83.w,
                height: 79.h,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      fontFamily: "GeneralSans",
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "size ${item.size}",
                    style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: "GeneralSans",
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "\$${item.price}",
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      fontFamily: "GeneralSans",
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<CartBloc>().add(RemoveFromCart(item.id));
                  },
                  icon: SvgPicture.asset("assets/Trash.svg"),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 23.w,
                      height: 23.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(color: AppColors.grey2),
                      ),
                      child: IconButton(
                        onPressed: () {
                          if (item.quantity > 1) {
                            context.read<CartBloc>().add(
                              RemoveFromCart(item.id),
                            );
                          } else {
                            context.read<CartBloc>().add(
                              RemoveFromCart(item.id),
                            );
                          }
                        },
                        icon: SvgPicture.asset("assets/Minus.svg"),
                      ),
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    Text(
                      "${item.quantity}",
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: "GeneralSans",
                      ),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Container(
                      width: 23.w,
                      height: 23.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(color: AppColors.grey2),
                      ),
                      child: IconButton(
                        onPressed: () {
                          context.read<CartBloc>().add(
                            AddToCart(
                              productId: item.productId,
                              sizeId: item.sizeId,
                            ),
                          );

                        },
                        icon: SvgPicture.asset("assets/Plus.svg"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

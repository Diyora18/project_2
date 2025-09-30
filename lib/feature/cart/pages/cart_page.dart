import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/feature/cart/widgets/cart_item_widget.dart';
import 'package:project_2/feature/cart/widgets/item_price_widget.dart';
import 'package:project_2/feature/common/reusable_app_bar.dart';
import 'package:project_2/feature/common/reusable_bottom_navigation.dart';

import '../../../core/utils/app_colors.dart';
import '../../onboarding/widgets/reusable_text_button.dart';
import '../managers/cart_bloc.dart';
import '../managers/cart_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBody: true,
      appBar: const ReusableAppBar(title: "My Cart"),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null) {
            return Center(child: Text(state.errorMessage!));
          }

          if (state.cart!.items.isEmpty) {
            return const Center(
              child: Text(
                "Savatcha bo‘sh",
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          if (state.cart == null || state.cart!.items.isEmpty) {
            return const Center(
              child: Text(
                "Savatcha bo‘sh",
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: state.cart!.items.length,
                  itemBuilder: (context, index) {
                    final item = state.cart!.items[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: CartItemWidget(item: item),
                    );
                  },
                ),
                
              ),
              SafeArea(
                top: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ItemPriceWidget(item: state.cart!),
                    SizedBox(
                      height: 51.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ReusableTextButton(
                        text: "Go to Checkout",
                        background: AppColors.black,
                        onPressed: () {},
                        textColor: AppColors.white,
                        rightIcon: "assets/arrow_right.svg",
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: ReusableBottomNavigation(isActive: 3),
    );
  }
}

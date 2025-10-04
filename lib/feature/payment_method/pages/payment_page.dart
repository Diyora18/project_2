import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_2/feature/common/reusable_app_bar.dart';
import 'package:project_2/feature/onboarding/widgets/reusable_text_button.dart';
import 'package:project_2/feature/payment_method/managers/new_card_event.dart';

import '../../../core/utils/app_colors.dart';
import '../managers/new_card_bloc.dart';
import '../managers/new_card_state.dart';


class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBody: true,
      appBar: const ReusableAppBar(title: "Payment Method"),
      body: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          if (state.loading!) return const Center(child: CircularProgressIndicator());
          if (state.errorMessage != null) return Center(child: Text(state.errorMessage!));

          final cards = state.card ?? [];
          if (cards.isEmpty) return const Center(child: Text("No saved cards"));

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 100.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Saved Cards",
                    style: TextStyle(
                      fontFamily: "GeneralSans",
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Column(
                    children: List.generate(cards.length, (index) {
                      final card = cards[index];
                      final last4 = (card.cardNumber.length >= 4)
                          ? card.cardNumber.substring(card.cardNumber.length - 4)
                          : '';

                      return Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.credit_card, size: 32.sp, color: AppColors.black),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Text(
                                "**** **** **** $last4",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                            if (card.isDefault == true)
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: AppColors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Text("Default",
                                    style: TextStyle(fontSize: 12.sp, color: AppColors.black)),
                              ),
                            SizedBox(width: 8.w),
                            Radio<int>(
                              activeColor: AppColors.black,
                              value: card.id,
                              groupValue: state.selectedId,
                              onChanged: (val) {
                                if (val != null) {
                                  context.read<CardBloc>().add(SelectedCardEvent(id: val));
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 12.h),
                  ReusableTextButton(
                    text: "Add New Card",
                    background: Colors.transparent,
                    borderColor: AppColors.grey,
                    textColor: AppColors.black,
                    leftIcon: 'assets/Plus.svg',
                    onPressed: () => context.push('/new-card-page'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 86.h,
        color: AppColors.white,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ReusableTextButton(
          text: 'Apply',
          background: AppColors.black,
          textColor: AppColors.white,
          onPressed: () {
            final selectedId = context.read<CardBloc>().state.selectedId;
            if (selectedId != null) {
              debugPrint('Applying card id: $selectedId');
            }
          },
        ),
      ),
    );
  }
}

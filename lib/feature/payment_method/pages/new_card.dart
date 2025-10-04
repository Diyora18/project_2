import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/core/utils/validator.dart';
import 'package:project_2/data/models/new_card_model.dart';
import 'package:project_2/feature/common/reusable_app_bar.dart';
import 'package:project_2/feature/onboarding/widgets/reusable_text_button.dart';
import 'package:project_2/feature/payment_method/managers/new_card_bloc.dart';
import 'package:project_2/feature/payment_method/managers/new_card_event.dart';
import 'package:project_2/feature/payment_method/widgets/input_formatter.dart';
import 'package:project_2/feature/payment_method/widgets/reusable_textformfield_card.dart';
import 'package:project_2/feature/payment_method/widgets/show_dialog.dart';

class NewCardPage extends StatefulWidget {
  const NewCardPage({super.key});

  @override
  State<NewCardPage> createState() => _NewCardPageState();
}

class _NewCardPageState extends State<NewCardPage> {
  final formKey = GlobalKey<FormState>();
  final numberController = TextEditingController();
  final dateController = TextEditingController();
  final codeController = TextEditingController();

  String convertExpiryDate(String input) {
    final parts = input.split('/');
    final month = parts[0];
    final year = parts[1];
    return "20$year-$month-01";
  }

  @override
  void dispose() {
    numberController.dispose();
    dateController.dispose();
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      appBar: ReusableAppBar(title: "New Card"),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 16),
          child: Column(
            children: [
              Text(
                "Add Debit or Credit Card",
                style: TextStyle(
                  color: AppColors.black,
                  fontFamily: "GeneralSans",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ReusableCardTextField(
                controller: numberController,
                label: "Card Number",
                hint: "Enter your card number",
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(19),
                  CardNumberInputFormatter(),
                ],
                validator: CardValidators.validateCardNumber,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: ReusableCardTextField(
                      controller: dateController,
                      label: "Expiry Date",
                      hint: "MM/YY",
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(5),
                        ExpiryDateInputFormatter(),
                      ],
                      validator: CardValidators.validateExpiryDate,
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: ReusableCardTextField(
                      controller: codeController,
                      label: "Security Code",
                      hint: "CVC",
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                      validator: CardValidators.validateCVC,
                    ),
                  ),
                ],
              ),
              Spacer(),
              ReusableTextButton(
                text: "Add Card",
                background: AppColors.black,
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) => CardDialog(
                        onPressed: () {
                          context.pop();
                          context.go('/new-card-page');
                        },
                      ),
                    );
                    context.read<CardBloc>().add(
                      AddCardEvent(
                        NewCardModel(
                          cardNumber: numberController.text,
                          expiryDate: convertExpiryDate(dateController.text),
                          securityCode: codeController.text,
                        ),
                      ),
                    );
                  }
                },
                textColor: AppColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

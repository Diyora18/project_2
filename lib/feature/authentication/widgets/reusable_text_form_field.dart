import 'package:flutter/material.dart';
import 'package:project_2/core/utils/app_colors.dart';

class ReusableTextFormField extends StatefulWidget {
  final String labelText;
  final String hintText;

  const ReusableTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
  });

  @override
  State<ReusableTextFormField> createState() => _ReusableTextFormFieldState();
}

class _ReusableTextFormFieldState extends State<ReusableTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              fontFamily: "GeneralSans",
            ),
          ),
          SizedBox(height: 4),
          TextFormField(
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: AppColors.hintColor,
                fontFamily: "GeneralSans",
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.border),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

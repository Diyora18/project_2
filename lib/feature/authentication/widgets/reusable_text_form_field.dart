import 'package:flutter/material.dart';
import 'package:project_2/core/utils/app_colors.dart';

class ReusableTextFormField extends StatefulWidget {
  final bool isPassword;
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  const ReusableTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
  });

  @override
  State<ReusableTextFormField> createState() => _ReusableTextFormFieldState();
}

class _ReusableTextFormFieldState extends State<ReusableTextFormField> {
  bool obscureText = true;

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return "${widget.labelText} kiriting";
    }
    if (widget.isPassword) {
      if (value.length < 8) {
        return "Parol 8ta belgidan iborat bo'lsin";
      }
    } else if (widget.labelText.toLowerCase() == "email") {
      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
        return 'Please enter valid email address';
      }
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    final isValid =
        _validator(widget.controller.text) == null &&
        widget.controller.text.isNotEmpty;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
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
            controller: widget.controller,
            obscureText: widget.isPassword ? obscureText : false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: _validator,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: AppColors.hintColor,
                fontFamily: "GeneralSans",
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: isValid ? Colors.green : AppColors.border,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: isValid ? Colors.green : AppColors.border,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.border,
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}

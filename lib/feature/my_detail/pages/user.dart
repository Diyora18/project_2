import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/feature/common/reusable_app_bar.dart';
import 'package:project_2/feature/onboarding/widgets/reusable_text_button.dart';


import '../../../core/utils/app_colors.dart';
import '../../../data/models/user_model.dart';
import '../managers/user_bloc.dart';
import '../managers/user_event.dart';
import '../managers/user_state.dart';

import '../widgets/reusable_text_form_user.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    genderController.dispose();
    dateController.dispose();
    super.dispose();
  }

  void _onSubmit(UserModel oldUser) {
    if (_formKey.currentState?.validate() ?? false) {
      final updatedUser = UserModel(
        id: oldUser.id,
        fullName: fullNameController.text.isNotEmpty
            ? fullNameController.text
            : oldUser.fullName,
        email: emailController.text.isNotEmpty
            ? emailController.text
            : oldUser.email,
        phoneNumber: phoneController.text.isNotEmpty
            ? phoneController.text
            : oldUser.phoneNumber,
        gender: genderController.text.isNotEmpty
            ? genderController.text
            : oldUser.gender,
        birthDate: dateController.text.isNotEmpty
            ? DateTime.tryParse(dateController.text)
            : oldUser.birthDate,
      );

      if (updatedUser.fullName == oldUser.fullName &&
          updatedUser.email == oldUser.email &&
          updatedUser.phoneNumber == oldUser.phoneNumber &&
          updatedUser.gender == oldUser.gender &&
          updatedUser.birthDate == oldUser.birthDate) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No changes to update")),
        );
        return;
      }

      context.read<UserBloc>().add(UpdateUser(updatedUser));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        final user = state.user;

        if (state.loading!) {
          return const Center(child: CircularProgressIndicator());
        }

        if (user == null) {
          return const Center(child: Text("No user data"));
        }

        fullNameController.text = user.fullName ?? "";
        emailController.text = user.email ?? "";
        phoneController.text = user.phoneNumber ?? "";
        genderController.text = user.gender ?? "";
        dateController.text = user.birthDate != null
            ? user.birthDate!.toIso8601String().split("T").first
            : "";

        return Scaffold(
          extendBody: true,
          backgroundColor: AppColors.white,
          appBar: ReusableAppBar(title: "My Details"),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Divider(
                    color: AppColors.grey,
                  ),
                  ReusableTextFormUser(
                    label: "Full Name",
                    controller: fullNameController,
                    svgIcon: "assets/icons/user.svg",
                  ),
                  ReusableTextFormUser(
                    label: "Email",
                    controller: emailController,
                    svgIcon: "assets/icons/email.svg",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  ReusableTextFormUser(
                    label: "Phone",
                    controller: phoneController,
                    svgIcon: "assets/icons/phone.svg",
                    keyboardType: TextInputType.phone,
                  ),
                  ReusableTextFormUser(
                    label: "Gender",
                    controller: genderController,
                    svgIcon: "assets/icons/gender.svg",
                  ),
                  ReusableTextFormUser(
                    label: "Birth Date",
                    controller: dateController,
                    svgIcon: "assets/icons/calendar.svg",
                    readOnly: true,
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: user.birthDate ?? DateTime(2000, 1, 1),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        dateController.text = picked
                            .toIso8601String()
                            .split("T")
                            .first;
                      }
                    },
                  ),
                  SizedBox(height: 94),

                  ReusableTextButton(
                    text: 'Submit',
                    background: AppColors.black,
                    textColor: AppColors.white,
                    onPressed: () => _onSubmit(user),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

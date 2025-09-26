import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class AccountSwitch extends StatefulWidget {
  const AccountSwitch({super.key});

  @override
  State<AccountSwitch> createState() => _AccountSwitchState();
}

class _AccountSwitchState extends State<AccountSwitch> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: Switch(
        value: isOn,
        onChanged: (val) {
          setState(() {
            isOn = val;
          });
        },
        activeColor: Colors.white,
        activeTrackColor: AppColors.black,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.grey,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/feature/authentication/widgets/reusable_text_form_field.dart';
import 'package:project_2/feature/common/reusable_app_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(title: "Search"),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 19),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Search for clothes...",
                hintStyle: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                prefixIcon: SvgPicture.asset(
                  "assets/Search.svg",
                  fit: BoxFit.scaleDown,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.hintColor,
                    width: 2,
                  ),
                ),
                suffixIcon: SvgPicture.asset(
                  "assets/Mic.svg",
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  "Recent Searches",
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: "GeneralSans",
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                Text(
                  "Clear all",
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: "GeneralSans",
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

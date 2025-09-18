import 'package:flutter/cupertino.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/data/models/home/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;
  final Color titleColor;
  final Color backgroundColor;

  const CategoryItem({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
    required this.titleColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.hintColor),
        ),
        child: Text(category.title, style: TextStyle(
            color: titleColor, fontSize: 16, fontWeight: FontWeight.w600),),
      ),
    );
  }
}

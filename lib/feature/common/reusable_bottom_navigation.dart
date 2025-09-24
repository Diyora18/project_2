import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/app_colors.dart';

class ReusableBottomNavigation extends StatefulWidget {
  final int isActive;

  const ReusableBottomNavigation({super.key, required this.isActive});

  @override
  State<ReusableBottomNavigation> createState() =>
      _ReusableBottomNavigationState();
}

class _ReusableBottomNavigationState extends State<ReusableBottomNavigation> {
  late int _currentIndex;

  final List<String> _routes = [
    "/home-page",
    "/search-page",
    "/saved-page",
    "/cart-page",
    "/account-page",
  ];

  @override
  void initState() {
    _currentIndex = widget.isActive;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        context.push(_routes[index]);
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.black,
      unselectedItemColor: AppColors.grey2,
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        fontFamily: "GeneralSans",
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: "GeneralSans",
      ),
      items: [
        _navigationBarItem('assets/Home.svg', "Home", 0),
        _navigationBarItem('assets/Search.svg', "Search", 1),
        _navigationBarItem('assets/likeBottom.svg', "Saved", 2),
        _navigationBarItem('assets/Cart.svg', "Cart", 3),
        _navigationBarItem('assets/User.svg', "Account", 4),

      ],
    );
  }

  BottomNavigationBarItem _navigationBarItem(String icon, String label,
      int index) {
    return BottomNavigationBarItem(icon: SvgPicture.asset(icon,
        colorFilter: ColorFilter.mode(
            _currentIndex == index ? AppColors.black : AppColors.grey,
            BlendMode.srcIn),
    ),
      label: label,
    );
  }
}

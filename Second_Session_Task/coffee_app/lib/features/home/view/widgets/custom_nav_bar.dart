import 'package:coffee_app/features/home/view/widgets/custom_nav_item.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int selectedIndex = 0;

  void onPress(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomNavItem(
              index: 0,
              selectedIndex: selectedIndex,
              onTap: onPress,
              selectedIcon: Icons.home_rounded,
              unSelectedIcon: Icons.home_outlined,
            ),
            CustomNavItem(
              index: 1,
              selectedIndex: selectedIndex,
              onTap: onPress,
              selectedIcon: Icons.favorite_rounded,
              unSelectedIcon: Icons.favorite_border_rounded,
            ),
            CustomNavItem(
              index: 2,
              selectedIndex: selectedIndex,
              onTap: onPress,
              selectedIcon: Icons.shopping_bag,
              unSelectedIcon: Icons.shopping_bag_outlined,
            ),
            CustomNavItem(
              index: 3,
              selectedIndex: selectedIndex,
              onTap: onPress,
              selectedIcon: Icons.notifications,
              unSelectedIcon: Icons.notifications_none_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

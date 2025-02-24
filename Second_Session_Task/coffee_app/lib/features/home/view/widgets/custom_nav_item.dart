import 'package:flutter/material.dart';
import 'package:coffee_app/core/colors.dart';

class CustomNavItem extends StatelessWidget {
  const CustomNavItem(
      {super.key,
      required this.index,
      required this.onTap,
      required this.selectedIcon,
      required this.unSelectedIcon,
      required this.selectedIndex});
  final int index;
  final int selectedIndex;
  final void Function(int) onTap;
  final IconData selectedIcon;
  final IconData unSelectedIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () => onTap(index),
          padding: EdgeInsets.zero,
          alignment: Alignment.bottomCenter,
          icon: Icon(
            index == selectedIndex ? selectedIcon : unSelectedIcon,
            size: 30,
            color: index == selectedIndex ? MyColors.orange : MyColors.white,
          ),
        ),
        if (index == selectedIndex)
          Container(
            width: 10,
            height: 5,
            decoration: BoxDecoration(
              color: MyColors.orange,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
      ],
    );
  }
}

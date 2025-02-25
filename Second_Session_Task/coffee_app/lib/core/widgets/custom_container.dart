import 'package:flutter/material.dart';
import 'package:coffee_app/core/colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key, this.child, this.width, this.height, this.color});
  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 50,
      height: height ?? 50,
      decoration: BoxDecoration(
        color: color ?? MyColors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

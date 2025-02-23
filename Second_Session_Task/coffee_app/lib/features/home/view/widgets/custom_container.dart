import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, this.child, this.width, this.height});
  final Widget? child;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 50,
      height: height ?? 50,
      decoration: BoxDecoration(
        color: Color(0xffc67c4e),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

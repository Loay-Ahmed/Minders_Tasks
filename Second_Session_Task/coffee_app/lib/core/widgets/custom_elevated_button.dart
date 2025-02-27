import 'package:coffee_app/core/colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, this.child, this.minimumSize, this.color, this.onPressed});

  final Widget? child;
  final Size? minimumSize;
  final Color? color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: minimumSize,
        maximumSize: minimumSize,
      ),
      child: child,
    );
  }
}

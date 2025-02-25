import 'package:coffee_app/core/colors.dart';
import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  const CustomToggleButton(
      {super.key,
      required this.text,
      required this.index,
      required this.selectedIndex,
      required this.onPressed});
  final String text;
  final int index;
  final int selectedIndex;
  final void Function(int) onPressed;
  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed(widget.index);
      },
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: widget.selectedIndex == widget.index
              ? MyColors.liteOrange
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: widget.selectedIndex == widget.index
                ? MyColors.orange
                : MyColors.white,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 15,
            color: widget.selectedIndex == widget.index
                ? MyColors.orange
                : MyColors.black,
          ),
        ),
      ),
    );
  }
}

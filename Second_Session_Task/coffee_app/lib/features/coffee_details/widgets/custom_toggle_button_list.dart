import 'package:coffee_app/features/coffee_details/widgets/custom_toggle_button.dart';
import 'package:flutter/material.dart';

class CustomToggleButtonList extends StatefulWidget {
  const CustomToggleButtonList({super.key});

  @override
  State<CustomToggleButtonList> createState() => _CustomToggleButtonListState();
}

class _CustomToggleButtonListState extends State<CustomToggleButtonList> {
  int selectedIndex = 1;
  void onPress(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomToggleButton(
          text: 'S',
          index: 0,
          selectedIndex: selectedIndex,
          onPressed: onPress,
        ),
        CustomToggleButton(
          text: 'M',
          index: 1,
          selectedIndex: selectedIndex,
          onPressed: onPress,
        ),
        CustomToggleButton(
          text: 'L',
          index: 2,
          selectedIndex: selectedIndex,
          onPressed: onPress,
        ),
      ],
    );
  }
}

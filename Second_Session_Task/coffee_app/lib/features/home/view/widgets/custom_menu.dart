import 'package:flutter/material.dart';
import 'package:coffee_app/core/colors.dart';

class CustomMenu extends StatelessWidget {
  CustomMenu({
    super.key,
  });

  final List<String> locations = [
    "Bilzen, Tanjungbalai",
    "Cairo",
    "Asyut",
    "Qena",
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      initialSelection: 0,
      textStyle: TextStyle(
        color: MyColors.white,
        fontSize: 15,
      ),
      label: Text(
        "Location",
        style: TextStyle(
          color: Color(0xffa3a3a3),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        activeIndicatorBorder: BorderSide.none,
        enabledBorder: InputBorder.none,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        alignLabelWithHint: true,
        suffixIconColor: Color(0xffa3a3a3),
      ),
      dropdownMenuEntries: locations
          .map(
            (location) => DropdownMenuEntry(
              value: locations.indexOf(location),
              label: location,
            ),
          )
          .toList(),
    );
  }
}

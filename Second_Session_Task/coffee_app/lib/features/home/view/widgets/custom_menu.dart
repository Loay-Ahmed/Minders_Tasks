import 'package:flutter/material.dart';

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
        color: Color(0xffe3e3e3),
        fontSize: 15,
      ),
      width: 220,
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

import 'package:flutter/material.dart';
import 'package:coffee_app/core/colors.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            MyColors.black,
            Color(0xff393939),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: TextFormField(
        cursorColor: Color(0xffa3a3a3),
        style: TextStyle(
          color: MyColors.white,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          hintText: "Search Coffee",
          hintStyle: TextStyle(
            color: Color(0xffa3a3a3),
          ),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xffa3a3a3),
          ),
        ),
      ),
    );
  }
}

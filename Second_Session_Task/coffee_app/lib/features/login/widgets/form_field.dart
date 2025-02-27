import 'package:coffee_app/core/colors.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.hint,
      required this.controller,
      required this.obscure});
  final String hint;
  final TextEditingController controller;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 340,
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
        controller: controller,
        obscureText: obscure,
        cursorColor: Color(0xffa3a3a3),
        style: TextStyle(
          color: MyColors.white,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: Color(0xffa3a3a3),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

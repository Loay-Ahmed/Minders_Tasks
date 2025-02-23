import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCoffeeList extends StatefulWidget {
  const CustomCoffeeList({super.key});

  @override
  State<CustomCoffeeList> createState() => _CustomListSCoffeeState();
}

class _CustomListSCoffeeState extends State<CustomCoffeeList> {
  final List<String> types = [
    "All Coffee",
    "Machiato",
    "Latte",
    "American",
    "Espresso",
    "Cappuccino",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20,
      ),
      child: SizedBox(
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: types.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                width: 100,
                height: 10,
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: index != selectedIndex
                      ? Colors.transparent
                      : Color(0xffc67c4e),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  types[index],
                  style: TextStyle(
                    height: 1.5,
                    color: index == selectedIndex
                        ? Color(0xfff3f3f3)
                        : Color(0xff313131),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

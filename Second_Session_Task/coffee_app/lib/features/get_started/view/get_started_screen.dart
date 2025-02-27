import 'dart:async';

import 'package:coffee_app/core/colors.dart';
import 'package:coffee_app/core/widgets/custom_elevated_button.dart';
import 'package:coffee_app/features/login/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  late Timer _timer;
  bool coffee = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 900), (Timer timer) {
      setState(() {
        coffee = !coffee;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 335,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/coffee_four.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Find the best coffee for you",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 50),
            CustomElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              ),
              color: MyColors.orange,
              minimumSize: Size(335, 55),
              child: SizedBox(
                width: 230,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 18,
                        color: MyColors.white,
                        letterSpacing: 2,
                      ),
                    ),
                    // Spacer(),
                    SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        coffee ? Icons.coffee_rounded : Icons.coffee_outlined,
                        size: 30,
                        color: MyColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:coffee_app/core/colors.dart';
import 'package:coffee_app/core/widgets/custom_elevated_button.dart';
import 'package:coffee_app/features/home/view/home_view.dart';
import 'package:coffee_app/features/home/view/widgets/custom_search.dart';
import 'package:coffee_app/features/login/widgets/form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String valid() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      return "Email or password cannot be empty";
    }
    if (!email.contains("@") || email.substring(email.length - 4) != ".com") {
      return "Invalid email address";
    }
    if (password.length < 8) {
      return "Password must be at least 8 characters long";
    }
    return "valid";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.4,
              decoration: BoxDecoration(color: MyColors.white),
              child: Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Center(
                  child: Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2,
                      color: MyColors.black,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.6,
              decoration: BoxDecoration(color: MyColors.black),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
              // alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomFormField(
                    controller: emailController,
                    obscure: false,
                    hint: "Email",
                  ),
                  SizedBox(height: 20),
                  CustomFormField(
                    controller: passwordController,
                    obscure: true,
                    hint: "Password",
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
                  CustomElevatedButton(
                    color: MyColors.orange,
                    minimumSize: Size(340, 60),
                    onPressed: () {
                      if (valid() == "valid") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeView(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: MyColors.white,
                            content: Text(
                              valid(),
                              style: TextStyle(
                                fontSize: 16,
                                color: MyColors.black,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        fontSize: 20,
                        color: MyColors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

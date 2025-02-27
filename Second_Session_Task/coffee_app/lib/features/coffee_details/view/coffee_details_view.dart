import 'package:coffee_app/core/colors.dart';
import 'package:coffee_app/core/widgets/custom_elevated_button.dart';
import 'package:coffee_app/features/coffee_details/widgets/custom_appbar.dart';
import 'package:coffee_app/features/coffee_details/widgets/custom_readmore_text.dart';
import 'package:coffee_app/features/coffee_details/widgets/custom_toggle_button.dart';
import 'package:coffee_app/features/coffee_details/widgets/custom_toggle_button_list.dart';
import 'package:coffee_app/features/home/model/coffee.dart';
import 'package:coffee_app/core/widgets/custom_container.dart';
import 'package:coffee_app/features/home/view/widgets/custom_nav_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CoffeeDetailsView extends StatelessWidget {
  const CoffeeDetailsView({super.key, required this.coffee});

  final Coffee coffee;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(),
                    Container(
                      width: double.infinity,
                      height: 210,
                      // padding: EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          coffee.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      coffee.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ice/Hot",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xffa3a3a3),
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            CustomContainer(
                              height: 40,
                              width: 40,
                              color: MyColors.white,
                              child: Icon(
                                Icons.delivery_dining_rounded,
                                color: Color(0xffc67c4e),
                                size: 25,
                              ),
                            ),
                            SizedBox(width: 10),
                            CustomContainer(
                              height: 40,
                              width: 40,
                              color: MyColors.white,
                              child: Icon(
                                FontAwesomeIcons.mugHot,
                                color: Color(0xffc67c4e),
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 10),
                            CustomContainer(
                              height: 40,
                              width: 40,
                              color: MyColors.white,
                              child: Icon(
                                FontAwesomeIcons.bottleWater,
                                color: Color(0xffc67c4e),
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.amber,
                          size: 27,
                        ),
                        Text(
                          "${coffee.rating}",
                          style: TextStyle(
                            fontSize: 18,
                            color: MyColors.black,
                          ),
                        ),
                        Text(
                          "(230)",
                          style: TextStyle(
                            color: Color(0xffa3a3a3),
                            fontSize: 11,
                          ),
                        )
                      ],
                    ),
                    Divider(thickness: 1.5, color: Colors.black12),
                    Text(
                      "Description",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                        child: CustomReadMoreText(text: coffee.description)),
                    SizedBox(height: 10),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Size",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 10),
                        CustomToggleButtonList(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        "Price",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffa3a3a3),
                        ),
                      ),
                      Text(
                        "\$ ${coffee.price}",
                        style: TextStyle(fontSize: 16, color: MyColors.orange),
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                    color: MyColors.orange,
                    minimumSize: Size(230, 55),
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
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

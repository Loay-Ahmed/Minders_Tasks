import 'package:coffee_app/features/home/model/dummy_data.dart';
import 'package:coffee_app/features/home/view/widgets/coffee_list.dart';
import 'package:coffee_app/features/home/view/widgets/custom_coffee_card.dart';
import 'package:coffee_app/core/widgets/custom_container.dart';
import 'package:coffee_app/features/home/view/widgets/custom_menu.dart';
import 'package:coffee_app/features/home/view/widgets/custom_nav_bar.dart';
import 'package:coffee_app/features/home/view/widgets/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/core/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomMenu(),
                              ],
                            ),
                            Spacer(),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(
                                "assets/profile.jpg",
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 3,
                              child: CustomSearch(),
                            ),
                            SizedBox(width: 15),
                            CustomContainer(
                              child: Icon(
                                Icons.tune_rounded,
                                color: Color(0xffe3e3e3),
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 80),
                CustomCoffeeList(),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 250,
                    ),
                    // padding: EdgeInsets.symmetric(horizontal: 20),
                    physics: BouncingScrollPhysics(),
                    itemCount: 6,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      return CustomCoffeeCard(
                          coffee: DummyData.dummyData[index]);
                    },
                  ),
                ),
                SizedBox(height: 2),
                CustomNavBar(),
              ],
            ),
            Positioned(
              top: 172,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/promo.png",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:coffee_app/features/home/view/widgets/coffee_list.dart';
import 'package:coffee_app/features/home/view/widgets/custom_coffee_card.dart';
import 'package:coffee_app/features/home/view/widgets/custom_container.dart';
import 'package:coffee_app/features/home/view/widgets/custom_menu.dart';
import 'package:coffee_app/features/home/view/widgets/custom_search.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

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
                    color: Color(0xff313131),
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
                      return CustomCoffeeCard();
                    },
                  ),
                ),
                SizedBox(height: 2),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selectedIndex = 0;
                                });
                              },
                              padding: EdgeInsets.zero,
                              alignment: Alignment.bottomCenter,
                              icon: Icon(
                                selectedIndex == 0
                                    ? Icons.home_rounded
                                    : Icons.home_outlined,
                                size: 30,
                                color: selectedIndex == 0
                                    ? Color(0xffc67c4e)
                                    : Color(0xffe3e3e3),
                              ),
                            ),
                            if (selectedIndex == 0)
                              Container(
                                width: 10,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Color(0xffc67c4e),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selectedIndex = 1;
                                });
                              },
                              padding: EdgeInsets.zero,
                              alignment: Alignment.bottomCenter,
                              icon: Icon(
                                selectedIndex == 1
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                                size: 30,
                                color: selectedIndex == 1
                                    ? Color(0xffc67c4e)
                                    : Color(0xffe3e3e3),
                              ),
                            ),
                            if (selectedIndex == 1)
                              Container(
                                width: 10,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Color(0xffc67c4e),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selectedIndex = 2;
                                });
                              },
                              padding: EdgeInsets.zero,
                              alignment: Alignment.bottomCenter,
                              icon: Icon(
                                selectedIndex == 2
                                    ? Icons.shopping_bag
                                    : Icons.shopping_bag_outlined,
                                size: 30,
                                color: selectedIndex == 2
                                    ? Color(0xffc67c4e)
                                    : Color(0xffe3e3e3),
                              ),
                            ),
                            if (selectedIndex == 2)
                              Container(
                                width: 10,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Color(0xffc67c4e),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selectedIndex = 3;
                                });
                              },
                              padding: EdgeInsets.zero,
                              alignment: Alignment.bottomCenter,
                              icon: Icon(
                                selectedIndex == 3
                                    ? Icons.notifications
                                    : Icons.notifications_none_outlined,
                                size: 30,
                                color: selectedIndex == 3
                                    ? Color(0xffc67c4e)
                                    : Color(0xffe3e3e3),
                              ),
                            ),
                            if (selectedIndex == 3)
                              Container(
                                width: 10,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Color(0xffc67c4e),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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

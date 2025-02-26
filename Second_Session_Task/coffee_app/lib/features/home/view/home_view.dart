import 'package:coffee_app/features/home/model/dummy_data.dart';
import 'package:coffee_app/features/home/view/widgets/coffee_list.dart';
import 'package:coffee_app/features/home/view/widgets/custom_coffee_card.dart';
import 'package:coffee_app/core/widgets/custom_container.dart';
import 'package:coffee_app/features/home/view/widgets/custom_menu.dart';
import 'package:coffee_app/features/home/view/widgets/custom_nav_bar.dart';
import 'package:coffee_app/features/home/view/widgets/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/core/colors.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
      ),
    );

    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          // Detects scroll changes for better performance (Optional)
          return false;
        },
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: MyColors.black,
              expandedHeight: 294, // Maximum height when expanded
              collapsedHeight: 100, // Minimum height when scrolled
              floating: false, // Stays at the top when scrolling
              pinned: true, // Keeps the app bar visible
              elevation: 0,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  double currentHeight = constraints.maxHeight;

                  return Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20, top: 50),
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
                            Transform.translate(
                              offset: Offset(0, -2.5),
                              child: CircleAvatar(
                                backgroundColor: MyColors.white,
                                child: Transform.scale(
                                  scaleX: 1.15,
                                  scaleY: 1.15,
                                  child: Transform.translate(
                                    offset: Offset(0, 5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.asset(
                                        "assets/profile.png",
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Show search bar only when expandedHeight > 120
                        if (currentHeight > 170) SizedBox(height: 25),
                        if (currentHeight > 200)
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

                        if (currentHeight >= 323)
                          Transform.translate(
                            offset: Offset(0, 74),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/promo.png",
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  CustomCoffeeList(),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return CustomCoffeeCard(coffee: DummyData.dummyData[index]);
                  },
                  childCount: 6,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 250,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 2),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

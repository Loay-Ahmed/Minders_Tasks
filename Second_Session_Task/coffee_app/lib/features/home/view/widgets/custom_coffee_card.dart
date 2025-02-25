import 'package:coffee_app/core/colors.dart';
import 'package:coffee_app/features/coffee_details/view/coffee_details_view.dart';
import 'package:coffee_app/features/home/model/coffee.dart';
import 'package:coffee_app/core/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class CustomCoffeeCard extends StatelessWidget {
  const CustomCoffeeCard({
    super.key,
    required this.coffee,
  });

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoffeeDetailsView(coffee: coffee),
          ),
        );
      },
      child: Container(
        width: 200,
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    coffee.image,
                    width: 200,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 55,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.amber,
                        size: 15,
                      ),
                      Text(
                        coffee.rating.toString(),
                        style: TextStyle(
                          fontSize: 10,
                          color: MyColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              coffee.name,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              coffee.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xffa3a3a3),
                fontSize: 10,
              ),
            ),
            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ ${coffee.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                CustomContainer(
                  width: 30,
                  height: 30,
                  child: Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

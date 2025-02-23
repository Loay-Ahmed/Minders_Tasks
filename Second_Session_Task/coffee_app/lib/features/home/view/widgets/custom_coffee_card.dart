import 'package:coffee_app/features/home/view/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class CustomCoffeeCard extends StatelessWidget {
  const CustomCoffeeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  "assets/coffee_four.jpeg",
                  width: 200,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 55,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white10,
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
                      Icons.star,
                      color: Colors.yellow,
                      size: 15,
                    ),
                    Text(
                      "4.6",
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xffe3e3e3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Caffe Mocha",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Deep Foam",
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
                "\$ 4.53",
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
    );
  }
}

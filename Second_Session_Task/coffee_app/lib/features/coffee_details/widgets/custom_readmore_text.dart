import 'package:coffee_app/core/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CustomReadMoreText extends StatefulWidget {
  const CustomReadMoreText({super.key, required this.text});

  final String text;

  @override
  State<CustomReadMoreText> createState() => _CustomReadMoreTextState();
}

class _CustomReadMoreTextState extends State<CustomReadMoreText> {
  bool isExpanded = false;
  void toggle() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ReadMoreText(
            widget.text,
            isExpandable: true,
            trimCollapsedText: "Read more",
            trimExpandedText: " Read less",
            style: TextStyle(
              fontSize: 13,
              color: Color(0xffa3a3a3),
              fontWeight: FontWeight.w600,
            ),
            lessStyle: TextStyle(
                color: MyColors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 13),
            moreStyle: TextStyle(
                color: MyColors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 13),
            trimLines: 3,
            trimMode: TrimMode.Line,
          ),
          // Text(
          //   widget.text,
          //   style: TextStyle(
          //     fontSize: 13,
          //     color: Color(0xffa3a3a3),
          //   ),
          //   maxLines: isExpanded ? 20 : 3,
          //   overflow: TextOverflow.ellipsis,
          // ),
          // GestureDetector(
          //   onTap: toggle,
          //   child: Text(
          //     isExpanded ? "Read less" : "Read more",
          //     style: TextStyle(
          //       fontSize: 15,
          //       color: MyColors.orange,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

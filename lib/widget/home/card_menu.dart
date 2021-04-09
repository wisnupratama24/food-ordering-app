import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering_app/constants/color.dart';

class CardMenu extends StatelessWidget {
  final String foodName;
  final String svgSrc;
  final String restourant;

  const CardMenu({
    Key key,
    @required this.size,
    @required this.foodName,
    @required this.svgSrc,
    @required this.restourant,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.2),
              blurRadius: 8.0,
              spreadRadius: 0.0,
              offset: Offset(0, 4))
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(8),
            width: size.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryColor.withOpacity(0.13)),
                  child: SvgPicture.asset(
                    svgSrc,
                    width: size.width * 0.25,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  foodName,
                  style: TextStyle(color: Colors.grey[500]),
                ),
                Text(
                  restourant,
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

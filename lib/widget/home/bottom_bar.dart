import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ordering_app/screens/detail/detail_screen.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 60,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: Offset(0, -7),
            color: Color(0xFF6DAED9).withOpacity(0.11),
            blurRadius: 23)
      ]),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              icon: SvgPicture.asset('assets/icons/home.svg'),
              onPressed: () {}),
          IconButton(
              icon: SvgPicture.asset('assets/icons/Following.svg'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen();
                }));
              }),
          IconButton(
              icon: SvgPicture.asset('assets/icons/Glyph.svg'),
              onPressed: () {}),
          IconButton(
              icon: SvgPicture.asset('assets/icons/person.svg'),
              onPressed: () {})
        ],
      ),
    );
  }
}

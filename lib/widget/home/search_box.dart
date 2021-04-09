import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering_app/constants/color.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        margin: EdgeInsets.only(top: 10),
        width: size.width * 0.90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kSecondaryColor.withOpacity(0.32))),
        child: TextField(
          decoration: InputDecoration(
              icon: SvgPicture.asset('assets/icons/search.svg'),
              hintText: 'Search Here...',
              border: InputBorder.none),
        ),
      ),
    );
  }
}

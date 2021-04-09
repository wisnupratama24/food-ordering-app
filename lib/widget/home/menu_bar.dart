import 'package:flutter/material.dart';
import 'package:food_ordering_app/constants/color.dart';

class MenuBar extends StatefulWidget {
  final String title;
  final bool isActive;
  final Function press;
  const MenuBar({Key key, this.title, this.isActive, this.press})
      : super(key: key);

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: widget.isActive ? FontWeight.bold : FontWeight.w400,
                color: widget.isActive ? Colors.black : Colors.grey[400],
              ),
            ),
            if (widget.isActive)
              Container(
                  margin: EdgeInsets.only(top: 5),
                  height: 3,
                  width: 30,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10)))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering_app/constants/color.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/menu.svg'),
        onPressed: () {},
      ),
      title: Center(
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Punk ',
                style: Theme.of(context).textTheme.headline6.copyWith(
                    fontWeight: FontWeight.w600, color: kTextLightColor)),
            TextSpan(
                text: 'Food',
                style: Theme.of(context).textTheme.headline6.copyWith(
                    fontWeight: FontWeight.w600, color: kPrimaryColor))
          ]),
        ),
      ),
      actions: [
        IconButton(
            icon: SvgPicture.asset('assets/icons/notification.svg'),
            onPressed: () {})
      ],
    );
  }
}

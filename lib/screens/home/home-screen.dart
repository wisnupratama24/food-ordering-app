import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering_app/constants/color.dart';
import 'package:food_ordering_app/models/menu.dart';
import 'package:food_ordering_app/widget/home/appbar.dart';
import 'package:food_ordering_app/widget/home/bottom_bar.dart';
import 'package:food_ordering_app/widget/home/card_menu.dart';
import 'package:food_ordering_app/widget/home/menu_bar.dart';
import 'package:food_ordering_app/widget/home/search_box.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> menuBar = ['Combo Meal', 'Chicken', 'French Fries', 'Hamburger'];
  List<MenuModel> cardMenu = [
    MenuModel('Burger & Beer', 'assets/icons/burger_beer.svg', 'Mc Donald'),
    MenuModel(
        'Chineese Noodles', 'assets/icons/chinese_noodles.svg', "Wendy's"),
    MenuModel('Burger & Beer', 'assets/icons/burger_beer.svg', 'Mc Donald'),
  ];

  List<bool> _selected = List.generate(4, (i) => i == 0 ? true : false);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarHome(),
      ),
      bottomNavigationBar: BottomBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBox(size: size),
              Container(
                height: 30,
                margin: EdgeInsets.only(top: 20),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: menuBar.length,
                    itemBuilder: (context, index) {
                      return MenuBar(
                        title: menuBar[index].toString(),
                        isActive: _selected[index] ? true : false,
                        press: () {
                          for (int i = 0; i < _selected.length; i++) {
                            if (i == index) {
                              setState(() {
                                _selected[index] = true;
                              });
                            } else {
                              setState(() {
                                _selected[i] = false;
                              });
                            }
                          }
                        },
                      );
                    }),
              ),
              Container(
                  height: size.height * 0.32,
                  width: size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cardMenu.length,
                      itemBuilder: (context, index) {
                        var jsonMenu = cardMenu[index];
                        return CardMenu(
                          foodName: jsonMenu.foodName,
                          svgSrc: jsonMenu.svg,
                          restourant: jsonMenu.restaurant,
                          size: size,
                        );
                      })),
              Container(
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Offers & Discount',
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 14)),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      width: size.width,
                      height: size.height * 0.22,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                'assets/images/beyond-meat-mcdonalds.png'),
                          )),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            Color(0xFFFF961F).withOpacity(0.7),
                            kPrimaryColor.withOpacity(0.8)
                          ]),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: SvgPicture.asset(
                              'assets/icons/macdonalds.svg',
                            )),
                            Expanded(
                                child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: "Get discount of \n",
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextSpan(
                                    text: "30%",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                              ]),
                            ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

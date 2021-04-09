import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering_app/constants/color.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), child: AppBarDetail()),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              ItemImage(size: size),
              Container(
                padding: EdgeInsets.all(20),
                height: size.height * 0.55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Column(
                  children: [
                    ShopName(),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cheese Burger',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey[700]),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SmoothStarRating(
                                    borderColor: kPrimaryColor,
                                    rating: 4,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '24 Reviews',
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ],
                          )),
                          ClipPath(
                            clipper: PricerCliper(),
                            child: Container(
                              width: 60,
                              height: 60,
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                              ),
                              child: Text(
                                "\$16",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed',
                        style: TextStyle(height: 1.6, color: Colors.grey[500]),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: FlatButton.icon(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/icons/bag.svg'),
                          label: Text(
                            'Order Now',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )),
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

class PricerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double ignoreHeight = 20;
    path.lineTo(0, size.height - ignoreHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ShopName extends StatelessWidget {
  const ShopName({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: kSecondaryColor,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Mc\'s Donalds',
          style: TextStyle(color: kSecondaryColor),
        )
      ],
    );
  }
}

class ItemImage extends StatelessWidget {
  const ItemImage({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.35,
      decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage(
                'assets/images/burger.png',
              ),
              fit: BoxFit.cover)),
    );
  }
}

class AppBarDetail extends StatelessWidget {
  const AppBarDetail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
            icon: SvgPicture.asset('assets/icons/share.svg'), onPressed: () {}),
        IconButton(
            icon: SvgPicture.asset('assets/icons/more.svg'), onPressed: () {}),
      ],
    );
  }
}

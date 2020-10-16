import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watches/model/watch.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key key, @required this.watch}) : super(key: key);

  final Watch watch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _image(),
          SizedBox(height: 36),
          _name(context),
          SizedBox(height: 12),
          _price(context),
          SizedBox(height: 24),
          _description(context),
          SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              children: [
                _buyButton(),
                SizedBox(width: 16),
                _heartButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _image() => AspectRatio(
        aspectRatio: 375 / 500,
        child: Image.asset(
          watch.image,
          fit: BoxFit.cover,
        ),
      );

  Widget _name(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 28, right: 72),
        child: Text(
          watch.name.toUpperCase(),
          style: Theme.of(context).textTheme.headline5.copyWith(
                fontWeight: FontWeight.w500,
                color: Color(0xFF020102),
                letterSpacing: 3,
              ),
        ),
      );

  Widget _price(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 28, right: 72),
        child: Text(
          '\$${watch.price}',
          style: Theme.of(context).textTheme.headline5.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.w300,
                color: Color(0xFF020102),
              ),
        ),
      );

  Widget _description(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 28, right: 72),
        child: Text(
          watch.description,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      );

  Widget _buyButton() => Expanded(
        child: Container(
          height: 48,
          child: FlatButton(
            child: Text('BUY NOW'),
            color: Color(0xFFD5A587),
            textColor: Colors.white,
            onPressed: () {},
          ),
        ),
      );

  Widget _heartButton() => Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.1)),
        ),
        child: IconButton(
          icon: SvgPicture.asset('assets/heart-icon.svg'),
          onPressed: () {},
        ),
      );
}

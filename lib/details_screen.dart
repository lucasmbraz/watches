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
          _name(),
          SizedBox(height: 12),
          _price(),
          SizedBox(height: 24),
          _description(),
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

  Widget _name() => Padding(
        padding: const EdgeInsets.only(left: 28, right: 72),
        child: Text(watch.name),
      );

  Widget _price() => Padding(
        padding: const EdgeInsets.only(left: 28, right: 72),
        child: Text('\$${watch.price}'),
      );

  Widget _description() => Padding(
        padding: const EdgeInsets.only(left: 28, right: 72),
        child: Text(watch.description),
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

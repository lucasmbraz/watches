import 'package:flutter/material.dart';
import 'package:watches/model/watch.dart';

import 'model/dummy_data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watches'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _carousel(),
    );
  }

  Widget _carousel() => Container(
        height: 280,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          scrollDirection: Axis.horizontal,
          itemCount: watches.length,
          itemBuilder: (context, index) {
            final watch = watches[index];
            return _carouselItem(context, watch);
          },
          separatorBuilder: (context, index) => SizedBox(width: 24),
        ),
      );

  Widget _carouselItem(BuildContext context, Watch watch) => Stack(
        children: [
          _carouselImage(watch),
          _watchDetails(context, watch),
        ],
      );

  Widget _carouselImage(Watch watch) => Container(
        width: 240,
        child: Image.asset(
          watch.image,
          fit: BoxFit.cover,
        ),
      );

  Widget _watchDetails(BuildContext context, Watch watch) => Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              watch.name,
              style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              '\$${watch.price}',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ],
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:watches/details_screen.dart';
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
      body: Column(
        children: [
          _carousel(),
          SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discover',
                  style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w600),
                ),
                Container(
                  width: 20,
                  height: 2,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              itemCount: watches.length,
              itemBuilder: (context, index) {
                final watch = watches[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    height: 110,
                    color: Color(0xFFF4F4F4),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: Image.asset(
                              watch.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    watch.name,
                                    style: Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    '${watch.color.toString().split('.').last}, size ${watch.size.toString().split('.').last}',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            '\$${watch.price}',
                            style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 24),
            ),
          ),
        ],
      ),
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

  Widget _carouselItem(BuildContext context, Watch watch) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => DetailsScreen(watch: watch),
              barrierColor: Colors.white,
              transitionDuration: Duration(milliseconds: 600),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurvedAnimation(parent: animation, curve: Interval(0.65, 1, curve: Curves.easeIn)),
                  child: child,
                );
              },
            ),
          );
        },
        child: Stack(
          children: [
            _carouselImage(watch),
            _watchDetails(context, watch),
          ],
        ),
      );

  Widget _carouselImage(Watch watch) => Container(
        width: 240,
        child: Hero(
          tag: watch.name,
          child: Image.asset(
            watch.coverImage,
            fit: BoxFit.cover,
          ),
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

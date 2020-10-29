import 'package:flutter/material.dart';
import 'package:watches/details_screen.dart';
import 'package:watches/model/watch.dart';
import 'package:watches/watch_carousel.dart';
import 'package:watches/watch_list_item.dart';

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
          _carousel(context),
          SizedBox(height: 48),
          _discoverHeader(context),
          SizedBox(height: 24),
          _watchList(),
        ],
      ),
    );
  }

  Widget _carousel(BuildContext context) => WatchCarousel(
        onWatchTapped: (watch) => _onWatchTapped(context, watch),
      );

  void _onWatchTapped(BuildContext context, Watch watch) {
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
  }

  Widget _discoverHeader(BuildContext context) => Padding(
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
      );

  Widget _watchList() => Expanded(
        child: ListView.separated(
          itemCount: watches.length,
          itemBuilder: (context, index) {
            final watch = watches[index];
            return WatchListItem(watch: watch);
          },
          separatorBuilder: (context, index) => SizedBox(height: 24),
        ),
      );
}

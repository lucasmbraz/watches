import 'package:flutter/material.dart';
import 'package:watches/model/dummy_data.dart';
import 'package:watches/model/watch.dart';
import 'package:watches/watch_carousel_item.dart';

class WatchCarousel extends StatelessWidget {
  const WatchCarousel({
    Key key,
    @required this.onWatchTapped,
  }) : super(key: key);

  final TapWatchCallback onWatchTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: watches.length,
        itemBuilder: (context, index) {
          final watch = watches[index];
          return _item(watch);
        },
        separatorBuilder: (context, index) => SizedBox(width: 24),
      ),
    );
  }

  Widget _item(Watch watch) => WatchCarouselItem(
        watch: watch,
        onWatchTapped: onWatchTapped,
      );
}

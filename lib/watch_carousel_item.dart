import 'package:flutter/material.dart';
import 'package:watches/model/watch.dart';

typedef TapWatchCallback = void Function(Watch watch);

class WatchCarouselItem extends StatelessWidget {
  const WatchCarouselItem({
    Key key,
    @required this.watch,
    @required this.onWatchTapped,
  }) : super(key: key);

  final Watch watch;
  final TapWatchCallback onWatchTapped;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onWatchTapped(watch),
      child: Stack(
        children: [
          _carouselImage(watch),
          _watchDetails(context, watch),
        ],
      ),
    );
  }

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

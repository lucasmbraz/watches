import 'package:flutter/material.dart';
import 'package:watches/model/watch.dart';

class WatchListItem extends StatelessWidget {
  const WatchListItem({
    Key key,
    @required this.watch,
  }) : super(key: key);

  final Watch watch;

  @override
  Widget build(BuildContext context) {
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
  }
}

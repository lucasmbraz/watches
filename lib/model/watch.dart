import 'package:freezed_annotation/freezed_annotation.dart';

part 'watch.freezed.dart';

enum WatchSize { S, M, L }
enum WatchColor { Black, White }

@freezed
abstract class Watch with _$Watch {
  const factory Watch({
    @required String name,
    @required String description,
    @required String image,
    @required String coverImage,
    @required WatchSize size,
    @required WatchColor color,
    @required int price,
  }) = _Watch;
}

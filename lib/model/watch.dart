import 'package:freezed_annotation/freezed_annotation.dart';

part 'watch.freezed.dart';

@freezed
abstract class Watch with _$Watch {
  const factory Watch({
    @required String name,
    @required String description,
    @required String image,
    @required int price,
  }) = _Watch;
}

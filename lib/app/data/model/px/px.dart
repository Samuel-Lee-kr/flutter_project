import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'px.g.dart';
part 'px.freezed.dart';

@freezed
class Px with _$Px {
  factory Px({
    required String category,
    required String company,
    required String name,
    required String detail,
    required String image,
    required int price,
    required int rank,
  }) = _Px;

  factory Px.fromJson(Map<String, dynamic> json) => _$PxFromJson(json);
}
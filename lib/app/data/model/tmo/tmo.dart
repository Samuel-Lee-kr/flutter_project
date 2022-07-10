import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tmo.g.dart';
part 'tmo.freezed.dart';

@freezed
class Tmo with _$Tmo {
  factory Tmo({
    required String oprtime,
    required String gnrltelno,
    required String pstnexpln,
    required String tmo_nm,
    required String rowno,
    required String rmrk,
    required String area,
    required String gun_telno,
    required double latitude,
    required double longitude,
  }) = _Tmo;

  factory Tmo.fromJson(Map<String, dynamic> json) => _$TmoFromJson(json);
}
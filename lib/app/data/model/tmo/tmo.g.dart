// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tmo _$$_TmoFromJson(Map<String, dynamic> json) => _$_Tmo(
      oprtime: json['oprtime'] as String,
      gnrltelno: json['gnrltelno'] as String,
      pstnexpln: json['pstnexpln'] as String,
      tmo_nm: json['tmo_nm'] as String,
      rowno: json['rowno'] as String,
      rmrk: json['rmrk'] as String,
      area: json['area'] as String,
      gun_telno: json['gun_telno'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$_TmoToJson(_$_Tmo instance) => <String, dynamic>{
      'oprtime': instance.oprtime,
      'gnrltelno': instance.gnrltelno,
      'pstnexpln': instance.pstnexpln,
      'tmo_nm': instance.tmo_nm,
      'rowno': instance.rowno,
      'rmrk': instance.rmrk,
      'area': instance.area,
      'gun_telno': instance.gun_telno,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

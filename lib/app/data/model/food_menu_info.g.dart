// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_menu_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FoodMenuInfo _$$_FoodMenuInfoFromJson(Map<String, dynamic> json) =>
    _$_FoodMenuInfo(
      imagePath: json['imagePath'] as String,
      titleTxt: json['titleTxt'] as String,
      kacl: json['kacl'] as String,
      meals: (json['meals'] as List<dynamic>).map((e) => e as String).toList(),
      startColor: json['startColor'] as String,
      endColor: json['endColor'] as String,
    );

Map<String, dynamic> _$$_FoodMenuInfoToJson(_$_FoodMenuInfo instance) =>
    <String, dynamic>{
      'imagePath': instance.imagePath,
      'titleTxt': instance.titleTxt,
      'kacl': instance.kacl,
      'meals': instance.meals,
      'startColor': instance.startColor,
      'endColor': instance.endColor,
    };

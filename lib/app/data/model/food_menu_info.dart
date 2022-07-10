import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_menu_info.freezed.dart';

part 'food_menu_info.g.dart';

@freezed
class FoodMenuInfo with _$FoodMenuInfo {
  factory FoodMenuInfo({
    required String imagePath,
    required String titleTxt,
    required String kacl,
    required List<String> meals,
    required String startColor,
    required String endColor,
  }) = _FoodMenuInfo;

  factory FoodMenuInfo.fromJson(Map<String, dynamic> json) =>
      _$FoodMenuInfoFromJson(json);
}

/*
      imagePath: 'assets/images/breakfast.png',
      titleTxt: '조식',
      kacl: 525,
      meals: <String>['밥22,', '느타리버섯국,', '호박쇠고기볶음,', '두부조림,', '깍두기', '스트링치즈'],
      startColor: '#7de83a',
      endColor: '#536349',



**/
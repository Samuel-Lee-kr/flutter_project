// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food_menu_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FoodMenuInfo _$FoodMenuInfoFromJson(Map<String, dynamic> json) {
  return _FoodMenuInfo.fromJson(json);
}

/// @nodoc
class _$FoodMenuInfoTearOff {
  const _$FoodMenuInfoTearOff();

  _FoodMenuInfo call(
      {required String imagePath,
      required String titleTxt,
      required String kacl,
      required List<String> meals,
      required String startColor,
      required String endColor}) {
    return _FoodMenuInfo(
      imagePath: imagePath,
      titleTxt: titleTxt,
      kacl: kacl,
      meals: meals,
      startColor: startColor,
      endColor: endColor,
    );
  }

  FoodMenuInfo fromJson(Map<String, Object?> json) {
    return FoodMenuInfo.fromJson(json);
  }
}

/// @nodoc
const $FoodMenuInfo = _$FoodMenuInfoTearOff();

/// @nodoc
mixin _$FoodMenuInfo {
  String get imagePath => throw _privateConstructorUsedError;
  String get titleTxt => throw _privateConstructorUsedError;
  String get kacl => throw _privateConstructorUsedError;
  List<String> get meals => throw _privateConstructorUsedError;
  String get startColor => throw _privateConstructorUsedError;
  String get endColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodMenuInfoCopyWith<FoodMenuInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodMenuInfoCopyWith<$Res> {
  factory $FoodMenuInfoCopyWith(
          FoodMenuInfo value, $Res Function(FoodMenuInfo) then) =
      _$FoodMenuInfoCopyWithImpl<$Res>;
  $Res call(
      {String imagePath,
      String titleTxt,
      String kacl,
      List<String> meals,
      String startColor,
      String endColor});
}

/// @nodoc
class _$FoodMenuInfoCopyWithImpl<$Res> implements $FoodMenuInfoCopyWith<$Res> {
  _$FoodMenuInfoCopyWithImpl(this._value, this._then);

  final FoodMenuInfo _value;
  // ignore: unused_field
  final $Res Function(FoodMenuInfo) _then;

  @override
  $Res call({
    Object? imagePath = freezed,
    Object? titleTxt = freezed,
    Object? kacl = freezed,
    Object? meals = freezed,
    Object? startColor = freezed,
    Object? endColor = freezed,
  }) {
    return _then(_value.copyWith(
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      titleTxt: titleTxt == freezed
          ? _value.titleTxt
          : titleTxt // ignore: cast_nullable_to_non_nullable
              as String,
      kacl: kacl == freezed
          ? _value.kacl
          : kacl // ignore: cast_nullable_to_non_nullable
              as String,
      meals: meals == freezed
          ? _value.meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<String>,
      startColor: startColor == freezed
          ? _value.startColor
          : startColor // ignore: cast_nullable_to_non_nullable
              as String,
      endColor: endColor == freezed
          ? _value.endColor
          : endColor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FoodMenuInfoCopyWith<$Res>
    implements $FoodMenuInfoCopyWith<$Res> {
  factory _$FoodMenuInfoCopyWith(
          _FoodMenuInfo value, $Res Function(_FoodMenuInfo) then) =
      __$FoodMenuInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String imagePath,
      String titleTxt,
      String kacl,
      List<String> meals,
      String startColor,
      String endColor});
}

/// @nodoc
class __$FoodMenuInfoCopyWithImpl<$Res> extends _$FoodMenuInfoCopyWithImpl<$Res>
    implements _$FoodMenuInfoCopyWith<$Res> {
  __$FoodMenuInfoCopyWithImpl(
      _FoodMenuInfo _value, $Res Function(_FoodMenuInfo) _then)
      : super(_value, (v) => _then(v as _FoodMenuInfo));

  @override
  _FoodMenuInfo get _value => super._value as _FoodMenuInfo;

  @override
  $Res call({
    Object? imagePath = freezed,
    Object? titleTxt = freezed,
    Object? kacl = freezed,
    Object? meals = freezed,
    Object? startColor = freezed,
    Object? endColor = freezed,
  }) {
    return _then(_FoodMenuInfo(
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      titleTxt: titleTxt == freezed
          ? _value.titleTxt
          : titleTxt // ignore: cast_nullable_to_non_nullable
              as String,
      kacl: kacl == freezed
          ? _value.kacl
          : kacl // ignore: cast_nullable_to_non_nullable
              as String,
      meals: meals == freezed
          ? _value.meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<String>,
      startColor: startColor == freezed
          ? _value.startColor
          : startColor // ignore: cast_nullable_to_non_nullable
              as String,
      endColor: endColor == freezed
          ? _value.endColor
          : endColor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FoodMenuInfo implements _FoodMenuInfo {
  _$_FoodMenuInfo(
      {required this.imagePath,
      required this.titleTxt,
      required this.kacl,
      required this.meals,
      required this.startColor,
      required this.endColor});

  factory _$_FoodMenuInfo.fromJson(Map<String, dynamic> json) =>
      _$$_FoodMenuInfoFromJson(json);

  @override
  final String imagePath;
  @override
  final String titleTxt;
  @override
  final String kacl;
  @override
  final List<String> meals;
  @override
  final String startColor;
  @override
  final String endColor;

  @override
  String toString() {
    return 'FoodMenuInfo(imagePath: $imagePath, titleTxt: $titleTxt, kacl: $kacl, meals: $meals, startColor: $startColor, endColor: $endColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FoodMenuInfo &&
            const DeepCollectionEquality().equals(other.imagePath, imagePath) &&
            const DeepCollectionEquality().equals(other.titleTxt, titleTxt) &&
            const DeepCollectionEquality().equals(other.kacl, kacl) &&
            const DeepCollectionEquality().equals(other.meals, meals) &&
            const DeepCollectionEquality()
                .equals(other.startColor, startColor) &&
            const DeepCollectionEquality().equals(other.endColor, endColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imagePath),
      const DeepCollectionEquality().hash(titleTxt),
      const DeepCollectionEquality().hash(kacl),
      const DeepCollectionEquality().hash(meals),
      const DeepCollectionEquality().hash(startColor),
      const DeepCollectionEquality().hash(endColor));

  @JsonKey(ignore: true)
  @override
  _$FoodMenuInfoCopyWith<_FoodMenuInfo> get copyWith =>
      __$FoodMenuInfoCopyWithImpl<_FoodMenuInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FoodMenuInfoToJson(this);
  }
}

abstract class _FoodMenuInfo implements FoodMenuInfo {
  factory _FoodMenuInfo(
      {required String imagePath,
      required String titleTxt,
      required String kacl,
      required List<String> meals,
      required String startColor,
      required String endColor}) = _$_FoodMenuInfo;

  factory _FoodMenuInfo.fromJson(Map<String, dynamic> json) =
      _$_FoodMenuInfo.fromJson;

  @override
  String get imagePath;
  @override
  String get titleTxt;
  @override
  String get kacl;
  @override
  List<String> get meals;
  @override
  String get startColor;
  @override
  String get endColor;
  @override
  @JsonKey(ignore: true)
  _$FoodMenuInfoCopyWith<_FoodMenuInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

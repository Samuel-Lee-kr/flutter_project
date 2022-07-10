// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'px.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Px _$PxFromJson(Map<String, dynamic> json) {
  return _Px.fromJson(json);
}

/// @nodoc
mixin _$Px {
  String get category => throw _privateConstructorUsedError;
  String get company => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PxCopyWith<Px> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PxCopyWith<$Res> {
  factory $PxCopyWith(Px value, $Res Function(Px) then) =
      _$PxCopyWithImpl<$Res>;
  $Res call(
      {String category,
      String company,
      String name,
      String detail,
      String image,
      int price,
      int rank});
}

/// @nodoc
class _$PxCopyWithImpl<$Res> implements $PxCopyWith<$Res> {
  _$PxCopyWithImpl(this._value, this._then);

  final Px _value;
  // ignore: unused_field
  final $Res Function(Px) _then;

  @override
  $Res call({
    Object? category = freezed,
    Object? company = freezed,
    Object? name = freezed,
    Object? detail = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? rank = freezed,
  }) {
    return _then(_value.copyWith(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      company: company == freezed
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      detail: detail == freezed
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_PxCopyWith<$Res> implements $PxCopyWith<$Res> {
  factory _$$_PxCopyWith(_$_Px value, $Res Function(_$_Px) then) =
      __$$_PxCopyWithImpl<$Res>;
  @override
  $Res call(
      {String category,
      String company,
      String name,
      String detail,
      String image,
      int price,
      int rank});
}

/// @nodoc
class __$$_PxCopyWithImpl<$Res> extends _$PxCopyWithImpl<$Res>
    implements _$$_PxCopyWith<$Res> {
  __$$_PxCopyWithImpl(_$_Px _value, $Res Function(_$_Px) _then)
      : super(_value, (v) => _then(v as _$_Px));

  @override
  _$_Px get _value => super._value as _$_Px;

  @override
  $Res call({
    Object? category = freezed,
    Object? company = freezed,
    Object? name = freezed,
    Object? detail = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? rank = freezed,
  }) {
    return _then(_$_Px(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      company: company == freezed
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      detail: detail == freezed
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Px implements _Px {
  _$_Px(
      {required this.category,
      required this.company,
      required this.name,
      required this.detail,
      required this.image,
      required this.price,
      required this.rank});

  factory _$_Px.fromJson(Map<String, dynamic> json) => _$$_PxFromJson(json);

  @override
  final String category;
  @override
  final String company;
  @override
  final String name;
  @override
  final String detail;
  @override
  final String image;
  @override
  final int price;
  @override
  final int rank;

  @override
  String toString() {
    return 'Px(category: $category, company: $company, name: $name, detail: $detail, image: $image, price: $price, rank: $rank)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Px &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.company, company) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.detail, detail) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.rank, rank));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(company),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(detail),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(rank));

  @JsonKey(ignore: true)
  @override
  _$$_PxCopyWith<_$_Px> get copyWith =>
      __$$_PxCopyWithImpl<_$_Px>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PxToJson(this);
  }
}

abstract class _Px implements Px {
  factory _Px(
      {required final String category,
      required final String company,
      required final String name,
      required final String detail,
      required final String image,
      required final int price,
      required final int rank}) = _$_Px;

  factory _Px.fromJson(Map<String, dynamic> json) = _$_Px.fromJson;

  @override
  String get category;
  @override
  String get company;
  @override
  String get name;
  @override
  String get detail;
  @override
  String get image;
  @override
  int get price;
  @override
  int get rank;
  @override
  @JsonKey(ignore: true)
  _$$_PxCopyWith<_$_Px> get copyWith => throw _privateConstructorUsedError;
}

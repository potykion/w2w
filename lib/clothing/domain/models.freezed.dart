// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Clothing _$ClothingFromJson(Map<String, dynamic> json) {
  return _Clothing.fromJson(json);
}

/// @nodoc
class _$ClothingTearOff {
  const _$ClothingTearOff();

// ignore: unused_element
  _Clothing call(
      {String title = "",
      String type = "",
      String color = "ffffff",
      List<String> images = const []}) {
    return _Clothing(
      title: title,
      type: type,
      color: color,
      images: images,
    );
  }

// ignore: unused_element
  Clothing fromJson(Map<String, Object> json) {
    return Clothing.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Clothing = _$ClothingTearOff();

/// @nodoc
mixin _$Clothing {
  String get title;
  String get type;
  String get color;
  List<String> get images;

  Map<String, dynamic> toJson();
  $ClothingCopyWith<Clothing> get copyWith;
}

/// @nodoc
abstract class $ClothingCopyWith<$Res> {
  factory $ClothingCopyWith(Clothing value, $Res Function(Clothing) then) =
      _$ClothingCopyWithImpl<$Res>;
  $Res call({String title, String type, String color, List<String> images});
}

/// @nodoc
class _$ClothingCopyWithImpl<$Res> implements $ClothingCopyWith<$Res> {
  _$ClothingCopyWithImpl(this._value, this._then);

  final Clothing _value;
  // ignore: unused_field
  final $Res Function(Clothing) _then;

  @override
  $Res call({
    Object title = freezed,
    Object type = freezed,
    Object color = freezed,
    Object images = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      type: type == freezed ? _value.type : type as String,
      color: color == freezed ? _value.color : color as String,
      images: images == freezed ? _value.images : images as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$ClothingCopyWith<$Res> implements $ClothingCopyWith<$Res> {
  factory _$ClothingCopyWith(_Clothing value, $Res Function(_Clothing) then) =
      __$ClothingCopyWithImpl<$Res>;
  @override
  $Res call({String title, String type, String color, List<String> images});
}

/// @nodoc
class __$ClothingCopyWithImpl<$Res> extends _$ClothingCopyWithImpl<$Res>
    implements _$ClothingCopyWith<$Res> {
  __$ClothingCopyWithImpl(_Clothing _value, $Res Function(_Clothing) _then)
      : super(_value, (v) => _then(v as _Clothing));

  @override
  _Clothing get _value => super._value as _Clothing;

  @override
  $Res call({
    Object title = freezed,
    Object type = freezed,
    Object color = freezed,
    Object images = freezed,
  }) {
    return _then(_Clothing(
      title: title == freezed ? _value.title : title as String,
      type: type == freezed ? _value.type : type as String,
      color: color == freezed ? _value.color : color as String,
      images: images == freezed ? _value.images : images as List<String>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Clothing implements _Clothing {
  _$_Clothing(
      {this.title = "",
      this.type = "",
      this.color = "ffffff",
      this.images = const []})
      : assert(title != null),
        assert(type != null),
        assert(color != null),
        assert(images != null);

  factory _$_Clothing.fromJson(Map<String, dynamic> json) =>
      _$_$_ClothingFromJson(json);

  @JsonKey(defaultValue: "")
  @override
  final String title;
  @JsonKey(defaultValue: "")
  @override
  final String type;
  @JsonKey(defaultValue: "ffffff")
  @override
  final String color;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> images;

  @override
  String toString() {
    return 'Clothing(title: $title, type: $type, color: $color, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Clothing &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.images, images) ||
                const DeepCollectionEquality().equals(other.images, images)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(images);

  @override
  _$ClothingCopyWith<_Clothing> get copyWith =>
      __$ClothingCopyWithImpl<_Clothing>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ClothingToJson(this);
  }
}

abstract class _Clothing implements Clothing {
  factory _Clothing(
      {String title,
      String type,
      String color,
      List<String> images}) = _$_Clothing;

  factory _Clothing.fromJson(Map<String, dynamic> json) = _$_Clothing.fromJson;

  @override
  String get title;
  @override
  String get type;
  @override
  String get color;
  @override
  List<String> get images;
  @override
  _$ClothingCopyWith<_Clothing> get copyWith;
}

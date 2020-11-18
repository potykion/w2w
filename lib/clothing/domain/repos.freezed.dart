// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'repos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CreateClothingDTOTearOff {
  const _$CreateClothingDTOTearOff();

// ignore: unused_element
  _CreateClothingDTO call(
      {String title,
      String type,
      String color,
      List<String> imageUrls,
      List<File> imageFiles}) {
    return _CreateClothingDTO(
      title: title,
      type: type,
      color: color,
      imageUrls: imageUrls,
      imageFiles: imageFiles,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $CreateClothingDTO = _$CreateClothingDTOTearOff();

/// @nodoc
mixin _$CreateClothingDTO {
  String get title;
  String get type;
  String get color;
  List<String> get imageUrls;
  List<File> get imageFiles;

  $CreateClothingDTOCopyWith<CreateClothingDTO> get copyWith;
}

/// @nodoc
abstract class $CreateClothingDTOCopyWith<$Res> {
  factory $CreateClothingDTOCopyWith(
          CreateClothingDTO value, $Res Function(CreateClothingDTO) then) =
      _$CreateClothingDTOCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String type,
      String color,
      List<String> imageUrls,
      List<File> imageFiles});
}

/// @nodoc
class _$CreateClothingDTOCopyWithImpl<$Res>
    implements $CreateClothingDTOCopyWith<$Res> {
  _$CreateClothingDTOCopyWithImpl(this._value, this._then);

  final CreateClothingDTO _value;
  // ignore: unused_field
  final $Res Function(CreateClothingDTO) _then;

  @override
  $Res call({
    Object title = freezed,
    Object type = freezed,
    Object color = freezed,
    Object imageUrls = freezed,
    Object imageFiles = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      type: type == freezed ? _value.type : type as String,
      color: color == freezed ? _value.color : color as String,
      imageUrls:
          imageUrls == freezed ? _value.imageUrls : imageUrls as List<String>,
      imageFiles:
          imageFiles == freezed ? _value.imageFiles : imageFiles as List<File>,
    ));
  }
}

/// @nodoc
abstract class _$CreateClothingDTOCopyWith<$Res>
    implements $CreateClothingDTOCopyWith<$Res> {
  factory _$CreateClothingDTOCopyWith(
          _CreateClothingDTO value, $Res Function(_CreateClothingDTO) then) =
      __$CreateClothingDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String type,
      String color,
      List<String> imageUrls,
      List<File> imageFiles});
}

/// @nodoc
class __$CreateClothingDTOCopyWithImpl<$Res>
    extends _$CreateClothingDTOCopyWithImpl<$Res>
    implements _$CreateClothingDTOCopyWith<$Res> {
  __$CreateClothingDTOCopyWithImpl(
      _CreateClothingDTO _value, $Res Function(_CreateClothingDTO) _then)
      : super(_value, (v) => _then(v as _CreateClothingDTO));

  @override
  _CreateClothingDTO get _value => super._value as _CreateClothingDTO;

  @override
  $Res call({
    Object title = freezed,
    Object type = freezed,
    Object color = freezed,
    Object imageUrls = freezed,
    Object imageFiles = freezed,
  }) {
    return _then(_CreateClothingDTO(
      title: title == freezed ? _value.title : title as String,
      type: type == freezed ? _value.type : type as String,
      color: color == freezed ? _value.color : color as String,
      imageUrls:
          imageUrls == freezed ? _value.imageUrls : imageUrls as List<String>,
      imageFiles:
          imageFiles == freezed ? _value.imageFiles : imageFiles as List<File>,
    ));
  }
}

/// @nodoc
class _$_CreateClothingDTO implements _CreateClothingDTO {
  _$_CreateClothingDTO(
      {this.title, this.type, this.color, this.imageUrls, this.imageFiles});

  @override
  final String title;
  @override
  final String type;
  @override
  final String color;
  @override
  final List<String> imageUrls;
  @override
  final List<File> imageFiles;

  @override
  String toString() {
    return 'CreateClothingDTO(title: $title, type: $type, color: $color, imageUrls: $imageUrls, imageFiles: $imageFiles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CreateClothingDTO &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.imageUrls, imageUrls) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrls, imageUrls)) &&
            (identical(other.imageFiles, imageFiles) ||
                const DeepCollectionEquality()
                    .equals(other.imageFiles, imageFiles)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(imageUrls) ^
      const DeepCollectionEquality().hash(imageFiles);

  @override
  _$CreateClothingDTOCopyWith<_CreateClothingDTO> get copyWith =>
      __$CreateClothingDTOCopyWithImpl<_CreateClothingDTO>(this, _$identity);
}

abstract class _CreateClothingDTO implements CreateClothingDTO {
  factory _CreateClothingDTO(
      {String title,
      String type,
      String color,
      List<String> imageUrls,
      List<File> imageFiles}) = _$_CreateClothingDTO;

  @override
  String get title;
  @override
  String get type;
  @override
  String get color;
  @override
  List<String> get imageUrls;
  @override
  List<File> get imageFiles;
  @override
  _$CreateClothingDTOCopyWith<_CreateClothingDTO> get copyWith;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Clothing _$_$_ClothingFromJson(Map<String, dynamic> json) {
  return _$_Clothing(
    title: json['title'] as String ?? '',
    type: json['type'] as String ?? '',
    images: (json['images'] as List)?.map((e) => e as String)?.toList() ?? [],
  );
}

Map<String, dynamic> _$_$_ClothingToJson(_$_Clothing instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'images': instance.images,
    };

import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
abstract class Clothing with _$Clothing {
  factory Clothing({
    String title,
    String type,
    List<String> images,
  }) = _Clothing;

  factory Clothing.fromJson(Map<String, dynamic> json) => _$ClothingFromJson(json);
}

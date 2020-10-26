import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

part 'models.g.dart';

@freezed
abstract class Clothing with _$Clothing {
  factory Clothing({
    @Default("") String title,
    @Default("") String type,
    @Default("#ffffff") String color,
    @Default(const []) List<String> images,
  }) = _Clothing;

  factory Clothing.fromJson(Map<String, dynamic> json) =>
      _$ClothingFromJson(json);
}

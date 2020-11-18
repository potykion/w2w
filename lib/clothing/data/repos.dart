import '../domain/models.dart';
import '../domain/repos.dart';
import 'local.dart';
import 'remote.dart';

class ClothingRepo implements BaseClothingRepo {
  final ClothingRestClient clothingRestClient;
  final ClothingLocalStorage clothingLocalStorage;

  ClothingRepo({this.clothingRestClient, this.clothingLocalStorage});

  @override
  Future<Clothing> createClothing(CreateClothingDTO dto) async {
    var clothing = await clothingRestClient.createClothing(
      dto.title,
      dto.type,
      dto.color,
      dto.imageUrls,
      dto.imageFiles,
    );
    clothingLocalStorage.addClothing(clothing);
    return clothing;
  }

  @override
  Future<List<Clothing>> listClothing() async {
    return clothingLocalStorage.listClothing();
  }
}

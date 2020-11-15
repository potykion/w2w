import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:w2w/clothing/domain/models.dart';
import 'package:w2w/clothing/domain/repos.dart';
import 'package:w2w/clothing/presentation/state/controllers.dart';
import 'package:w2w/main.dart';

class MockClothingRepo extends Mock implements BaseClothingRepo {}

void main() {
  testWidgets('Список шмоток содержит шмотку', (WidgetTester tester) async {
    var clothingList = [
      Clothing(
        title: "Желтая футболочка",
        type: "Футболка",
        color: "ffff00",
        images: [],
      )
    ];
    var binding = BindingsBuilder(() {
      var repo = MockClothingRepo();
      when(repo.listClothing()).thenAnswer((_) async => clothingList);
      Get.put<BaseClothingRepo>(repo);
      Get.put(ClothingController(Get.find<BaseClothingRepo>()));
    });

    await tester.pumpWidget(MyApp(binding: binding));
    await tester.pump();

    expect(find.text(clothingList.first.title), findsOneWidget);
  });
}

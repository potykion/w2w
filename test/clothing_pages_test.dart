import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:w2w/clothing/domain/models.dart';
import 'package:w2w/clothing/domain/repos.dart';
import 'package:w2w/clothing/presentation/components/form.dart';
import 'package:w2w/clothing/presentation/state/controllers.dart';
import 'package:w2w/clothing/presentation/state/view_models.dart';
import 'package:w2w/main.dart';
import 'package:w2w/routes.dart';

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

  testWidgets(
    "Экран создания шмотки создает шмотку и она отображается в списке шмоток",
    (tester) async {
      var clothing = Clothing(
        title: "Желтая футболочка",
        type: "Футболка",
        color: "ffff00",
        images: [],
      );
      var repo = MockClothingRepo();
      var binding = BindingsBuilder(() {
        when(repo.listClothing()).thenAnswer((_) async => []);
        when(repo.createClothing(any)).thenAnswer((_) async => clothing);
        Get.put<BaseClothingRepo>(repo);
        Get.put(ClothingController(Get.find<BaseClothingRepo>()));
      });
      await tester.pumpWidget(MyApp(binding: binding));
      await tester.pump();

      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();

      await tester.tap(find.text("Добавить руками"));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(ClothingTitleInput), clothing.title);
      await tester.enterText(find.byType(ClothingTypeInput), clothing.type);
      await tester.enterText(find.byType(ClothingColorInput), clothing.color);
      await tester.tap(find.text("Сохранить"));
      await tester.pumpAndSettle();

      // todo
      // verify(repo.createClothing(CreateClothingDTO(
      //   title: clothing.title,
      //   type: clothing.type,
      //   color: clothing.color,
      //   imageUrls: [],
      //   imageFiles: [],
      // )));

      expect(find.text("Желтая футболочка"), findsOneWidget);
    },
  );
}

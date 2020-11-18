import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:w2w/clothing/domain/models.dart';
import 'package:w2w/clothing/domain/repos.dart';
import 'package:w2w/clothing/presentation/components/form.dart';
import 'package:w2w/clothing/presentation/pages/list.dart';
import 'package:w2w/clothing/presentation/state/controllers.dart';
import 'package:w2w/core/presentation/components/components.dart';
import 'package:w2w/core/presentation/pages/pages.dart';
import 'package:w2w/main.dart';

class MockClothingRepo extends Mock implements BaseClothingRepo {}

class MockImageFilePicker extends Mock implements BaseClothingImageFilePicker {}

void main() {
  setUp(() {
    // Прячем клаву, которую надо прятать из-за flutter_keyboard_visibility
    KeyboardVisibility.setVisibilityForTesting(false);
    // Устанавливаем размеры девайса, на котором будем тестироваться
    //  flutter run test/clothing_pages_test.dart
    final TestViewConfiguration viewConfig =
        TestViewConfiguration(size: const Size(411.4, 700));
    WidgetsBinding.instance.renderView.configuration = viewConfig;
  });

  testWidgets('Список шмоток содержит шмотку', (WidgetTester tester) async {
    var clothingList = [
      Clothing(
        title: "Желтая футболочка",
        type: "Футболка",
        color: "ffff00",
        images: [],
      )
    ];

    var repo = MockClothingRepo();
    when(repo.listClothing()).thenAnswer((_) async => clothingList);

    var binding = BindingsBuilder(() {
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
      var url =
          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/220px-Image_created_with_a_mobile_phone.png";

      var repo = MockClothingRepo();
      when(repo.listClothing()).thenAnswer((_) async => []);
      when(repo.createClothing(any)).thenAnswer((_) async => clothing);

      var imageFilePicker = MockImageFilePicker();
      when(imageFilePicker()).thenAnswer(
          (_) async => File("test/data/cdecc5b8addc06f75bccfcbabc08cc6a.jpg"));

      var binding = BindingsBuilder(() {
        Get.put<BaseClothingRepo>(repo);
        Get.put<BaseClothingImageFilePicker>(imageFilePicker);
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

      // Добавляем картинку через камеру: жмем на иконку камеры + делаем фото, нажимая на иконку камеры
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.camera_alt));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle(Duration(seconds: 1));

      // Добавляем картинку через ссылку
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.link));
      await tester.pump();
      await tester.enterText(find.byKey(Key("imageLinkInput")), url);
      await tester.pump();
      await tester.tap(find.byIcon(Icons.arrow_forward));
      await tester.pumpAndSettle();

      // Добавляем картинку через файл
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.folder));
      await tester.pumpAndSettle();

      await tester.tap(find.text("Сохранить"));
      await tester.pumpAndSettle();

      expect(verify(repo.createClothing(captureAny)).captured.single.title,
          clothing.title);
      expect(verify(repo.createClothing(captureAny)).captured.single.type,
          clothing.type);
      expect(verify(repo.createClothing(captureAny)).captured.single.color,
          clothing.color);
      expect(
          (verify(repo.createClothing(captureAny)).captured.single.imageUrls
                  as List<String>)
              .length,
          1);
      expect(
          (verify(repo.createClothing(captureAny)).captured.single.imageFiles
                  as List<File>)
              .length,
          2);

      expect(find.byType(ClothingListPage), findsOneWidget);
      expect(find.text(clothing.title), findsOneWidget);
    },
    // Оно работает через раз,
    // потому что надо выдрачивать тайминги в pumpAndSettle
    // + мокать Image.network, который кидает 400 в тетах
    skip: true,
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w2w/clothing/domain/models.dart';
import 'package:w2w/clothing/state/view_models.dart';
import '../components/form.dart';
import '../../../core/ui/components/components.dart';

class ClothingFormPage extends StatelessWidget {
  ClothingFormVM get clothing =>
      ClothingFormVM.fromClothing(Get.arguments as Clothing) ??
      ClothingFormVM();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
          children: [
            ClothingTitleInput(
              initial: clothing.title,
              change: (title) => clothing.title = title,
            ),
            ClothingTypeInput(
              initial: clothing.type,
              change: (type) => clothing.type = type,
            ),
            ClothingColorInput(
              initial: clothing.color,
              change: (color) => clothing.color = color,
            ),
            ClothingImagesInput(
              initial: clothing.images,
              change: (images) => clothing.images = images,
            ),
            FullWidthButton(
              text: "Сохранить",
              onPressed: () => clothing.save(),
            ),
          ],
        ),
      );
}

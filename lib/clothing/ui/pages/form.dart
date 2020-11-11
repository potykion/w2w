import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/form.dart';
import '../../../core/ui/components/components.dart';
import '../../state/controllers.dart';
import '../../../routes.dart';

class ClothingFormPage extends GetView<ClothingFormController> {
  @override
  Widget build(BuildContext context) {
    var inputs = <Widget>[
      WithHeadlineText(
        text: "Название",
        child: TextInput(
          initial: controller.clothing.value.title,
          change: (title) => controller
              .setClothing(controller.clothing.value.copyWith(title: title)),
        ),
      ),
      ClothingTypeInput(
        initial: controller.clothing.value.type,
        change: (type) => controller
            .setClothing(controller.clothing.value.copyWith(type: type)),
      ),
      ClothingColorInput(
          initial: controller.clothing.value.color,
          change: (color) => controller
              .setClothing(controller.clothing.value.copyWith(color: color))),
      ClothingImagesInput(
        initial: controller.clothing.value.images,
        change: (images) => controller
            .setClothing(controller.clothing.value.copyWith(images: images)),
      )
    ];

    return Scaffold(
      body: ListView(
        children: [
          for (var input in inputs) FixedPadding(child: input),
          FullWidthButton(
            text: "Сохранить",
            onPressed: () {
              if (controller.clothingId.value != 0) {
                Get.find<ClothingListController>().updateClothing(
                    controller.clothing.value, controller.clothingId.value);
              } else {
                Get.find<ClothingListController>()
                    .addClothing(controller.clothing.value);
              }

              controller.reset();
              Get.toNamed(Routes.clothingList);
            },
          ),
        ],
      ),
    );
  }
}

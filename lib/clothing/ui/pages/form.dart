import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w2w/clothing/domain/models.dart';
import 'package:w2w/clothing/ui/components/form.dart';
import 'package:w2w/core/ui/components/buttons.dart';
import 'package:w2w/clothing/state/controllers.dart';

import '../../../routes.dart';

class ClothingFormPage extends StatefulWidget {
  @override
  _ClothingFormPageState createState() => _ClothingFormPageState();
}

class _ClothingFormPageState extends State<ClothingFormPage> {
  Clothing clothing;
  int clothingId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var args = Get.arguments as ClothingFormArgs;
    clothing = args?.clothing ?? Clothing();
    clothingId = args?.clothingId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: ClothingTitleInput(
              initial: clothing.title,
              change: (title) =>
                  setState(() => clothing = clothing.copyWith(title: title)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: ClothingTypeInput(
              initial: clothing.type,
              change: (type) =>
                  setState(() => clothing = clothing.copyWith(type: type)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: ClothingColorInput(
              initial: clothing.color,
              change: (color) =>
                  setState(() => clothing = clothing.copyWith(color: color)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: ClothingImagesInput(
              initial: clothing.images,
              change: (images) =>
                  setState(() => clothing = clothing.copyWith(images: images)),
            ),
          ),
          FullWidthButton(
            text: "Сохранить",
            onPressed: () {
              if (clothingId != null) {
                Get.find<ClothingListController>().updateClothing(clothing, clothingId);
              } else {
                Get.find<ClothingListController>().addClothing(clothing);
              }

              Get.toNamed(Routes.clothingList);
            },
          ),
        ],
      ),
    );
  }
}

class ClothingFormArgs {
  final Clothing clothing;
  final int clothingId;

  ClothingFormArgs({this.clothing, this.clothingId});
}

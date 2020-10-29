import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:w2w/clothing/domain/models.dart';
import 'package:w2w/clothing/ui/components/form.dart';
import 'package:w2w/core/ui/components/buttons.dart';
import 'package:w2w/clothing/state/controllers.dart';

class ClothingFormPage extends StatefulWidget {
  @override
  _ClothingFormPageState createState() => _ClothingFormPageState();
}

class _ClothingFormPageState extends State<ClothingFormPage> {
  Clothing clothing;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var initialClothing = ModalRoute.of(context).settings.arguments as Clothing;
    clothing = initialClothing ?? Clothing();
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
              Get.find<Box>(tag: "clothingBox").add(clothing.toJson());
              Get.find<ClothingListController>().clothingList.add(clothing);
              Get.toNamed("/clothing-list");
            },
          ),
        ],
      ),
    );
  }
}

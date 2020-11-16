import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w2w/clothing/domain/models.dart';
import '../state/view_models.dart';
import '../../../core/presentation/components/components.dart';
import '../components/form.dart';

class ClothingFormPage extends StatefulWidget {
  @override
  _ClothingFormPageState createState() => _ClothingFormPageState();
}

class _ClothingFormPageState extends State<ClothingFormPage> {
  ClothingWriteVM clothing;

  @override
  void initState() {
    super.initState();
    setState(() {
      clothing = Get.arguments != null
          ? ClothingWriteVM.fromClothing(Get.arguments as Clothing)
          : ClothingWriteVM();
    });
  }

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
              onPressed: () {
                return clothing.save();
              },
            ),
          ],
        ),
      );
}

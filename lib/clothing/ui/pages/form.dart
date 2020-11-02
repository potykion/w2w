import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/models.dart';
import '../components/form.dart';
import '../../../core/ui/components/components.dart';
import '../../state/controllers.dart';
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
    var inputs = <Widget>[
      WithHeadlineText(
        text: "Название",
        child: TextInput(
          initial: clothing.title,
          change: (title) =>
              setState(() => clothing = clothing.copyWith(title: title)),
        ),
      ),
      ClothingTypeInput(
        initial: clothing.type,
        change: (type) =>
            setState(() => clothing = clothing.copyWith(type: type)),
      ),
      ClothingColorInput(
        initial: clothing.color,
        change: (color) =>
            setState(() => clothing = clothing.copyWith(color: color)),
      ),
      ClothingImagesInput(
        initial: clothing.images,
        change: (images) =>
            setState(() => clothing = clothing.copyWith(images: images)),
      )
    ];

    var inputsWithPadding = inputs.map((w) => FixedPadding(child: w));

    return Scaffold(
      body: ListView(
        children: [
          ...inputsWithPadding,
          FullWidthButton(
            text: "Сохранить",
            onPressed: () {
              if (clothingId != null) {
                Get.find<ClothingListController>()
                    .updateClothing(clothing, clothingId);
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

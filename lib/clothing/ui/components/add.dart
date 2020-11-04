import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w2w/clothing/domain/models.dart';
import 'package:w2w/clothing/domain/use_cases.dart';
import 'package:w2w/clothing/ui/pages/form.dart';
import 'package:w2w/core/ui/components/components.dart';

import '../../../routes.dart';

class LamodaButtonWithInput extends StatefulWidget {
  @override
  _LamodaButtonWithInputState createState() => _LamodaButtonWithInputState();
}

class _LamodaButtonWithInputState extends State<LamodaButtonWithInput> {
  bool showInput = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FullWidthButton(
          text: "Добавить через Lamoda",
          leading: Image.asset("assets/lamoda.png"),
          onPressed: () => setState(() => showInput = true),
        ),
        if (showInput) LamodaLinkInput()
      ],
    );
  }
}

class LamodaLinkInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) => LinkSubmitInput<Clothing>(
        onSubmit: (link) async => await Get.find<LoadLamodaClothing>()(link),
        postSubmit: (clothing) => Get.toNamed(
          Routes.clothingForm,
          arguments: ClothingFormArgs(clothing: clothing),
        ),
        helperText: "Например, https://lamoda.ru/p/he002emklgv2",
        hintText: "Ссылка на шмотку с Lamoda",
      );
}

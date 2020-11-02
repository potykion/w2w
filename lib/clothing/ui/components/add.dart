import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w2w/clothing/domain/use_cases.dart';
import 'package:w2w/clothing/ui/pages/form.dart';
import 'package:w2w/core/ui/components/components.dart';

import '../../../routes.dart';

class LamodaLinkInput extends StatefulWidget {
  @override
  _LamodaLinkInputState createState() => _LamodaLinkInputState();
}

class _LamodaLinkInputState extends State<LamodaLinkInput> {
  TextEditingController tec = TextEditingController();

  String lamodaLink;

  bool showSubmitIcon = false;
  bool showProgress = false;

  @override
  void initState() {
    super.initState();
    tec.addListener(() => setState(() {
          if (lamodaLink != tec.text) {
            lamodaLink = tec.text;
            showSubmitIcon = tec.text.isNotEmpty;
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    var submitIcon = IconButton(
      icon: Icon(Icons.arrow_forward),
      onPressed: () async {
        FocusScope.of(context).unfocus();

        setState(() {
          showSubmitIcon = false;
          showProgress = true;
        });

        var clothing = await Get.find<LoadLamodaClothing>()(lamodaLink);

        setState(() {
          showSubmitIcon = true;
          showProgress = false;
        });

        Get.toNamed(
          Routes.clothingForm,
          arguments: ClothingFormArgs(clothing: clothing),
        );
      },
    );

    var progress = Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircularProgressIndicator(),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextFormField(
        controller: tec,
        readOnly: showProgress,
        decoration: InputDecoration(
          helperText: "Например, https://lamoda.ru/p/he002emklgv2",
          hintText: "Ссылка на шмотку с Lamoda",
          border: OutlineInputBorder(),
          focusColor: Theme.of(context).primaryColor,
          suffixIcon: showSubmitIcon
              ? submitIcon
              : showProgress
                  ? progress
                  : null,
        ),
      ),
    );
  }
}

class LamodaButtonWithInput extends StatefulWidget {
  @override
  _LamodaButtonWithInputState createState() => _LamodaButtonWithInputState();
}

class _LamodaButtonWithInputState extends State<LamodaButtonWithInput> {
  bool showInput = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      FullWidthButton(
        text: "Добавить через Lamoda",
        leading: Image.asset("assets/lamoda.png"),
        onPressed: () => setState(() => showInput = true),
      ),
    ];

    if (showInput) {
      children.add(LamodaLinkInput());
    }

    return Column(children: children);
  }
}

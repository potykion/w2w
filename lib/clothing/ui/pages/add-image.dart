import 'package:flutter/material.dart';
import 'package:w2w/clothing/ui/components/add-image.dart';
import 'package:w2w/core/ui/components/components.dart';

class AddImageChoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WithHeadlineText(
            withPadding: true,
            text: "Добавить фото",
            child: Column(
              children: [
                UploadPhotoViaFileButton(),
                FullWidthButton(text: "Из камеры"),
                FullWidthButton(text: "Из интернета"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

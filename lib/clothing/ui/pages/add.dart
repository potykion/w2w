import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w2w/clothing/ui/components/add.dart';
import 'package:w2w/core/ui/components/buttons.dart';
import 'package:w2w/routes.dart';

class AddClothingChoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FullWidthButton(
              text: "Добавить руками",
              onPressed: () => Get.toNamed(Routes.clothingForm),
            ),
            LamodaButtonWithInput()
          ],
        ),
      ),
    );
  }
}

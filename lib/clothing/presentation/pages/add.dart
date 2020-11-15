import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/presentation/components/components.dart';
import '../components/add.dart';
import '../../../routes.dart';

class AddClothingChoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FullWidthButton(
                text: "Добавить руками",
                onPressed: () => Get.toNamed(Routes.clothingForm),
              ),
              // LamodaButtonWithInput()
            ],
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:w2w/clothing/ui/components/add.dart';
import 'package:w2w/core/ui/components/buttons.dart';

class AddClothingChoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FullWidthButton(text: "Добавить руками"),
            LamodaButtonWithInput()
          ],
        ),
      ),
    );
  }
}


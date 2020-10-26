import 'package:flutter/material.dart';
import 'package:w2w/clothing/ui/widgets/add.dart';
import 'package:w2w/core/ui/widgets/buttons.dart';

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

class AddClothingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("AddClothingPage"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:w2w/widgets.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "В гардеробе пустовато\nДобавь что-нибудь",
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            FullWidthButton(
              text: "Добавить",
              onPressed: () => Navigator.pushNamed(
                context,
                "/add-clothing-choice",
              ),
            )
          ],
        ),
      ),
    );
  }
}

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

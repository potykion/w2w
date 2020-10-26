import 'package:flutter/material.dart';
import 'package:w2w/core/ui/components/buttons.dart';

class ClothingListPage extends StatelessWidget {
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

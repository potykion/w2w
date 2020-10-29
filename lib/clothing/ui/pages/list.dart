import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w2w/clothing/state/controllers.dart';
import 'package:w2w/core/ui/components/buttons.dart';

class ClothingListPage extends GetView<ClothingListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.clothingList.length == 0
          ? buildNoClothing(context)
          : ListView.builder(
              itemBuilder: (context, index) => ListTile(
                title: Text(controller.clothingList[index].title),
              ),
              itemCount: controller.clothingList.length,
            ),
    );
  }

  Center buildNoClothing(BuildContext context) {
    return Center(
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
            onPressed: () => Get.toNamed("/add-clothing-choice"),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w2w/clothing/state/controllers.dart';
import 'package:w2w/clothing/ui/components/list.dart';

class ClothingListPage extends GetView<ClothingListController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: controller.clothingList.length == 0
            ? buildNoClothing(context)
            : buildGroupedClothingList(context),
        appBar: ClothingListAppBar(),
      );

  Center buildNoClothing(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "В гардеробе пустовато\nДобавь что-нибудь",
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );

  buildGroupedClothingList(BuildContext context) => ListView(
        children: controller.groupedClothing.entries
            .expand((entry) => [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Тип: ${entry.key}",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  TypeClothingList(clothingList: entry.value),
                ])
            .toList(),
      );
}

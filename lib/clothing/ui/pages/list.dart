import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w2w/clothing/state/controllers.dart';
import 'package:w2w/clothing/ui/components/list.dart';



class ClothingListPage extends GetView<ClothingListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.clothingList.length == 0
          ? buildNoClothing(context)
          : buildGroupedClothingList(context),
      appBar: ClothingListAppBar(),
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
          )
        ],
      ),
    );
  }

  buildGroupedClothingList(BuildContext context) {
    return ListView(
      children: controller.groupedClothing.entries
          .expand((entry) => [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Тип: ${entry.key}",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(
                  height: 260,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              entry.value[index].images.first,
                              height: 200,
                            ),
                            SizedBox(height: 10),
                            Text(
                              entry.value[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            )
                          ],
                        ),
                      ),
                    ),
                    itemCount: entry.value.length,
                  ),
                ),
              ])
          .toList(),
    );
  }
}

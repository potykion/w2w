import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w2w/clothing/domain/models.dart';
import 'package:w2w/clothing/ui/pages/form.dart';
import 'package:w2w/routes.dart';

class ClothingListAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.mediaQuery.padding.top + 8, right: 8),
      child: Row(
        children: [
          Spacer(),
          IconButton(
            onPressed: () => Get.toNamed("/add-clothing-choice"),
            icon: Icon(Icons.add),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class TypeClothingList extends StatelessWidget {
  final List<Clothing> clothingList;

  const TypeClothingList({Key key, this.clothingList}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 260,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: SizedBox(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      clothingList[index].images.first,
                      height: 200,
                    ),
                    SizedBox(height: 10),
                    Text(
                      clothingList[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ],
                ),
              ),
              onTap: () => Get.toNamed(
                Routes.clothingForm,
                arguments: ClothingFormArgs(
                  clothing: clothingList[index],
                  clothingId: index,
                ),
              ),
            ),
          ),
          itemCount: clothingList.length,
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClothingListAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.mediaQuery.padding.top + 8, right: 8),
      child: Row(
        children: [
          Spacer(),
          FloatingActionButton(
            onPressed: () => Get.toNamed("/add-clothing-choice"),
            child: Icon(Icons.add, color: Colors.white),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

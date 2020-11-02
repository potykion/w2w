import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:w2w/clothing/dependencies/repositories.dart';
import 'package:w2w/core/ui/components/components.dart';

import '../../../routes.dart';

class ClothingTypeInput extends StatefulWidget {
  final String initial;
  final Function(String type) change;

  const ClothingTypeInput({Key key, this.initial, this.change})
      : super(key: key);

  @override
  _ClothingTypeInputState createState() => _ClothingTypeInputState();
}

class _ClothingTypeInputState extends State<ClothingTypeInput> {
  var tec = TextEditingController();

  @override
  void initState() {
    super.initState();
    tec.text = widget.initial;
    tec.addListener(() => widget.change(tec.text));
  }

  @override
  Widget build(BuildContext context) {
    return WithHeadlineText(
      text: "Тип",
      child: TypeAheadFormField<String>(
        textFieldConfiguration: TextFieldConfiguration(
          controller: tec,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        hideOnEmpty: true,
        hideOnLoading: true,
        hideSuggestionsOnKeyboardHide: false,
        suggestionsCallback: (String pattern) =>
            Get.find<ClothingRepo>().findTypeByPattern(pattern),
        onSuggestionSelected: (String suggestion) => tec.text = suggestion,
        itemBuilder: (BuildContext context, String itemData) =>
            ListTile(title: Text(itemData)),
      ),
    );
  }
}

class ClothingColorInput extends StatefulWidget {
  final String initial;
  final Function(String color) change;

  const ClothingColorInput({Key key, this.initial, this.change})
      : super(key: key);

  @override
  _ClothingColorInputState createState() => _ClothingColorInputState();
}

class _ClothingColorInputState extends State<ClothingColorInput> {
  var tec = TextEditingController();

  @override
  void initState() {
    super.initState();
    tec.text = widget.initial;
    tec.addListener(() => widget.change(tec.text));
  }

  // todo колор-пикер
  @override
  Widget build(BuildContext context) {
    return WithHeadlineText(
      text: "Цвет",
      child: TextFormField(
        controller: tec,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class ClothingImagesInput extends StatefulWidget {
  final List<String> initial;

  // todo реализовать change
  final Function(List<String> images) change;

  const ClothingImagesInput({Key key, this.initial, this.change})
      : super(key: key);

  @override
  _ClothingImagesInputState createState() => _ClothingImagesInputState();
}

class _ClothingImagesInputState extends State<ClothingImagesInput> {
  List<String> images;

  @override
  void initState() {
    super.initState();
    images = widget.initial ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return WithHeadlineText(
      text: "Фоточки",
      child: SizedBox(
        height: 300,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children:
              images.map((url) => Card(child: Image.network(url))).toList(),
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.add),
        onPressed: () => Get.toNamed(Routes.clothingAddImageChoice),
      ),
    );
  }
}

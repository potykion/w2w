import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class ClothingTitleInput extends StatefulWidget {
  final String initial;
  final Function(String title) change;

  const ClothingTitleInput({Key key, this.initial, this.change}) : super(key: key);

  @override
  _ClothingTitleInputState createState() => _ClothingTitleInputState();
}

class _ClothingTitleInputState extends State<ClothingTitleInput> {
  var tec = TextEditingController();

  @override
  void initState() {
    super.initState();
    tec.text = widget.initial;
    tec.addListener(() => widget.change(tec.text));
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: tec,
      decoration: InputDecoration(
        labelText: "Название",
        border: OutlineInputBorder(),
      ),
    );
  }
}

class ClothingTypeInput extends StatefulWidget {
  @override
  _ClothingTypeInputState createState() => _ClothingTypeInputState();
}

class _ClothingTypeInputState extends State<ClothingTypeInput> {
  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField(
      textFieldConfiguration: TextFieldConfiguration(
        decoration: InputDecoration(
          labelText: "Тип",
          border: OutlineInputBorder(),
        ),
      ),
      suggestionsCallback: (String pattern) {},
      onSuggestionSelected: (suggestion) {},
      itemBuilder: (BuildContext context, itemData) {},
    );
  }
}

class ClothingColorInput extends StatefulWidget {
  @override
  _ClothingColorInputState createState() => _ClothingColorInputState();
}

class _ClothingColorInputState extends State<ClothingColorInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Цвет",
        border: OutlineInputBorder(),
      ),
    );
  }
}

class ClothingImagesInput extends StatefulWidget {
  @override
  _ClothingImagesInputState createState() => _ClothingImagesInputState();
}

class _ClothingImagesInputState extends State<ClothingImagesInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Фоточки",
        border: OutlineInputBorder(),
      ),
    );
  }
}

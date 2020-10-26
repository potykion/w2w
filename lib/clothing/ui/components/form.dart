import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

const double TEXT_HEIGHT = 1.15;
const double SPACING = 0;

class ClothingTitleInput extends StatefulWidget {
  final String initial;
  final Function(String title) change;

  const ClothingTitleInput({Key key, this.initial, this.change})
      : super(key: key);

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
    // TODO вынести в компонент withLabel
    // TODO сделать компонент инпута? + юзать в LamodaLinkInput?
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Название",
          style: Theme.of(context).textTheme.headline6.copyWith(height: TEXT_HEIGHT),
        ),
        SizedBox(height: SPACING),
        TextFormField(
          controller: tec,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Тип",
          style: Theme.of(context).textTheme.headline6.copyWith(height: TEXT_HEIGHT),
        ),
        SizedBox(height: SPACING),
        TypeAheadFormField<String>(
          textFieldConfiguration: TextFieldConfiguration(
            controller: tec,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          // todo поиск в бд типов шмота
          suggestionsCallback: (String pattern) => [],
          onSuggestionSelected: (String suggestion) => tec.text = suggestion,
          itemBuilder: (BuildContext context, String itemData) =>
              ListTile(title: Text(itemData)),
        ),
      ],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Цвет",
          style: Theme.of(context).textTheme.headline6.copyWith(height: TEXT_HEIGHT),
        ),
        SizedBox(height: SPACING),
        TextFormField(
          controller: tec,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Фоточки",
          style: Theme.of(context).textTheme.headline6.copyWith(height: TEXT_HEIGHT),
        ),
        SizedBox(height: SPACING),
        SizedBox(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children:
                images.map((url) => Card(child: Image.network(url))).toList(),
          ),
        )
      ],
    );
  }
}
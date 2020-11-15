import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import '../../data/local.dart';
import '../../../core/presentation/components/components.dart';
import '../../../routes.dart';

class ClothingTitleInput extends StatelessWidget {
  final String initial;
  final Function(String title) change;

  const ClothingTitleInput({Key key, this.initial, this.change})
      : super(key: key);

  @override
  Widget build(BuildContext context) => WithHeadlineText(
        text: "Название",
        child: TextInput(initial: initial, change: change),
      );
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
  Widget build(BuildContext context) => WithHeadlineText(
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
              Get.find<ClothingLocalStorage>().findTypeByPattern(pattern),
          onSuggestionSelected: (String suggestion) => tec.text = suggestion,
          itemBuilder: (BuildContext context, String itemData) =>
              ListTile(title: Text(itemData)),
        ),
      );
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
  Widget build(BuildContext context) => WithHeadlineText(
        text: "Цвет",
        child: TextFormField(
          controller: tec,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      );
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
  List<dynamic> images;

  @override
  void initState() {
    super.initState();
    images = widget.initial ?? [];
  }

  @override
  Widget build(BuildContext context) => WithHeadlineText(
        text: "Фоточки",
        child: SizedBox(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (var image in images)
                Card(
                  child: image is String
                      ? Image.network(image)
                      : Image.file(image),
                )
            ],
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.add),
          onPressed: () async {
            var image = await Get.toNamed(Routes.clothingAddImageChoice);
            setState(() => images = [...images, image]);
            // todo widget.change(images);
          },
        ),
      );
}

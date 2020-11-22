import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:w2w/clothing/domain/repos.dart';
import 'package:w2w/core/presentation/pages/pages.dart';
import '../../data/local.dart';
import '../../../core/presentation/components/components.dart';
import '../../../core/utils.dart';

class ClothingTitleInput extends StatelessWidget {
  final String initial;
  final Function(String title) change;

  const ClothingTitleInput({Key key, this.initial, this.change})
      : super(key: key);

  @override
  Widget build(BuildContext context) => FixedPadding(
        child: WithHeadlineText(
          text: "Название",
          child: TextInput(initial: initial, change: change),
        ),
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
  Widget build(BuildContext context) => FixedPadding(
        child: WithHeadlineText(
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

  String colorHex;

  @override
  void initState() {
    super.initState();
    tec.text = widget.initial;
    colorHex = widget.initial;
    tec.addListener(() {
      if (tec.text.length == 6) {
        setState(() => colorHex = tec.text);
        widget.change(colorHex);
      }
    });
  }

  @override
  Widget build(BuildContext context) => FixedPadding(
        child: WithHeadlineText(
          text: "Цвет",
          child: TextFormField(
            controller: tec,
            maxLength: 6,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Row(
                  children: [
                    GestureDetector(
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          backgroundColor: colorFromStr(colorHex),
                          radius: 10,
                        ),
                      ),
                      onTap: () {
                        Get.dialog(ColorPickerDialog(
                          initial: colorFromStr(colorHex),
                          change: (color) {
                            tec.text = color.toRGBHex();
                          },
                        ));
                      },
                    ),
                    IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.camera_alt),
                      onPressed: () async {
                        final camera = (await availableCameras()).first;
                        var color =
                            await Get.to(PickPhotoColorPage(camera: camera))
                                as Color;
                        tec.text = color.toRGBHex();
                      },
                    )
                  ],
                ),
              ),
              suffixIconConstraints: BoxConstraints.tight(Size(80, 40)),
            ),
          ),
        ),
      );
}

class ClothingImagesInput extends StatefulWidget {
  final List<dynamic> initial;

  final Function(List<dynamic> images) change;

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
    setState(() => images = widget.initial ?? []);
  }

  @override
  Widget build(BuildContext context) => FixedPadding(
        child: WithHeadlineText(
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
              var image = await Get.bottomSheet(AddImageBottomSheet());
              if (image == null) return;

              setState(() => images = [...images, image]);
              widget.change(images);
            },
          ),
        ),
      );
}

class AddImageBottomSheet extends StatefulWidget {
  @override
  _AddImageBottomSheetState createState() => _AddImageBottomSheetState();
}

class _AddImageBottomSheetState extends State<AddImageBottomSheet> {
  bool showLinkInput = false;

  @override
  Widget build(BuildContext context) => Container(
        constraints: BoxConstraints(minHeight: 120, maxHeight: 220),
        child: Card(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildAddImageButton(
                    icon: Icons.camera_alt,
                    text: "Камера",
                    onTap: () async {
                      setState(() => showLinkInput = false);
                      final camera = (await availableCameras()).first;
                      var imageFile =
                          await Get.to(TakePhotoPage(camera: camera));
                      Get.back(result: imageFile);
                    },
                  ),
                  buildAddImageButton(
                    icon: Icons.folder,
                    text: "Файл",
                    onTap: () async {
                      setState(() => showLinkInput = false);
                      var imageFile =
                          await Get.find<BaseClothingImageFilePicker>()();
                      if (imageFile != null) {
                        Get.back(result: imageFile);
                      }
                    },
                  ),
                  buildAddImageButton(
                    icon: Icons.link,
                    text: "Ссылка",
                    onTap: () => setState(() => showLinkInput = !showLinkInput),
                  ),
                ],
              ),
              if (showLinkInput)
                LinkSubmitInput(
                  key: Key("imageLinkInput"),
                  hintText: "Ссылка на фотку со шмоткой",
                  onSubmit: (imageUrl) async => Get.back(result: imageUrl),
                )
            ],
          ),
        ),
      );

  Padding buildAddImageButton({IconData icon, String text, Function onTap}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 100,
        height: 100,
        child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(icon, size: 40), Text(text)],
            ),
            onTap: onTap,
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

class ColorPickerDialog extends StatelessWidget {
  final Color initial;
  final Function(Color color) change;

  const ColorPickerDialog({Key key, this.initial, this.change})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Выбери цвет'),
      content: SingleChildScrollView(
        child: ColorPicker(
          pickerColor: initial,
          onColorChanged: (color) => change(color),
          showLabel: true,
          pickerAreaHeightPercent: 0.8,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: const Text('Готово'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}

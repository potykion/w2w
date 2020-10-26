import 'package:flutter/material.dart';
import 'package:w2w/clothing/domain/models.dart';
import 'package:w2w/clothing/ui/widgets/form.dart';

class ClothingFormPage extends StatefulWidget {
  final Clothing initialClothing;

  const ClothingFormPage({Key key, this.initialClothing}) : super(key: key);

  @override
  _ClothingFormPageState createState() => _ClothingFormPageState();
}

class _ClothingFormPageState extends State<ClothingFormPage> {
  Clothing clothing;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    clothing = widget.initialClothing ?? Clothing();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClothingTitleInput(
          initial: clothing.title,
          change: (title) =>
              setState(() => clothing = clothing.copyWith(title: title)),
        ),
        ClothingTypeInput(),
        ClothingColorInput(),
        ClothingImagesInput(),
      ],
    );
  }
}

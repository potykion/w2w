import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:w2w/core/ui/components/components.dart';

class UploadPhotoViaFileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FullWidthButton(
      text: "Из файла",
      onPressed: () async {
        var result = await FilePicker.platform.pickFiles(type: FileType.image);
        if (result != null) {
          var file = File(result.files.single.path);

          var s = "as";
        }
      },
    );
  }
}

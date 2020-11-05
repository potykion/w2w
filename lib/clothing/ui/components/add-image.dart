import 'dart:io';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w2w/clothing/ui/pages/add-image.dart';
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

class UploadPhotoViaCameraButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FullWidthButton(
      text: "Из камеры",
      onPressed: () async {
        // Obtain a list of the available cameras on the device.
        final cameras = await availableCameras();

        // Get a specific camera from the list of available cameras.
        final firstCamera = cameras.first;

        Get.to(TakePictureScreen(camera: firstCamera));
      },
    );
  }
}

class UploadPhotoViaLinkButtonAndInput extends StatefulWidget {
  @override
  _UploadPhotoViaLinkButtonAndInputState createState() =>
      _UploadPhotoViaLinkButtonAndInputState();
}

class _UploadPhotoViaLinkButtonAndInputState
    extends State<UploadPhotoViaLinkButtonAndInput> {
  var showInput = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FullWidthButton(
          text: "По ссылке",
          onPressed: () => setState(() => showInput = true),
        ),
        if (showInput)
          LinkSubmitInput(
            hintText: "Ссылка на фотку со шмоткой",
          )
      ],
    );
  }
}

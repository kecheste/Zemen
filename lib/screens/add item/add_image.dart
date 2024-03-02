import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/service/utils.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  static String routeName = "/addimage";

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  Uint8List? image;

  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            "Add image screen",
            style: Theme.of(context).textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}

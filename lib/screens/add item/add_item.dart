// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/user_model.dart';
import 'package:shop_app/service/utils.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key, required this.user});

  final MyUser user;

  static String routeName = "/additem";

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  Uint8List? image;
  Uint8List? image2;
  Uint8List? image3;

  int currentPage = 0;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    setState(() {
      if (image == null) {
        image = img;
      } else if (image2 == null) {
        image2 = img;
      } else if (image3 == null) {
        image3 = img;
      } else {
        image = img;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            Center(
                child: Text(
              'Post an Ad',
              style: Theme.of(context).textTheme.titleLarge,
            )),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: "Title",
                hintText: "Enter the title",
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: "Description",
                hintText: "Enter description",
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Price",
                hintText: "Enter the price",
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 120,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.shade700, width: 1.5)),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade300,
                      ),
                      child: IconButton(
                          onPressed: () {
                            selectImage();
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.black,
                          ))),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12)),
                    child: image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.memory(
                              image!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : null,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12)),
                    child: image2 != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.memory(
                              image2!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : null,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12)),
                    child: image3 != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.memory(
                              image3!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : null,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Product newItem = Product.empty;
                  newItem = newItem.copyWith(
                      title: _titleController.text,
                      description: _descriptionController.text,
                      price: _priceController.text,
                      author: widget.user.id);

                  print(newItem);
                }
              },
              child: const Text("Post Ad"),
            ),
          ],
        ),
      ),
    ));
  }
}

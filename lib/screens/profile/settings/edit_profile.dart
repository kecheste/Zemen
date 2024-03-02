// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:shop_app/screens/profile/components/profile_pic.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  static String routeName = "/editProfile";

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? firstName;
  String? lastName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              onSaved: (newValue) => firstName = newValue,
              decoration: const InputDecoration(
                labelText: "First Name",
                hintText: "Edit your first name...",
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              onSaved: (newValue) => lastName = newValue,
              decoration: const InputDecoration(
                labelText: "Last Name",
                hintText: "Edit your last name...",
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ElevatedButton(
              onPressed: () {
                //
              },
              child: const Text("Save"),
            ),
          ),
        ),
      ),
    );
  }
}

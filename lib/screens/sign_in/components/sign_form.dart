import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/blocs/authentication/authentication_bloc.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../helper/keyboard.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Int? phone;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  Widget buttonChild = const Text("Continue");

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        print("OTP SCREEN: $state");
        if (state is AuthenticationOtpState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpScreen(
                  phone: _phoneController.text,
                ),
              ));
        }
        if (state is AuthenticationLoadingState) {
          setState(() {
            buttonChild = const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3,
            );
          });
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  removeError(error: kPhoneNumberNullError);
                }
                return;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  addError(error: kPhoneNumberNullError);
                  return "";
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Phone",
                hintText: "912345678",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon:
                    CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            FormError(errors: errors),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    KeyboardUtil.hideKeyboard(context);
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(SendOtp(_phoneController.text, () {
                      Navigator.pop(context);
                    }, () {
                      print("OTP SENT");
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OtpScreen(
                                phone: _phoneController.text,
                              )));
                      print("DONE NAVIGATING");
                    }));
                    print("SENDING OTP");
                  }
                },
                child: buttonChild),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/blocs/authentication/authentication_bloc.dart';
import 'package:shop_app/screens/init_screen.dart';

import '../../../constants.dart';

class OtpForm extends StatefulWidget {
  final String phone;

  const OtpForm({
    Key? key,
    required this.phone,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final TextEditingController pin1Controller = TextEditingController();
  final TextEditingController pin2Controller = TextEditingController();
  final TextEditingController pin3Controller = TextEditingController();
  final TextEditingController pin4Controller = TextEditingController();
  final TextEditingController pin5Controller = TextEditingController();
  final TextEditingController pin6Controller = TextEditingController();

  String otpCode = "";

  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();
    pin6FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  Widget buttonChild = const Text("Continue");

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSuccessState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => InitScreen(
                  user: state.user,
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
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40,
                  child: TextFormField(
                    controller: pin1Controller,
                    autofocus: true,
                    obscureText: true,
                    style: const TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                      nextField(value, pin2FocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: TextFormField(
                    controller: pin2Controller,
                    focusNode: pin2FocusNode,
                    obscureText: true,
                    style: const TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) => nextField(value, pin3FocusNode),
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: TextFormField(
                    controller: pin3Controller,
                    focusNode: pin3FocusNode,
                    obscureText: true,
                    style: const TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) => nextField(value, pin4FocusNode),
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: TextFormField(
                      controller: pin4Controller,
                      focusNode: pin4FocusNode,
                      obscureText: true,
                      style: const TextStyle(fontSize: 20),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: otpInputDecoration,
                      onChanged: (value) => nextField(value, pin5FocusNode)),
                ),
                SizedBox(
                  width: 40,
                  child: TextFormField(
                      controller: pin5Controller,
                      focusNode: pin5FocusNode,
                      obscureText: true,
                      style: const TextStyle(fontSize: 20),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: otpInputDecoration,
                      onChanged: (value) => nextField(value, pin6FocusNode)),
                ),
                SizedBox(
                  width: 40,
                  child: TextFormField(
                    controller: pin6Controller,
                    focusNode: pin6FocusNode,
                    obscureText: true,
                    style: const TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                      if (value.length == 1) {
                        pin6FocusNode!.unfocus();
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            ElevatedButton(
              onPressed: () async {
                otpCode = pin1Controller.text.toString() +
                    pin2Controller.text.toString() +
                    pin3Controller.text.toString() +
                    pin4Controller.text.toString() +
                    pin5Controller.text.toString() +
                    pin6Controller.text.toString();
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(SignInUser(otpCode, widget.phone));
              },
              child: const Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/blocs/authentication/authentication_bloc.dart';
import 'package:shop_app/screens/init_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';

class AppView extends StatefulWidget {
  static String routeName = "/app_view";

  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        print("AppView: $state");
        if (state is AuthenticationSuccessState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => InitScreen(
                      user: state.user,
                    )),
          );
        } else if (state is UnAuthenticatedState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SignInScreen()),
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  child: Image.asset('assets/images/zemen.png')),
              const SizedBox(
                height: 100,
              ),
              CircularProgressIndicator(
                color: Colors.green,
                backgroundColor: Colors.grey.shade200,
                strokeWidth: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}

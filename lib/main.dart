import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/app_view.dart';
import 'package:shop_app/blocs/authentication/authentication_bloc.dart';
import 'package:shop_app/firebase_options.dart';
import 'package:shop_app/repository/auth.dart';

import 'routes.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthenticationBloc>(
        create: (context) =>
            AuthenticationBloc(authRepository: AuthRepository()))
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthRepository authRepository = AuthRepository();

  @override
  void initState() {
    super.initState();
    // _authenticationBloc = AuthenticationBloc(authRepository: authRepository);
    // _authenticationBloc.add(AppStarted());
    // print("Initial state running");
    context.read<AuthenticationBloc>().add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zemen',
      theme: AppTheme.lightTheme(context),
      initialRoute: AppView.routeName,
      routes: routes,
    );
  }
}

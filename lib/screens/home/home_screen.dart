import 'package:flutter/material.dart';

import 'components/categories.dart';
import 'components/home_header.dart';
import 'components/product.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Column(
            children: [
              HomeHeader(),
              Categories(),
              SizedBox(height: 10),
              Products(),
            ],
          ),
        ),
      ),
    );
  }
}

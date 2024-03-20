import 'package:flutter/widgets.dart';
import 'package:shop_app/app_view.dart';
import 'package:shop_app/screens/add%20item/add_image.dart';
import 'package:shop_app/screens/chat/chat_room/chat_room.dart';
import 'package:shop_app/screens/products/products_screen.dart';
import 'package:shop_app/screens/profile/settings/edit_profile.dart';
import 'package:shop_app/screens/profile/settings/my_account.dart';

import 'screens/complete_profile/complete_profile_screen.dart';
import 'screens/details/details_screen.dart';
import 'screens/forgot_password/forgot_password_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProductsScreen.routeName: (context) => const ProductsScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  AddImage.routeName: (context) => const AddImage(),
  ChatRoom.routeName: (context) => const ChatRoom(),
  EditProfile.routeName: (context) => const EditProfile(),
  MyAccount.routeName: (context) => const MyAccount(),
  AppView.routeName: (context) => const AppView()
};

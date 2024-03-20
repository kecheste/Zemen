import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/user_model.dart';
import 'package:shop_app/screens/add%20item/add_item.dart';
import 'package:shop_app/screens/chat/chat_page.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class InitScreen extends StatefulWidget {
  final MyUser user;

  const InitScreen({super.key, required this.user});

  static String routeName = "/";

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int currentSelectedIndex = 0;
  late List<Widget> pages;

  void updateCurrentIndex(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    pages = [
      const HomeScreen(),
      AddItem(user: widget.user), // Initialize here
      ChatPage(user: widget.user),
      ProfileScreen(user: widget.user)
    ];
  }

  // final pages = [
  //   const HomeScreen(),
  //   AddItem(user: widget.user),
  //   const ChatPage(),
  //   const ProfileScreen()
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentSelectedIndex],
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          onTap: updateCurrentIndex,
          currentIndex: currentSelectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/Shop Icon.svg",
                colorFilter: const ColorFilter.mode(
                  inActiveIconColor,
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                "assets/icons/Shop Icon.svg",
                height: 20,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  kPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/Add.svg",
                height: 30,
                width: 30,
                colorFilter: const ColorFilter.mode(
                  inActiveIconColor,
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                "assets/icons/Add.svg",
                height: 30,
                width: 30,
                colorFilter: const ColorFilter.mode(
                  kPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
              label: "Fav",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/Chat bubble Icon.svg",
                height: 20,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  inActiveIconColor,
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                "assets/icons/Chat bubble Icon.svg",
                height: 20,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  kPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/User Icon.svg",
                height: 20,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  inActiveIconColor,
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                "assets/icons/User Icon.svg",
                height: 20,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  kPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
              label: "Fav",
            ),
          ],
        ),
      ),
    );
  }
}

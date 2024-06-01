import 'package:agriplant/features/presentation/screens/bottom_navigation_bar_screens/cart_screen/cart_screen.dart';
import 'package:agriplant/features/presentation/screens/bottom_navigation_bar_screens/explore_screen/explore_screen.dart';
import 'package:agriplant/features/presentation/screens/bottom_navigation_bar_screens/profile_screen/screens/profile_screen.dart';
import 'package:agriplant/features/presentation/screens/bottom_navigation_bar_screens/services_screen/services_screen.dart';
import 'package:agriplant/features/presentation/screens/bottom_navigation_bar_screens/chat_screen/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // HomeScreen({super.key});
  List<Widget> screens = const [
    ExploreScreen(),
    ServicesScreen(),
    ChatPage(),
    CartScreen(),
    ProfileScreen(),

  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: screens[currentIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() => BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items:  [
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            label: AppLocalizations.of(context)!.hm1,
            activeIcon: Icon(IconlyBold.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.call),
            label: AppLocalizations.of(context)!.hm2,
            activeIcon: Icon(IconlyBold.call),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.chat),
            label: "AI chat",
            activeIcon: Icon(IconlyBold.chat),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.buy),
            label: AppLocalizations.of(context)!.hm3,
            activeIcon: Icon(IconlyBold.buy),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile),
            label: AppLocalizations.of(context)!.hm4,
            activeIcon: Icon(IconlyBold.profile),
          ),
        ],
      );
}

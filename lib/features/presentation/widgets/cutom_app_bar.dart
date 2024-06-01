import 'package:agriplant/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:agriplant/features/presentation/screens/bottom_navigation_bar_screens/profile_screen/screens/profile_screen.dart';

AppBar customAppBar(BuildContext context,
    {Widget? titleWidget, List<Widget>? actionsWidgets}) =>
    AppBar(
      scrolledUnderElevation: 0,
      title: titleWidget ??
          GestureDetector(
            onTap: () {
              // Navigate to another screen when the image is clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            child: Image.asset(
              AssetsData.HarvestHUB, // Replace 'your_image.png' with your image path
              width: 50, // Set width as per your requirement
              height: 50, // Set height as per your requirement
            ),

          ),

      actions: actionsWidgets ??
          [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  // Show a modal bottom sheet when the notification button is clicked
                  showModalBottomSheet(
                    elevation: .9,
                    showDragHandle: true,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      width: double.infinity,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          // Replace this with your desired widget for each item in the list
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('          No Notification',),
                          );
                        },
                        itemCount: 1, // Replace with the actual number of items
                      ),
                    ),
                  );
                },
                icon: badges.Badge(
                  badgeContent: const Text(
                    '0',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  position: badges.BadgePosition.topEnd(top: -13, end: -13),
                  child: const Icon(
                    IconlyBroken.notification,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
    );
import 'package:agriplant/features/presentation/screens/bottom_navigation_bar_screens/profile_screen/screens/orders_screen.dart';
import 'package:agriplant/features/presentation/widgets/cutom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 15),
              child: CircleAvatar(
                radius: 63,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: const CircleAvatar(
                  radius: 60,
                  foregroundImage: AssetImage('assets/vanya_aws.jpeg'),
                ),
              ),
            ),
            Text(
              'Vanya Awasthi',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "vanya.a23@iiits.in",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 20),
            buildListTitleItem(
              title: 'My Orders',
              leadingIcon: IconlyLight.bag,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OrdersScreen(),
                  ),
                );
              },
            ),
            // buildListTitleItem(
            //     title: 'About us ',
            //     leadingIcon: IconlyLight.infoSquare,
            //     onTap: () {}),
            buildListTitleItem(
                title: 'Logout', leadingIcon: IconlyLight.logout, onTap: () {}),
          ],
        ),

      ),
    );
  }

  Widget buildListTitleItem(
          {required String title,
          required IconData leadingIcon,
          required VoidCallback onTap}) =>
      ListTile(
        leading: Icon(leadingIcon),
        title: Text(title),
        onTap: onTap,
      );
}

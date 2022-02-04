import 'package:flutter/material.dart';
import 'app_txt.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const AppTxt('Dashboard', fontSize: 30.0),
          const SizedBox(height: 20.0),
          DrawerItem(
            title: 'home',
            icon: Icons.manage_accounts,
            onTap: () {},
          ),
          DrawerItem(
            title: 'home',
            icon: Icons.manage_accounts,
            onTap: () {},
          ),
          DrawerItem(
            title: 'home',
            icon: Icons.manage_accounts,
            onTap: () {},
          ),
          DrawerItem(
            title: 'home',
            icon: Icons.manage_accounts,
            onTap: () {},
          ),
          DrawerItem(
            title: 'home',
            icon: Icons.manage_accounts,
            onTap: () {},
          ),
          DrawerItem(
            title: 'home',
            icon: Icons.manage_accounts,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);
  //
  final String title;
  final IconData icon;
  final void Function()? onTap;
  //
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap ?? () {},
      title: const AppTxt('home', fontSize: 20.0),
      leading: const Icon(Icons.insert_emoticon),
    );
  }
}

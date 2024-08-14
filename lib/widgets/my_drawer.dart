import 'package:flutter/material.dart';
import 'package:oya_gym/utils/constants.dart';
import 'package:oya_gym/widgets/primary_text.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                // color: Colors.deepPurple,
                ),
            child: Center(
              child: PrimaryText(
                text: Constants.appName,
                color: Theme.of(context).primaryColor,
                fontSize: 23,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              size: 20,
            ),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              size: 20,
            ),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 20,
            ),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

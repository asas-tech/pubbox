import 'package:dashboard_widgets/dashboard_widgets.dart';
import 'package:flutter/material.dart';

class DrawerConfig {
  final List<DrawerItem> drawerList = [
    DrawerItem(
        title: 'Users',
        icon: Icons.person,
        menuItems: [MenuItem(title: 'App Users', routeName: 'appUseres')]),
  ];
}

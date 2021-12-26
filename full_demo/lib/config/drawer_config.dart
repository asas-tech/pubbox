import 'package:dashboard_widgets/dashboard_widgets.dart';
import 'package:flutter/material.dart';
import 'package:full_demo/ui/views/custom_pages/coming_soon.dart';
import 'package:full_demo/ui/views/main/home/home_view.dart';

class DrawerConfig {
  final List<DrawerItem> drawerList = [
    DrawerItem(
      title: 'Dashboard',
      icon: Icons.person,
      routeName: '/',
      child: const HomeView(),
    ),
    DrawerItem(
        title: 'Users',
        icon: Icons.person,
        routeName: '/user',
        menuItems: [
          MenuItem(
              title: 'App Users',
              routeName: '/users',
              child: const ComingSoonWidget()),
          MenuItem(
              title: 'App Users',
              routeName: '/dsd',
              child: const ComingSoonWidget()),
        ]),
  ];
}

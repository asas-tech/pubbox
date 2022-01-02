import 'package:dashboard_widgets/dashboard_widgets.dart';
import 'package:flutter/material.dart';
import 'package:full_demo/ui/views/custom_pages/coming_soon.dart';
import 'package:full_demo/ui/views/main/home/home_view.dart';

class DrawerConfig {
  final String? appName = 'pubbox';
  final String? appVersion = '1.0.0';
  final String? appIcon = 'assets/logo/logo.png';
  final List<DrawerItem> drawerList = [
    DrawerItem(
      title: 'Dashboard',
      icon: Icons.category,
      routeName: '/',
      child: const HomeView(),
    ),
    DrawerItem(
        title: 'Users',
        icon: Icons.person,
        routeName: '/user',
        isFirst: true,
        menuItems: [
          MenuItem(
              title: 'Add User',
              routeName: '/add',
              icon: Icons.add,
              child: const ComingSoonWidget()),
          MenuItem(
              title: 'App Users',
              routeName: '/app-users',
              child: const ComingSoonWidget()),
          MenuItem(
              title: 'Admin Users',
              routeName: '/admin-users',
              child: const ComingSoonWidget()),
        ]),
    DrawerItem(
        title: 'Settings',
        icon: Icons.settings,
        routeName: '/settings',
        isFirst: true,
        menuItems: [
          MenuItem(
              title: 'Config',
              routeName: '/config',
              child: const ComingSoonWidget()),
        ]),
  ];
}

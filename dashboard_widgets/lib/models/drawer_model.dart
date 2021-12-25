import 'package:flutter/material.dart';

class DrawerItem {
  final String title;
  final IconData? icon;
  final List<MenuItem>? menuItems;
  // set true if you want the menu to be expanded from the beginning
  final bool isFirst;

  DrawerItem({
    required this.title,
    this.icon,
    this.menuItems,
    this.isFirst = false,
  });
}

class MenuItem {
  final String title;
  final String routeName;
  final Widget? child;
  final List<MenuItem>? menuItems;
  final IconData? icon;
  final List<MenuItem>? stackedRoutes;

  MenuItem({
    required this.title,
    this.icon,
    required this.routeName,
    this.child,
    this.menuItems,
    this.stackedRoutes,
  });
}

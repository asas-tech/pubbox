import 'package:dashboard_widgets/dashboard_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_demo/generated/l10n.dart';
import 'package:full_demo/ui/views/custom_pages/coming_soon.dart';
import 'package:full_demo/ui/views/main/home/home_view.dart';
import 'package:full_demo/ui/views/main/settings/config/config_view.dart';

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
        title: 'Widgets',
        icon: CupertinoIcons.archivebox,
        routeName: '/widgets',
        isFirst: true,
        menuItems: [
          MenuItem(
              title: S.current.alert,
              routeName: '/alert',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.avatar,
              routeName: '/avatar',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.avatarGroup,
              routeName: '/avatar-group',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.badge,
              routeName: '/badge',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.breadcrumb,
              routeName: '/breadcrumb',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.button,
              routeName: '/buttons',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.buttonGroup,
              routeName: '/button-group',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.buttonToolbar,
              routeName: '/button-toolbar',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.calender,
              routeName: '/calendar',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.carousel,
              routeName: '/carousel',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.collapse,
              routeName: '/collapse',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.dropdown,
              routeName: '/dropdown',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.embed,
              routeName: '/embed',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.image,
              routeName: '/image',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.listGroup,
              routeName: '/list-group',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.mediaObject,
              routeName: '/media-object',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.modal,
              routeName: '/modal',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.nav,
              routeName: '/navs',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.overlay,
              routeName: '/overlay',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.pagination,
              routeName: '/pagination',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.pill,
              routeName: '/pill',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.popover,
              routeName: '/popover',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.progress,
              routeName: '/progress',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.sidebar,
              routeName: '/sidebar',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.spinner,
              routeName: '/spinner',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.tab,
              routeName: '/tabs',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.time,
              routeName: '/time',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.timeline,
              routeName: '/timeline',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.toast,
              routeName: '/toast',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
          MenuItem(
              title: S.current.tooltip,
              routeName: '/tooltip',
              child: const ComingSoonWidget(),
              label: S.current.comingSoon),
        ]),
    DrawerItem(
        title: 'Settings',
        icon: Icons.settings,
        routeName: '/settings',
        isFirst: false,
        menuItems: [
          MenuItem(
              title: 'Config', routeName: '/config', child: const ConfigView()),
        ]),
  ];
}

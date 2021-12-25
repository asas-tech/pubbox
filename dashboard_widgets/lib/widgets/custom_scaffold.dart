import 'package:flutter/material.dart';
import '../shared/responsive.dart';
import '../models/drawer_model.dart';
import 'sidebar.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {Key? key,
      required this.child,
      required this.drawerItems,
      this.backgroundColor,
      this.appbarColor})
      : super(key: key);

  final Widget child;
  final List<DrawerItem> drawerItems;
  final Color? backgroundColor, appbarColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
      drawer: Responsive.isMobile(context)
          ? SideBar(
              drawerList: drawerItems,
              isCollapsed: false,
            )
          : null,
      appBar: PreferredSize(
        preferredSize: const Size(0, 90),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: AppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(12),
                  top: Radius.circular(12),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: InkWell(
                        onTap: () {}, child: const Icon(Icons.notifications)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: InkWell(
                        onTap: () {}, child: const Icon(Icons.account_box)),
                  ),
                ],
              ),
              backgroundColor: appbarColor ?? Theme.of(context).primaryColor),
        ),
      ),
      body: child,
    );
  }
}

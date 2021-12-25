import 'package:dashboard_widgets/dashboard_widgets.dart';
import 'package:flutter/material.dart';
import '/config/drawer_config.dart';
import '/ui/views/custom_pages/coming_soon.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key, this.child}) : super(key: key);

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Responsive.isMobile(context)
              ? const SizedBox()
              : SideBar(
                  drawerList: DrawerConfig().drawerList,
                  isCollapsed: false,
                ),
          Expanded(
              child: CustomScaffold(
                  drawerItems: DrawerConfig().drawerList,
                  child: child ?? const ComingSoonWidget()))
        ],
      ),
    );
  }
}

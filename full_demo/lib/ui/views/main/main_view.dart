import 'package:dashboard_widgets/dashboard_widgets.dart';
import 'package:flutter/material.dart';
import 'package:full_demo/app/locator.dart';
import 'package:full_demo/services/shared_prefrences_service.dart';
import '/config/drawer_config.dart';
import '/ui/views/custom_pages/coming_soon.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key, this.child}) : super(key: key);

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        textDirection: locator<SharedPreferenceService>().isRtl
            ? TextDirection.rtl
            : TextDirection.ltr,
        children: [
          Responsive.isMobile(context)
              ? const SizedBox()
              : Responsive.isTablet(context)
                  ? SideBar(
                      drawerList: DrawerConfig().drawerList,
                      isCollapsed: true,
                      appName: DrawerConfig().appName ?? 'Dashboard',
                      isRtl: locator<SharedPreferenceService>().isRtl,
                      logo: DrawerConfig().appIcon != null
                          ? Image.asset(DrawerConfig().appIcon!)
                          : null,
                    )
                  : SideBar(
                      drawerList: DrawerConfig().drawerList,
                      isCollapsed: false,
                      appName: DrawerConfig().appName ?? 'Dashboard',
                      isRtl: locator<SharedPreferenceService>().isRtl,
                      logo: DrawerConfig().appIcon != null
                          ? Image.asset(DrawerConfig().appIcon!)
                          : null,
                    ),
          Expanded(
              child: CustomScaffold(
                  drawerItems: DrawerConfig().drawerList,
                  appName: DrawerConfig().appName ?? 'Dashboard',
                  logo: DrawerConfig().appIcon != null
                      ? Image.asset(DrawerConfig().appIcon!)
                      : null,
                  userIcon: const CustomAvatar(
                    name: 'User',
                    backgroundColor: Colors.white,
                    size: 50,
                  ),
                  userName: 'John Doe',
                  userRole: 'Admin',
                  isRtl: locator<SharedPreferenceService>().isRtl,
                  child: child ?? const ComingSoonWidget()))
        ],
      ),
    );
  }
}

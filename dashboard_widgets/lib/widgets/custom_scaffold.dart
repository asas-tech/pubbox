import 'package:dashboard_widgets/dashboard_widgets.dart';
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
      this.appbarColor,
      this.isRtl = false,
      this.appName,
      this.logo,
      this.showUser = true,
      this.showNotification = true,
      this.showUserData = true,
      this.userIcon,
      this.userName,
      this.userRole})
      : super(key: key);

  final Widget child;
  final List<DrawerItem> drawerItems;
  final Color? backgroundColor, appbarColor;
  final bool isRtl;
  final String? appName;
  final Widget? logo;
  final bool showUser, showUserData, showNotification;
  final Widget? userIcon;
  final String? userName;
  final String? userRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
      drawer: Responsive.isMobile(context)
          ? SideBar(
              drawerList: drawerItems,
              isCollapsed: false,
              appName: appName,
              logo: logo,
            )
          : null,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppBar(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(12),
                      top: Radius.circular(12),
                    ),
                  ),
                  elevation: 0.0,
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  title: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (showNotification)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: InkWell(
                                onTap: () {},
                                child: const Icon(Icons.notifications)),
                          ),
                        if (showUser)
                          Row(
                            children: [
                              if (showUserData)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      userName ?? '',
                                    ),
                                    Text(
                                      userRole ?? '',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              horizontalSpaceSmall,
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: userIcon ??
                                    InkWell(
                                      onTap: () {},
                                      child: const CustomAvatar(
                                        backgroundColor: Colors.white,
                                        name: 'User',
                                      ),
                                    ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  backgroundColor:
                      appbarColor ?? Theme.of(context).primaryColor),
            ],
          ),
        ),
      ),
      body: child,
    );
  }
}

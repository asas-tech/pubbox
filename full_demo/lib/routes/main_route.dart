import 'package:dashboard_widgets/dashboard_widgets.dart';
import 'package:flutter/material.dart';
import 'package:full_demo/config/drawer_config.dart';
import '/ui/views/main/main_view.dart';

import 'package:vrouter/vrouter.dart';

class MainRoute extends VRouteElementBuilder {
  @override
  List<VRouteElement> buildRoutes() {
    return [
      VNester(
          path: null,
          key: const ValueKey(''),
          name: '',
          widgetBuilder: (child) => MainView(
                child: child,
              ),
          nestedRoutes: [
            // Navigation Routes
            for (DrawerItem item in DrawerConfig().drawerList)
              if (item.menuItems != null)
                for (MenuItem menuItem in item.menuItems!)
                  VWidget(
                      stackedRoutes: [
                        if (menuItem.stackedRoutes != null)
                          for (MenuItem? stackedItem in menuItem.stackedRoutes!)
                            VWidget(
                                path: stackedItem?.routeName ?? '',
                                widget: stackedItem?.child ?? Container())
                      ],
                      path: menuItem.routeName,
                      widget: menuItem.child ?? const SizedBox())
          ])
    ];
  }
}
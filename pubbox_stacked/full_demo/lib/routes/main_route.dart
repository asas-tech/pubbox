import 'package:dashboard_widgets/dashboard_widgets.dart';
import 'package:flutter/material.dart';
import '/config/drawer_config.dart';
import '/services/shared_prefrences_service.dart';
import '/ui/views/auth/login_or_register/login_or_register_view.dart';
import '/ui/views/custom_pages/unknown_path.dart';
import '/ui/views/main/main_view.dart';

import 'package:vrouter/vrouter.dart';

class MainRoute extends VRouteElementBuilder {
  final SharedPreferenceService _prefs;

  MainRoute(this._prefs);
  @override
  List<VRouteElement> buildRoutes() {
    return [
      VGuard(
        beforeEnter: (vRedirector) async {
          if (!_prefs.isLoggedIn) {
            vRedirector.to('/login');
          }
        },
        stackedRoutes: [
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
                    VWidget(
                        path: item.routeName,
                        widget: item.child ?? const SizedBox(),
                        stackedRoutes: [
                          for (MenuItem menuItem in item.menuItems!)
                            VWidget(
                              path: '${item.routeName}${menuItem.routeName}',
                              widget: menuItem.child ?? const SizedBox(),
                              stackedRoutes: [
                                if (menuItem.stackedRoutes != null)
                                  for (MenuItem? stackedItem
                                      in menuItem.stackedRoutes!)
                                    VWidget(
                                        path:
                                            '${item.routeName}${menuItem.routeName}${stackedItem?.routeName ?? ''}',
                                        widget:
                                            stackedItem?.child ?? Container())
                              ],
                            )
                        ])
              ]),
        ],
      ),

      VGuard(
        beforeEnter: (vRedirector) async {
          if (_prefs.isLoggedIn) {
            vRedirector.to('/');
          }
        },
        stackedRoutes: [
          VWidget(
            path: '/login',
            widget: Builder(
              builder: (context) => LoginOrRegisterView(
                // This function is called when login button is pressed
                onLogin: (context) {
                  _prefs.isLoggedIn = true;
                  context.vRouter.to('/');
                },
              ),
            ),
          ),
        ],
      ),

      // if the url is not found show the 404 not found page
      VWidget(
          path: '*',
          widget: UnknownPathWidget(
            goToHome: (context) {
              context.vRouter.to('/');
            },
          ))
    ];
  }
}

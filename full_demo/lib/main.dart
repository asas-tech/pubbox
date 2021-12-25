import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:vrouter/vrouter.dart';

import 'app/locator.dart';
import 'generated/l10n.dart';
import 'routes/main_route.dart';
import 'services/shared_prefrences_service.dart';

import 'ui/shared/app_theme.dart';
import 'ui/shared/setup/bottomsheet/setup_bottomsheet_ui.dart';
import 'ui/shared/setup/dialogs/setup_dialog_ui.dart';
import 'ui/shared/setup/snackbar/setup_snackbar_ui.dart';
import 'ui/views/auth/login_or_register/login_or_register_view.dart';
import 'ui/views/custom_pages/unknown_path.dart';

void main() async {
  // await Firebase.initializeApp();
  await ThemeManager.initialise();

  await configureInjection();

  setupDialogUi();
  setupSnackbarUi();
  setupBottomSheetUi();
  WidgetsFlutterBinding.ensureInitialized();

  await GetIt.I.isReady<SharedPreferenceService>();
  // await GetIt.I.isReady<ApiHelper>();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FirebaseAnalytics analytics = FirebaseAnalytics();
    final _prefs = locator<SharedPreferenceService>();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: ThemeBuilder(
        lightTheme: lightTheme(context),
        darkTheme: darkTheme(context),
        defaultThemeMode: ThemeMode.light,
        builder: (context, regularTheme, darkTheme, themeMode) => VRouter(
          initialUrl: '/login',
          buildTransition: (animation1, _, child) =>
              FadeTransition(opacity: animation1, child: child),
          transitionDuration: const Duration(milliseconds: 100),
          routes: [
            VGuard(
              beforeEnter: (vRedirector) async {
                if (!_prefs.isLoggedIn) {
                  vRedirector.to('/login');
                }
              },
              stackedRoutes: [
                MainRoute(),
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
          ],
          title: 'Dashboard',
          debugShowCheckedModeBanner: false,
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          navigatorKey: StackedService.navigatorKey,
          locale: Locale(_prefs.locale),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        ),
      ),
    );
  }
}

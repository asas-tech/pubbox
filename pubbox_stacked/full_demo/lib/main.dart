import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
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
import 'ui/views/main/settings/config/config_viewmodel.dart';

void main() async {
  await ThemeManager.initialise();

  await configureInjection();
  setupDialogUi();
  setupSnackbarUi();
  setupBottomSheetUi();

  WidgetsFlutterBinding.ensureInitialized();
  // to make sure that shared preferences are initialized
  await GetIt.I.isReady<SharedPreferenceService>();
  // await GetIt.I.isReady<ApiHelper>();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _prefs = locator<SharedPreferenceService>();
    return ViewModelBuilder<ConfigViewModel>.reactive(
      disposeViewModel: false,
      builder: (context, model, _) {
        return GestureDetector(
          onTap: () {
            // for ios to remove keyboard focus
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              currentFocus.focusedChild?.unfocus();
            }
          },
          child: ThemeBuilder(
            // to setup light theme
            lightTheme: lightTheme(context),
            //to setup dark theme
            darkTheme: darkTheme(context),
            defaultThemeMode: ThemeMode.light,
            builder: (context, regularTheme, darkTheme, themeMode) => VRouter(
              //first route
              initialUrl: '/login',
              buildTransition: (animation1, _, child) =>
                  FadeTransition(opacity: animation1, child: child),
              transitionDuration: const Duration(milliseconds: 100),
              routes: [MainRoute(_prefs)],
              //Todo : change app name
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
      },
      viewModelBuilder: () => locator<ConfigViewModel>(),
    );
  }
}

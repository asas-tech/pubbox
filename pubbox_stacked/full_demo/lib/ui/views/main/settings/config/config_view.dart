import 'package:dashboard_widgets/dashboard_widgets.dart';
import 'package:flutter/material.dart';
import 'package:full_demo/app/locator.dart';
import 'package:full_demo/models/language.dart';
import 'package:full_demo/ui/shared/app_colors.dart';
import 'package:full_demo/ui/views/main/settings/config/config_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ConfigView extends StatelessWidget {
  const ConfigView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ConfigViewModel>.reactive(
      disposeViewModel: false,
      builder: (context, model, child) {
        return Column(
          children: [
            const BreadCrumb(icon: Icon(Icons.settings), useRouterPath: true),
            verticalSpaceMedium,
            Container(
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('rtl'),
                    value: model.isRtl,
                    onChanged: model.setRtl,
                    activeColor: kPrimaryColor,
                  ),
                  SwitchListTile(
                    title: const Text('is Floating'),
                    value: model.isFloating,
                    onChanged: model.setIsFloating,
                    activeColor: kPrimaryColor,
                  ),
                  CustomDropDown<Language>(
                    value: model.selectedLanguage,
                    onChanged: model.onChangeLanguage,
                    itemList: model.languages,
                  )
                ],
              ),
            )
          ],
        );
      },
      viewModelBuilder: () => locator<ConfigViewModel>(),
    );
  }
}

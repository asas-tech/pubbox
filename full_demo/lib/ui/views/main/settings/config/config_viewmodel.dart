import 'package:full_demo/app/locator.dart';
import 'package:full_demo/models/language.dart';
import 'package:full_demo/services/shared_prefrences_service.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class ConfigViewModel extends BaseViewModel {
  bool get isRtl => locator<SharedPreferenceService>().isRtl;

  Language _selectedLanguage = Language('English', 'en');
  Language get selectedLanguage => _selectedLanguage;

  List<Language> get languages =>
      [Language('English', 'en'), Language('عربي', 'ar')];

  void setRtl(bool? value) {
    locator<SharedPreferenceService>().isRtl = value ?? false;
    notifyListeners();
  }

  bool get isFloating => locator<SharedPreferenceService>().isFloating;
  void setIsFloating(bool? value) {
    locator<SharedPreferenceService>().isFloating = value ?? false;
    notifyListeners();
  }

  void onChangeLanguage(Language value) {
    _selectedLanguage = value;
  }
}

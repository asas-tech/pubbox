import 'package:full_demo/app/locator.dart';
import 'package:full_demo/services/shared_prefrences_service.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class ConfigViewModel extends BaseViewModel {
  bool get isRtl => locator<SharedPreferenceService>().isRtl;
  bool get isFloating => locator<SharedPreferenceService>().isFloating;

  void setRtl(bool? value) {
    locator<SharedPreferenceService>().isRtl = value ?? false;
    notifyListeners();
  }
}

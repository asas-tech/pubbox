import 'package:full_demo/services/shared_prefrences_service.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import '../../../../app/locator.dart';
import 'login_or_register_view.dart';

@lazySingleton
class LoginOrRegisterViewModel extends BaseViewModel {
  final _prefs = locator<SharedPreferenceService>();
  void login(String username, String password) {
    setBusy(true);
    _prefs.isLoggedIn = true;
    setBusy(false);
  }

  Option _selectedOption = Option.LogIn;
  Option get selectedOption => _selectedOption;

  chooseOption() {
    _selectedOption =
        _selectedOption == Option.LogIn ? Option.SignUp : Option.LogIn;
    notifyListeners();
  }

  Future<void> signOut() async {
    notifyListeners();
  }
}

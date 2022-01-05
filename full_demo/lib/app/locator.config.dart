// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i3;

import '../services/shared_prefrences_service.dart' as _i7;
import '../services/third_party_services_module.dart' as _i8;
import '../ui/views/auth/login_or_register/login_or_register_viewmodel.dart'
    as _i5;
import '../ui/views/main/main_viewmodel.dart' as _i6;
import '../ui/views/main/settings/config/config_viewmodel.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.BottomSheetService>(
      () => thirdPartyServicesModule.bottomSheetService);
  gh.lazySingleton<_i4.ConfigViewModel>(() => _i4.ConfigViewModel());
  gh.lazySingleton<_i3.DialogService>(
      () => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<_i5.LoginOrRegisterViewModel>(
      () => _i5.LoginOrRegisterViewModel());
  gh.lazySingleton<_i6.MainViewModel>(() => _i6.MainViewModel());
  gh.singletonAsync<_i7.SharedPreferenceService>(
      () => _i7.SharedPreferenceService.getInstance());
  gh.lazySingleton<_i3.SnackbarService>(
      () => thirdPartyServicesModule.snackbarService);
  return get;
}

class _$ThirdPartyServicesModule extends _i8.ThirdPartyServicesModule {
  @override
  _i3.BottomSheetService get bottomSheetService => _i3.BottomSheetService();
  @override
  _i3.DialogService get dialogService => _i3.DialogService();
  @override
  _i3.SnackbarService get snackbarService => _i3.SnackbarService();
}

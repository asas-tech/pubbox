import '../../../../app/locator.dart';
import '../../../../enums/snackbar_type.dart';
import '../../app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked_services/stacked_services.dart';

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  // Registers a config to be used when calling showSnackbar
  service.registerSnackbarConfig(SnackbarConfig(
    backgroundColor: kPrimaryColor.withOpacity(0.95),
    textColor: Colors.white,
    mainButtonTextColor: Colors.black,
  ));

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.top,
    config: SnackbarConfig(
        backgroundColor: kPrimaryColor.withOpacity(0.95),
        textColor: Colors.white,
        borderRadius: 1,
        snackPosition: SnackPosition.TOP),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.bottom,
    config: SnackbarConfig(
      backgroundColor: kPrimaryColor.withOpacity(0.95),
      titleColor: Colors.white,
      messageColor: Colors.white,
      borderRadius: 1,
    ),
  );
}

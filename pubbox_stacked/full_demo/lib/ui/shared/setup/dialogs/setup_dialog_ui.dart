import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'basic_dialog.dart';
import '/app/locator.dart';
import '/enums/dialog_type.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();
  final builders = {
    DialogType.basic: (BuildContext context, DialogRequest request,
            Function(DialogResponse) completer) =>
        BasicDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

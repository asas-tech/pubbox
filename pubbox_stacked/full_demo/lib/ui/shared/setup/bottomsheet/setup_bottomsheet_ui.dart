import 'package:dashboard_widgets/shared/ui_helpers.dart';

import '../../../../app/locator.dart';
import '../../../../enums/bottomsheet_type.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.floating: (context, sheetRequest, completer) =>
        _FloatingBoxBottomSheet(request: sheetRequest, completer: completer)
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}

class _FloatingBoxBottomSheet extends StatelessWidget {
  final SheetRequest? request;
  final Function(SheetResponse)? completer;
  const _FloatingBoxBottomSheet({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            request!.title!,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
            ),
          ),
          verticalSpaceSmall,
          Text(
            request!.description!,
            style: const TextStyle(color: Colors.grey),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () => completer!(SheetResponse(confirmed: true)),
                child: Text(
                  request!.secondaryButtonTitle!,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              TextButton(
                onPressed: () => completer!(SheetResponse(confirmed: true)),
                child: Text(
                  request!.mainButtonTitle!,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

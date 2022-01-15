import 'package:dashboard_widgets/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app_colors.dart';
import '/enums/dialog_type.dart';
import '/ui/shared/setup/dialogs/colors_status.dart';

class BasicDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const BasicDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: _BasicDialogContent(request: request, completer: completer),
    );
  }
}

class _BasicDialogContent extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const _BasicDialogContent(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          margin: EdgeInsets.symmetric(
              horizontal: screenHeightPercentage(context, percentage: 0.04)),
          padding:
              const EdgeInsets.only(top: 32, left: 80, right: 80, bottom: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpaceSmall,
              Text(
                request.title ?? '',
                textAlign: TextAlign.center,
              ),
              verticalSpaceSmall,
              Text(
                request.description ?? '',
                textAlign: TextAlign.center,
              ),
              verticalSpaceMedium,
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (request.secondaryButtonTitle != null)
                    TextButton(
                      onPressed: () =>
                          completer(DialogResponse(confirmed: false)),
                      child: Text(
                        request.secondaryButtonTitle!,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  TextButton(
                    onPressed: () => completer(DialogResponse(confirmed: true)),
                    child: Text(request.mainButtonTitle ?? ''),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: -28,
          child: CircleAvatar(
            minRadius: 16,
            maxRadius: 28,
            backgroundColor: _getStatusColor(request.customData),
            child: Icon(
              _getStatusIcon(request.customData),
              size: 28,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Color _getStatusColor(dynamic customeData) {
    switch (customeData) {
      case BasicDialogStatus.error:
        return kRedColor;
      case BasicDialogStatus.warning:
        return kOrangeColor;
      default:
        return kPrimaryColor;
    }
  }

  IconData _getStatusIcon(dynamic customeData) {
    switch (customeData) {
      case BasicDialogStatus.error:
        return Icons.close;
      case BasicDialogStatus.warning:
        return Icons.warning_amber;

      default:
        return Icons.check;
    }
  }
}

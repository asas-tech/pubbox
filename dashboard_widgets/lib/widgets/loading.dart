import 'package:flutter/material.dart';
import '/shared/ui_helpers.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key, this.width}) : super(key: key);
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: width ?? screenWidth(context),
      child: Center(
          child: CircularProgressIndicator.adaptive(
        valueColor:
            AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
      )),
    );
  }
}

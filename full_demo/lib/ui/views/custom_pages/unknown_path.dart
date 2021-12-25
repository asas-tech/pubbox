import 'package:dashboard_widgets/dashboard_widgets.dart';
import 'package:flutter/material.dart';

class UnknownPathWidget extends StatelessWidget {
  const UnknownPathWidget({Key? key, required this.goToHome}) : super(key: key);

  final Function(BuildContext) goToHome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpaceSmall,
              const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    '404',
                    style: TextStyle(fontSize: 150, color: Colors.white),
                  )),
              verticalSpaceSmall,
              const Text(
                'OOPPS! THE PAGE YOU WERE LOOKING FOR, COULDN\'T BE FOUND.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
              verticalSpaceMedium,
              GestureDetector(
                onTap: () => goToHome(context),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    'Go Back ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 18),
                  ),
                ),
              ),
              verticalSpaceLarge,
            ],
          ),
        ),
      ),
    );
  }
}

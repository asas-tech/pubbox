import 'package:dashboard_widgets/dashboard_widgets.dart';
import 'package:flutter/material.dart';
import 'package:full_demo/ui/shared/app_colors.dart';
import 'package:vrouter/vrouter.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpaceSmall,
              const Text(
                'THIS PAGE IS UNDER CONSTRUCTION',
                textAlign: TextAlign.center,
                style: TextStyle(color: kPrimaryColor, fontSize: 28),
              ),
              verticalSpaceMedium,
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    context.vRouter.path,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
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

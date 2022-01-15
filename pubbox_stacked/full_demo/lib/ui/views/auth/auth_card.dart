import 'package:dashboard_widgets/dashboard_widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vrouter/vrouter.dart';

import '../../../app/locator.dart';
import '../../../ui/shared/app_colors.dart';

import 'auth_form.dart';
import 'login_or_register/login_or_register_viewmodel.dart';

class AuthCard extends StatefulWidget {
  final Function onChangeForm;
  final bool isLogin;

  const AuthCard({
    Key? key,
    required this.onChangeForm,
    this.isLogin = true,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ViewModelBuilder<LoginOrRegisterViewModel>.reactive(
      disposeViewModel: false,
      builder: (context, model, child) => model.isBusy
          ? const Loading()
          : Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height > 770
                      ? 64
                      : size.height > 670
                          ? 32
                          : 16,
                  horizontal: size.width > 650 ? 40 : 0),
              child: Center(
                child: Card(
                  elevation: 4,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: size.height *
                        (size.height > 770
                            ? 0.7
                            : size.height > 670
                                ? 0.8
                                : 0.9),
                    width: 500,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ChooseAuthWidget(
                                    title: 'Login',
                                    isSelected: widget.isLogin,
                                    onChangeForm: widget.onChangeForm,
                                  ),
                                  horizontalSpaceMedium,
                                  ChooseAuthWidget(
                                    title: 'Register',
                                    isSelected: !widget.isLogin,
                                    onChangeForm: widget.onChangeForm,
                                  ),
                                ],
                              ),
                              verticalSpaceMedium,
                              AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  switchOutCurve: Curves.easeInOutCubic,
                                  switchInCurve: Curves.easeInOutCubic,
                                  transitionBuilder: (widget, animation) =>
                                      ScaleTransition(
                                          child: widget, scale: animation),
                                  child: widget.isLogin
                                      ? AuthForm(
                                          key: UniqueKey(),
                                          isLogin: true,
                                        )
                                      : AuthForm(
                                          key: UniqueKey(),
                                          isLogin: false,
                                        )),
                              const SizedBox(
                                height: 64,
                              ),
                              CustomButton(
                                label: widget.isLogin ? 'Login' : 'Register',
                                fitWidth: true,
                                onTap: () {
                                  model.login('', 'password');
                                  context.vRouter.to('/');
                                },
                              ),
                              verticalSpaceMedium,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
      viewModelBuilder: () => locator<LoginOrRegisterViewModel>(),
    );
  }
}

class ChooseAuthWidget extends StatelessWidget {
  const ChooseAuthWidget({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onChangeForm,
  }) : super(key: key);

  final String title;
  final bool isSelected;
  final Function onChangeForm;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChangeForm(),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: isSelected ? Colors.grey[700] : Colors.grey[400],
            ),
          ),
          verticalSpaceSmall,
          SizedBox(
            width: 30,
            child: Divider(
              color: isSelected ? kPrimaryColor : Colors.transparent,
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}

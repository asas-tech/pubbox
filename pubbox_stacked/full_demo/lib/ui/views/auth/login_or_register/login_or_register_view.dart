import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../auth_card.dart';
import '../../../../app/locator.dart';
import 'login_or_register_viewmodel.dart';

class LoginOrRegisterView extends StatelessWidget {
  const LoginOrRegisterView({Key? key, required this.onLogin})
      : super(key: key);

  final Function(BuildContext) onLogin;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ViewModelBuilder<LoginOrRegisterViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: size.width / 2,
                    color: Theme.of(context).primaryColor,
                  ),
                  Container(
                      height: double.infinity,
                      width: size.width / 2,
                      color: Colors.black),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(
                        Icons.copyright,
                        color: Colors.grey,
                        size: 24,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Copyright ASAS-TECH 2022",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AuthCard(
                isLogin: model.selectedOption == Option.LogIn ? true : false,
                onChangeForm: () => model.chooseOption(),
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => locator<LoginOrRegisterViewModel>(),
    );
  }
}

enum Option { LogIn, SignUp }

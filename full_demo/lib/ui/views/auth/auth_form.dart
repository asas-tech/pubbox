import 'package:dashboard_widgets/dashboard_widgets.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({Key? key, required this.isLogin}) : super(key: key);

  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedCrossFade(
            firstChild: const TextField(
              decoration: InputDecoration(
                hintText: '',
                labelText: 'Username',
                suffixIcon: Icon(
                  Icons.person_outline,
                ),
              ),
            ),
            secondChild: Container(),
            crossFadeState:
                isLogin ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 100)),
        verticalSpaceMedium,
        const TextField(
          decoration: InputDecoration(
            hintText: 'Email',
            labelText: 'Email',
            suffixIcon: Icon(
              Icons.mail_outline,
            ),
          ),
        ),
        verticalSpaceMedium,
        const TextField(
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            suffixIcon: Icon(
              Icons.lock_outline,
            ),
          ),
        ),
        verticalSpaceMedium,
        AnimatedCrossFade(
            firstChild: const TextField(
              decoration: InputDecoration(
                hintText: '',
                labelText: 'Confirm Password',
                suffixIcon: Icon(
                  Icons.mail_outline,
                ),
              ),
            ),
            secondChild: Container(),
            crossFadeState:
                isLogin ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 100)),
      ],
    );
  }
}

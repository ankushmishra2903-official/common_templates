import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import '../home.dart';

/// flutter pub add flutter_login

const users = const {
  'test@gmail.com': '12345',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return '';
    });
  }

  Future<String> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: FlutterLogin(
          title: 'flutter_login',
          logo: 'assets/logo.png',
          onLogin: _authUser,
          onSignup: _authUser,
          onSubmitAnimationCompleted: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          },
          theme: LoginTheme(
            switchAuthTextColor: Colors.blue
          ),
          navigateBackAfterRecovery: true,
          messages: LoginMessages(
            recoverPasswordSuccess: 'password is 12345'
          ),
          onRecoverPassword: _recoverPassword,
        ),
      ),
    );
  }
}

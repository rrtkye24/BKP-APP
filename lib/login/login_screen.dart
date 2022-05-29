import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/constant.dart';
import '/login/widget/login_button.dart';
import '/login/widget/login_form.dart';
import '/login/widget/welcome_back.dart';

class LoginScreen extends StatelessWidget {
  // final _formKey = GlobalKey<FormState>();
  // late String txtemail, txtpassword;
  // final _auth = FirebaseAuth.instance;
  // @override
  // void _signIn() async {
  //   try {
  //     final newUser = await _auth.signInWithEmailAndPassword(
  //         email: txtemail, password: txtpassword);
  //     if (newUser != null) {
  //       print("Success");
  //     } else {
  //       print("fail");
  //     }
  //   } catch (e) {}
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const WelcomeBack(),
          const LoginForm(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot password?',
              style: TextStyle(color: mPrimaryColor),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          const LoginButton(),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 16,
            ),
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(style: const TextStyle(color: Colors.grey), children: [
                const TextSpan(text: 'Don\'t have an account? '),
                TextSpan(
                  text: 'Register',
                  style: TextStyle(
                    color: mPrimaryColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pop(context);
                    },
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: mBackgroundColor,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Login',
        style: TextStyle(
          color: mPrimaryTextColor,
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: mPrimaryTextColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      return result;
    } catch (e) {}
  }
}

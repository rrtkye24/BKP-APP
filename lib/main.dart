import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:bkp/contansts.dart';
import 'package:bkp/ui/home.dart';
import './login/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
void main() async {
  await Future.delayed(Duration(seconds: 3));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // hexColor(String colorhexcode) {
  //   String colornew = '0xff' + colorhexcode;
  //   colornew = colornew.replaceAll('#', '');
  //   int colorint = int.parse(colornew);
  //   return colorint;
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return
    return MaterialApp(
      title: 'BKP"S APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroudColor,
      ),
        home: LoginScreen(),
    );
  }
}

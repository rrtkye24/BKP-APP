import 'package:bkp/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:bkp/contansts.dart';
import 'package:bkp/ui/home.dart';
import './login/login_screen.dart';
import './auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire_ui/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: LoginWidget(),
    );
  }
}

// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Home();
//         } else {
//           return SignInScreen(
//             providerConfigs: [
//               EmailProviderConfiguration(),
//             ],
//           );
//         }
//       });
// }

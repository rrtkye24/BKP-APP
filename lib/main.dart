import 'package:bkp/auth/google_sign_in.dart';
import 'package:bkp/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bkp/contansts.dart';
import './auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import './home/home.dart';
import 'package:provider/provider.dart';
import 'auth/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Future.delayed(const Duration(seconds: 3));
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         Provider<AuthService>(
//           create: (_) => AuthService(FirebaseAuth.instance),
//         ),
//         StreamProvider(
//           create: (context) => context.read<AuthService>().authStateChanges,
//         ),
//       ],
//       child: MaterialApp(
//         title: "APP",
//         home: AuthWrapper(),
//       ),
//     );
//   }
// }

// class AuthWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final user = context.watch<User>();

//     if (user != null) {
//       return LoginScreen();
//     }
//     return HomePageWidget();
//   }
// }
// class AuthWrapper extends StatelessWidget {
//   const AuthWrapper({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//      final user = context.watch<User>();

//     if (user != null) {
//       return LoginScreen();
//     }
//     return HomePageWidget();
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // hexColor(String colorhexcode) {
  //   String colornew = '0xff' + colorhexcode;
  //   colornew = colornew.replaceAll('#', '');
  //   int colorint = int.parse(colornew);
  //   return colorint;
  // }

  @override
  Widget build(BuildContext context) {
    // return
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: 'BKP"S APP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroudColor,
        ),
        home: const Auth(),
      ),
    );
  }
}

// class Auth extends StatelessWidget {
//   const Auth({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final initialRoute = FirebaseAuth.instance.currentUser;
//     if (initialRoute != null) {
//       // return HomePageWidget();
//       return LoginWidget();
//     } else {
//       return LoginWidget();
//     }
//   }
// }

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return const Center(
                child: HomePageWidget(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong '),
              );
            } else {
              return const LoginWidget();
            }
          }),
    );
  }
}

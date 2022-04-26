import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'flutterfire.dart';
import 'login.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth auth = FirebaseAuth.instance;
  if (auth.currentUser != null) {
    print("already signed out");
  } else {
    print("signed out");
  }
// // Ideal time to initialize
// await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
//...
}

Future<void> checkAuth() async {
  await Firebase.initializeApp();
}

Future<void> signUp() async {
  await Firebase.initializeApp();
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "bkpadmin@bkp.bn", password: "bkpadmin123");
    print("signup success");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print("The password provided is too weak");
    } else if (e.code == 'email-already-in-use') {
      print('The account already exist for that email');
    }
  } catch (e) {
    print(e.toString());
  }
}
  // Future signIn({String emailAddressLoginController,}) async {
    // await FirebaseAuth.instance.signInWithEmailAndPassword(
    //                                           email: emailAddressLoginController.text.trim,
    //                                           password: passwordLoginController.text.trim
    //                                          );
    //     



Future<void> signOut() async {
  await Firebase.initializeApp();
}

Future<void> resetPassword() async {
  await Firebase.initializeApp();
}

Future<void> verifyEmail() async {
  await Firebase.initializeApp();
}

Future<void> forgotPassword() async {
  await Firebase.initializeApp();
}

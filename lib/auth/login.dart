import 'package:bkp/auth/forgot_pasword.dart';
import 'package:bkp/auth/google_sign_in.dart';
import 'package:bkp/home/home.dart';
// import 'package:bkp/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import './forgot_pasword.dart';
// import '../home/laporan_barang.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisibility = false;
  TextEditingController passwordConfirmController = TextEditingController();
  bool passwordConfirmVisibility = false;
  TextEditingController emails = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passwordLoginVisibility = true;
  final _fire = Firebase.initializeApp;
  final _auth = FirebaseAuth.instance;
  String validatePassword(value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else {
      return ('');
    }
  }

  @override
  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFF14181B),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/frame.jpg',
              ).image,
            ),
          ),
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                //   image: DecorationImage(
                //     fit: BoxFit.cover,
                //     image: Image.asset(
                //       'icons/logo.png',
                //     ).image,
                //   ),
                ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                          child: Image.asset(
                            'icons/logo.png',
                            //
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          const TabBar(
                            isScrollable: true,
                            labelColor: Colors.black,
                            labelStyle: TextStyle(
                              fontFamily: 'Outfit',
                              color: Color(0xFF0F1113),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            indicatorColor: Colors.white,
                            tabs: [
                              Tab(
                                text: 'Sign In',
                              ),
                              Tab(
                                text: 'Sign Up',
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      44, 0, 44, 0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 20, 0, 0),
                                          child: TextFormField(
                                            controller: emails,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              labelText: 'Email Address',
                                              labelStyle: const TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              hintStyle: const TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(20, 24, 20, 24),
                                            ),
                                            style: const TextStyle(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            onSaved: (emailsignin) {
                                              emails.text = emailsignin!;
                                            },
                                            textInputAction:
                                                TextInputAction.next,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 12, 0, 0),
                                          child: TextFormField(
                                            controller: password,
                                            validator: validatePassword,
                                            obscureText:
                                                passwordLoginVisibility,
                                            decoration: InputDecoration(
                                              labelText: 'Password',
                                              labelStyle: const TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              hintStyle: const TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(20, 24, 20, 24),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                  () => passwordLoginVisibility =
                                                      !passwordLoginVisibility,
                                                ),
                                                child: Icon(
                                                  // Icons.visibility_outlined,
                                                  passwordLoginVisibility
                                                      ? Icons
                                                          .visibility_off_outlined
                                                      : Icons
                                                          .visibility_outlined,
                                                  color:
                                                      const Color(0xFF95A1AC),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            style: const TextStyle(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            onSaved: (pass) {
                                              password.text = pass!;
                                            },
                                            textInputAction:
                                                TextInputAction.done,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 24, 0, 0),
                                          child: RaisedButton(
                                            onPressed: () async {
                                              // signIn(
                                              //     email.text, password.text);
                                              final String email =
                                                  emails.text.trim();
                                              final String passwords =
                                                  password.text.trim();

                                              if (email.isEmpty) {
                                                print("Email kosong");
                                                Fluttertoast.showToast(
                                                    msg: "Email Kosong",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Colors.brown[200],
                                                    textColor: Colors.black,
                                                    fontSize: 16.0);
                                              } else {
                                                if (passwords.isEmpty) {
                                                  print("Password kosong");
                                                  Fluttertoast.showToast(
                                                      msg: "Password Kosong",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      backgroundColor:
                                                          Colors.brown[200],
                                                      textColor: Colors.black,
                                                      fontSize: 16.0);
                                                } else {
                                                  signIn(email, passwords);
                                                }
                                              }

                                              // await signUp();
                                              //  SignInSignUpResult result = await AuthServices.createUser(
                                              // email: emailAddressLoginController.text, pass: passwordLoginController.text);
                                            },
                                            child: const Text('Login'),
                                            // text: 'Login',
                                            // options: FFButtonOptions(
                                            //   width: 230,
                                            //   height: 50,
                                            color: const Color(0xFFEEC286),
                                            // style:
                                            // TextStyle(
                                            //       fontFamily:
                                            //           'Lexend Deca',
                                            //       color: Colors.white,
                                            //       fontSize: 16,
                                            //       fontWeight:
                                            //           FontWeight.normal,
                                            //     ),
                                            elevation: 3,
                                            //   borderSide: BorderSide(
                                            //     color: Colors.transparent,
                                            //     width: 1,
                                            //   ),
                                            //   borderRadius: 8,
                                            // ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 20, 0, 0),
                                          child: RaisedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          ForgotPasswordWidget())));
                                              print(
                                                  'Button-ForgotPassword pressed ...');
                                            },
                                            child:
                                                const Text('Forgot Password'),
                                            //   text: 'Forgot Password?',
                                            //   options: FFButtonOptions(
                                            // width: 170,
                                            // height: 40,
                                            color: const Color(0x0039D2C0),
                                            //     textStyle:
                                            //         FlutterFlowTheme.of(context)
                                            //             .subtitle1
                                            //             .override(
                                            //               fontFamily: 'Outfit',
                                            //               color: Colors.black,
                                            //               fontSize: 18,
                                            //               fontWeight:
                                            //                   FontWeight.w500,
                                            //             ),
                                            elevation: 0,
                                            //     borderSide: BorderSide(
                                            //       color: Colors.transparent,
                                            //       width: 1,
                                            //     ),
                                            //     borderRadius: 8,
                                            //   ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(10, 0, 10, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 0),
                                                child: Text(
                                                  'Or use a social account to login',
                                                  style: TextStyle(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xC8000000),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 16, 0, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color(0xFF0F1113),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 5,
                                                          color:
                                                              Color(0x3314181B),
                                                          offset: Offset(0, 2),
                                                        )
                                                      ],
                                                      shape: BoxShape.circle,
                                                    ),
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0, 0),
                                                    child: Column(
                                                      children: <Widget>[
                                                        IconButton(
                                                            onPressed:
                                                                () async {
                                                               bool isLoading =
                                                                false;
                                                            setState(() {
                                                              isLoading = true;
                                                            });
                                                            FirebaseService
                                                                service =
                                                                FirebaseService();

                                                            await service
                                                                .signInwithGoogle();
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const HomePageWidget()));

                                                            final provider =
                                                                Provider.of<
                                                                        GoogleSignInProvider>(
                                                                    context,
                                                                    listen:
                                                                        false);
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        HomePageWidget());
                                                            },
                                                            icon: const FaIcon(
                                                                FontAwesomeIcons
                                                                    .google,
                                                                color: Colors
                                                                    .white,
                                                                size: 24))
                                                      ],
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      35, 0, 35, 0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 20, 0, 0),
                                          child: TextFormField(
                                            controller: emailAddressController,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              labelText: 'Email Address',
                                              labelStyle: const TextStyle(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF57636C),
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              hintStyle: const TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(20, 24, 20, 24),
                                            ),
                                            style: const TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF14181B),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            onSaved: (emailsignup) {
                                              emailAddressController.text =
                                                  emailsignup!;
                                            },
                                            textInputAction:
                                                TextInputAction.next,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 12, 0, 0),
                                          child: TextFormField(
                                            obscureText: !passwordVisibility,
                                            controller: passwordController,
                                            decoration: InputDecoration(
                                              labelText: 'Password',
                                              labelStyle: const TextStyle(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF57636C),
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              hintStyle: const TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(20, 24, 20, 24),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                  () => passwordVisibility =
                                                      !passwordVisibility,
                                                ),
                                                child: Icon(
                                                  // Icons.visibility_outlined,
                                                  passwordVisibility
                                                      ? Icons
                                                          .visibility_outlined
                                                      : Icons
                                                          .visibility_off_outlined,
                                                  color:
                                                      const Color(0xFF95A1AC),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            style: const TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF14181B),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            onSaved: (pass) {
                                              passwordController.text = pass!;
                                            },
                                            textInputAction:
                                                TextInputAction.next,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 12, 0, 0),
                                          child: TextFormField(
                                            controller:
                                                passwordConfirmController,
                                            obscureText:
                                                !passwordConfirmVisibility,
                                            decoration: InputDecoration(
                                              labelText: 'Confirm Password',
                                              labelStyle: const TextStyle(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF57636C),
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              hintStyle: const TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(20, 24, 20, 24),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                  () => passwordConfirmVisibility =
                                                      !passwordConfirmVisibility,
                                                ),
                                                child: Icon(
                                                  // Icons.visibility_outlined,
                                                  passwordConfirmVisibility
                                                      ? Icons
                                                          .visibility_outlined
                                                      : Icons
                                                          .visibility_off_outlined,
                                                  color:
                                                      const Color(0xFF95A1AC),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            style: const TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF14181B),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            onSaved: (passcon) {
                                              passwordConfirmController.text =
                                                  passcon!;
                                            },
                                            textInputAction:
                                                TextInputAction.done,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 24, 0, 0),
                                          child: RaisedButton(
                                            onPressed: () {
                                              final String email =
                                                  emailAddressController.text
                                                      .trim();
                                              final String passwords =
                                                  passwordController.text
                                                      .trim();
                                              final String paswordConfirm =
                                                  passwordConfirmController.text
                                                      .trim();
                                              if (email.isEmpty) {
                                                Fluttertoast.showToast(
                                                    msg: "Email Kosong",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Colors.brown[200],
                                                    textColor: Colors.black,
                                                    fontSize: 16.0);
                                                print("email kosong!");
                                              } else {
                                                if (passwords.isEmpty) {
                                                  Fluttertoast.showToast(
                                                      msg: "Password kosong",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Colors.brown[200],
                                                      textColor: Colors.black,
                                                      fontSize: 16.0);
                                                } else {
                                                  if (paswordConfirm.isEmpty) {
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            "konfirmasi Password kosong",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor:
                                                            Colors.brown[200],
                                                        textColor: Colors.black,
                                                        fontSize: 16.0);
                                                  } else {
                                                    signUp(email, passwords);
                                                  }
                                                }
                                              }
                                            },
                                            child: const Text('Create Account'),
                                            color: const Color(0xFFEEC286),
                                            // text: 'Create Account',
                                            // options: FFButtonOptions(
                                            //   width: 230,
                                            //   height: 50,
                                            //   color: Color(0xFFEEC286),
                                            //   textStyle:
                                            //       FlutterFlowTheme.of(context)
                                            //           .subtitle2
                                            //           .override(
                                            //             fontFamily:
                                            //                 'Lexend Deca',
                                            //             color: Colors.white,
                                            //             fontSize: 16,
                                            //             fontWeight:
                                            //                 FontWeight.normal,
                                            //           ),
                                            //   elevation: 3,
                                            //   borderSide: BorderSide(
                                            //     color: Colors.transparent,
                                            //     width: 1,
                                            //   ),
                                            //   borderRadius: 8,
                                            // ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(15, 15, 15, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 12, 0, 0),
                                                  child: Text(
                                                    'Or use a social account to create account',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 10, 0, 4),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color(0xFF0F1113),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 5,
                                                        color:
                                                            Color(0x3314181B),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0, 0),
                                                  child: Column(
                                                    children: <Widget>[
                                                      IconButton(
                                                          onPressed: () async {
                                                            bool isLoading =
                                                                false;
                                                            setState(() {
                                                              isLoading = true;
                                                            });
                                                            FirebaseService
                                                                service =
                                                                FirebaseService();

                                                            await service
                                                                .signInwithGoogle();
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const HomePageWidget()));

                                                            final provider =
                                                                Provider.of<
                                                                        GoogleSignInProvider>(
                                                                    context,
                                                                    listen:
                                                                        false);
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        HomePageWidget());
                                                          },
                                                          icon: const FaIcon(
                                                              FontAwesomeIcons
                                                                  .google,
                                                              color:
                                                                  Colors.white,
                                                              size: 24))
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
          (uid) => {
            Fluttertoast.showToast(msg: "Login Successfully"),
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HomePageWidget();
            })),
          },
        );
  }

  void signUp(String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
          (uid) => {
            Fluttertoast.showToast(msg: "Register Successfully"),
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HomePageWidget();
            })),
          },
        );
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }


}

class Authentication {
  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content:
                  'The account already exists with a different credential.',
            ),
          );
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content: 'Error occurred while accessing credentials. Try again.',
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
            content: 'Error occurred using Google Sign-In. Try again.',
          ),
        );
      }
    }
    return null;
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

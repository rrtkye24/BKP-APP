// import 'package:flutter/material.dart';
// import '../ui/home.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
// class _LoginScreenState extends State<LoginScreen> {
//   @override
//    void initState() {
//     var d = Duration(seconds: 3);
//     //delay 3 second
//     Future.delayed(d, () {
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(
//           builder: (context) {
//             return Home();
//           },
//         ),
//         (route) => false,
//       );
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(image: AssetImage('icons/logilek.png')),
//         ),
//         child: Center(
//           child: Image.asset('logo.png'),
//         ),
//       ),
//     );
//   }

import 'package:bkp/contansts.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children:<Widget>[
          Container( 
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "icons/logo.png"),
                fit: BoxFit.cover,
        ),  
        )
        ),
          Container( 
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                width: 6,
                height: 6,
                decoration: BoxDecoration(color: kBackgroudColor,
                borderRadius: BorderRadius.circular(50)),

        ),
          Container( 
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                width: 6,
                height: 6,
                decoration: BoxDecoration(color: kBackgroudColor,
                borderRadius: BorderRadius.circular(50)),
              ),
            ]
          ),
        ),
        ]
      )
      )
      ]
      )
      );
  }
}

import 'package:bkp/contansts.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack( 
        children: <Widget>[
          Container(
            height: size.height * .25,
            decoration: const BoxDecoration(
              color: kBackgroudColor5,
              image: DecorationImage(
                image: AssetImage('icons/ilus.png'), 
                ), 
             ),
            ),
            SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topRight ,
                    height: 52,
                    width: 52,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.menu_rounded,
                    color: Colors.black,
                    size: 24.0,),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

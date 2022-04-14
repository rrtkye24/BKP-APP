import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Color(0xFFDCC5B2),
          automaticallyImplyLeading: false,
          leading: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              // FlutterFlowIconButton(
              //   borderColor: Colors.transparent,
              //   borderRadius: 30,
              //   borderWidth: 1,
              //   buttonSize: 60,
              //   icon: Icon(
              //     Icons.menu_sharp,
              //     color: Colors.white,
              //     size: 30,
              //   ),
              //   onPressed: () {
              //     print('IconButton pressed ...');
              //   },
              // ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                child: Image.asset(
                  'assets/images/Frame_4LOGO.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    width: 150,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 6, 0, 0),
                      child: Text(
                        'Search',
                        textAlign: TextAlign.start,
                        // style: FlutterFlowTheme.of(context).bodyText1.override(
                        //       fontFamily: 'Poppins',
                        //       color: Color(0x31101213),
                        //     ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 3, 5, 0),
              child: Icon(
                Icons.account_circle,
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
          elevation: 3,
        ),
      ),
      backgroundColor: Color(0xFFEFE4D2),
    );
  }
}

import 'dart:ui';
import 'package:bkp/auth/login.dart';
import 'package:bkp/home/laporan_harian.dart';
import 'package:bkp/home/read_user.dart';
import 'package:bkp/home/tambah_barang.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './laporan_barang.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './read_user.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final FirebaseAuth auth = FirebaseAuth.instance;

    // Future<User> inputData() async {
    //   final user = auth.currentUser;
    //   if (user != null) {
    //     await user;
    //   }
    // }

//     final user = auth.currentUser;
// final uid = user.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        elevation: 16,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xFFDCC5B2),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              StreamBuilder(
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
              Row(
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        if (scaffoldKey.currentState!.isDrawerOpen ||
                            scaffoldKey.currentState!.isEndDrawerOpen) {
                          Navigator.pop(context);
                        }
                      },
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 100,
                height: 100,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://picsum.photos/seed/902/600',
                  width: 20,
                  height: 25,
                ),
              ),
              InkWell(
                child: Text(
                  'Hy8fsbZ2IlRFPJxmrSE2uR8ppuA3',
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                onTap: () {
                  var currentUser = FirebaseAuth.instance.currentUser;

                  if (currentUser != null) {
                    print(currentUser.uid);
                  }
                },
              ),
              Text(
                'bkpadmin@bkp.bn',
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => TambahBarangWidget())));
                },
                title: Text(
                  'Tambah Barang',
                  style: TextStyle(),
                ),
                subtitle: Text(
                  'Tambah data barang',
                  style: TextStyle(),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => TambahBarangWidget())));
                },
                title: Text(
                  'Tambah Laporan',
                  style: TextStyle(),
                ),
                subtitle: Text(
                  'Tambah laporan harian',
                  style: TextStyle(),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
              ListTile(
                title: Text(
                  'Setting',
                  style: TextStyle(),
                ),
                subtitle: Text(
                  'User Data',
                  style: TextStyle(),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
              Container(
                width: 100,
                height: 200,
                decoration: BoxDecoration(),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(200, 0, 0, 0),
                child: RaisedButton(
                  // borderColor: Colors.transparent,
                  // borderRadius: 30,
                  // borderWidth: 1,
                  // buttonSize: 60,

                  child: Icon(
                    Icons.login,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    signOut();
                    print('Sign out');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginWidget()));
                    Fluttertoast.showToast(
                        msg: "Anda Telah Keluar",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.brown[200],
                        textColor: Colors.black,
                        fontSize: 16.0);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: const Color(0xFFDCC5B2),
          automaticallyImplyLeading: false,
          leading: Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              // Padding(padding: EdgeInsets.al(25.0),),
              IconButton(
                  // borderColor: Colors.transparent,
                  // borderRadius: 30,
                  // borderWidth: 1,
                  // buttonSize: 60,
                  icon: const Icon(
                    Icons.menu_sharp,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () => scaffoldKey.currentState!.openDrawer()),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                child: Image.network(
                  'https://i.pinimg.com/564x/fb/4f/7b/fb4f7ba59f54096994efa3aa7504b535.jpg',
                  width: 80,
                  height: 40,
                  // fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // child: Container(
                  //   width: 150,
                  //   height: 35,
                  //   decoration: BoxDecoration(
                  //     color: const Color(0xFFEEEEEE),
                  //     borderRadius: BorderRadius.circular(15),
                  //   ),
                  //   child: const Padding(
                  //     padding: EdgeInsetsDirectional.fromSTEB(10, 6, 0, 0),
                  //     child: Text(
                  //       'Search',
                  //       textAlign: TextAlign.start,
                  //       style: TextStyle(
                  //         fontFamily: 'Poppins',
                  //         color: Color(0x31101213),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ),
              ),
            ],
          ),
          actions: [
            // Container(
            //   child: Padding(
            //     padding: EdgeInsetsDirectional.fromSTEB(0, 3, 5, 0),
            //     child: InkWell(
            //       child: Icon(
            //         Icons.account_circle,
            //         color: Colors.black,
            //         size: 30,
            //       ),
            //       onTap: ,
            //     ),
            //   ),
            // ),
            IconButton(
              icon: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => UserDataWidget())));
              },
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFEFE4D2),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFF8EADA),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 20, 16, 30),
                              child: Container(
                                height: 70,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFE4D2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFB2B1AF),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Icon(
                                          Icons.lightbulb,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          'Info !',
                                          style: TextStyle(),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          'Semen telah ditambahkan !',
                                          style: TextStyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 0, 16, 20),
                              child: Container(
                                width: double.infinity,
                                height: 184,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: Image.network(
                                      'https://picsum.photos/seed/902/600',
                                    ).image,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 3,
                                      color: Color(0x33000000),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: const Color(0x65090F13),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 2),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(16, 16, 16, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: const [
                                              Expanded(
                                                child: Text(
                                                  'Laporan Barang',
                                                  style: TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.chevron_right_rounded,
                                                color: Colors.white,
                                                size: 24,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(16, 4, 16, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: const [
                                              Expanded(
                                                child: Text(
                                                  'detail, stok barang',
                                                  style: TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF39D2C0),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(16, 4, 16, 16),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                ElevatedButton.icon(
                                                  onPressed: () {
                                                    // signOut();
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const LaporanBarangWidget()),
                                                    );
                                                  },
                                                  icon: const Icon(
                                                    // <-- Icon
                                                    Icons.show_chart_outlined,
                                                    size: 24.0,
                                                  ),
                                                  label: const Text('Lihat'),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: const [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 4),
                                                        child: Text(
                                                          'updated',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Thursday June 22 , 10 AM',
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xB4FFFFFF),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 12, 16, 0),
                              child: Container(
                                width: double.infinity,
                                height: 184,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: Image.network(
                                      'https://picsum.photos/seed/902/600',
                                    ).image,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 3,
                                      color: Color(0x33000000),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: const Color(0x65090F13),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 16, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: const [
                                            Expanded(
                                              child: Text(
                                                'Laporan Harian',
                                                style: TextStyle(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.chevron_right_rounded,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 4, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: const [
                                            Expanded(
                                              child: Text(
                                                '30m | High Intensity | Indoor/Outdoor',
                                                style: TextStyle(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF39D2C0),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(16, 4, 16, 16),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              ElevatedButton.icon(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              LaporanHarianWidget()));
                                                  print("button");
                                                },
                                                icon: const Icon(
                                                  // <-- Icon
                                                  Icons.show_chart_outlined,
                                                  size: 24.0,
                                                ),
                                                label: const Text(
                                                    'Lihat'), // <-- Text
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: const [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 4),
                                                      child: Text(
                                                        'updated',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'Thursday June 22',
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xB4FFFFFF),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
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
                            ), // ),
                          ]),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

import 'package:bkp/home/kurang_barang.dart';
import 'package:flutter/material.dart';
import './detail_laporan_barang.dart';
import './tambah_barang.dart';
import './kurang_barang.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LaporanBarangWidget extends StatefulWidget {
  const LaporanBarangWidget({Key? key}) : super(key: key);

  @override
  _LaporanBarangWidgetState createState() => _LaporanBarangWidgetState();
}

class _LaporanBarangWidgetState extends State<LaporanBarangWidget>
    with TickerProviderStateMixin {
  TextEditingController textController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // final animationsMap = {
  //   'containerOnPageLoadAnimation1': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     duration: 600,
  //     fadeIn: true,
  //     initialState: AnimationState(
  //       offset: Offset(30, 0),
  //       scale: 1,
  //       opacity: 0,
  //     ),
  //     finalState: AnimationState(
  //       offset: Offset(0, 0),
  //       scale: 1,
  //       opacity: 1,
  //     ),
  //   ),
  //   'containerOnPageLoadAnimation2': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     duration: 600,
  //     fadeIn: true,
  //     initialState: AnimationState(
  //       offset: Offset(50, 0),
  //       scale: 1,
  //       opacity: 0,
  //     ),
  //     finalState: AnimationState(
  //       offset: Offset(0, 0),
  //       scale: 1,
  //       opacity: 1,
  //     ),
  //   ),
  //   'containerOnPageLoadAnimation3': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     duration: 600,
  //     fadeIn: true,
  //     initialState: AnimationState(
  //       offset: Offset(0, 30),
  //       scale: 1,
  //       opacity: 0,
  //     ),
  //     finalState: AnimationState(
  //       offset: Offset(0, 0),
  //       scale: 1,
  //       opacity: 1,
  //     ),
  //   ),
  //   'containerOnPageLoadAnimation4': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     duration: 600,
  //     fadeIn: true,
  //     initialState: AnimationState(
  //       offset: Offset(0, 40),
  //       scale: 1,
  //       opacity: 0,
  //     ),
  //     finalState: AnimationState(
  //       offset: Offset(0, 0),
  //       scale: 1,
  //       opacity: 1,
  //     ),
  //   ),
  // };

  @override
  void initState() {
    super.initState();
    // startPageLoadAnimations(
    //   animationsMap.values
    //       .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
    //   this,
    // );

    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF1F4F8),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 44, 16, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: const Color(0xFFEEC286),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          // Container(
                          // child: Padding(
                          //   padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          InkWell(
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 24,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          // ),
                          // ),
                          Container(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                              child: Icon(
                                Icons.account_circle_rounded,
                                color: Colors.black,
                                size: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Laporan Barang',
                            // style: FlutterFlowTheme.of(context).title3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 10),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x34090F13),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 1),
                    child: TextFormField(
                        controller: textController,
                        obscureText: false,
                        decoration: const InputDecoration(
                          labelText: 'Find your task...',
                          labelStyle: TextStyle(
                            fontFamily: 'Outfit',
                            color: Color(0xFF57636C),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(24, 12, 12, 12),
                          prefixIcon: Icon(
                            Icons.search_sharp,
                            color: Color(0xFF57636C),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Outfit',
                          color: Color(0xFF0F1113),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        onChanged: (value) {
                          setState(() {
                            String searchKey;
                            Stream streamQuery;
                            FirebaseFirestore _firestore =
                                FirebaseFirestore.instance;

                            searchKey = value;
                            streamQuery = _firestore
                                .collection('Barang')
                                .where('nama_barang',
                                    isGreaterThanOrEqualTo: searchKey)
                                .snapshots();
                          });
                        }),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                    child: Icon(
                      Icons.add_circle,
                      color: Color(0xFFFF9610),
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      'Tambah Barang',
                      // style: FlutterFlowTheme.of(context).subtitle1,
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  color: Color(0xFFF1F4F8),
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 12, 12, 12),
                      child: Container(
                        width: 230,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x34090F13),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 140,
                              decoration: const BoxDecoration(
                                color: Color(0xC8000000),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            width: 36,
                                            height: 36,
                                            decoration: BoxDecoration(
                                              color: const Color(0x22FFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            alignment:
                                                const AlignmentDirectional(
                                                    0, 0),
                                            child: IconButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const TambahBarangWidget()));
                                              },
                                              icon: const Icon(
                                                Icons.add_box,
                                                color: Colors.white,
                                                size: 24,
                                              ),
                                            )),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(135, 0, 0, 0),
                                          child: Container(
                                              width: 36,
                                              height: 36,
                                              decoration: BoxDecoration(
                                                color: const Color(0x22FFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0, 0),
                                              child: IconButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const PenguranganBarangWidget()));
                                                },
                                                icon: const Icon(
                                                  Icons.horizontal_rule,
                                                  color: Colors.white,
                                                  size: 24,
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      'Semen',
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Text(
                                      '17 April 2022',
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 12, 12, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: Stack(
                                      alignment:
                                          const AlignmentDirectional(-1, 0),
                                      children: const [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-0.97, 0),
                                          child: Text(
                                            'Stok :',
                                            textAlign: TextAlign.start,
                                            // style: FlutterFlowTheme.of(context)
                                            //     .subtitle1,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.17, 0),
                                          child: Text(
                                            '300',
                                            textAlign: TextAlign.center,
                                            // style: FlutterFlowTheme.of(context)
                                            //     .subtitle1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 8, 0),
                                    child: Text(
                                      'sak',
                                      // style: FlutterFlowTheme.of(context)
                                      //     .subtitle2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DetailLaporanBarangWidget()),
                                );
                              },
                              child: const Text('Lihat'),
                              // options: FFButtonOptions(
                              //   width: 125,
                              //   height: 40,
                              //   color: Color(0xFF392409),
                              //   textStyle: FlutterFlowTheme.of(context)
                              //       .subtitle2
                              //       .override(
                              //         fontFamily: 'Poppins',
                              //         color: Colors.white,
                              //       ),
                              //   elevation: 3,
                              //   borderSide: BorderSide(
                              //     color: Colors.transparent,
                              //     width: 1,
                              //   ),
                              //   borderRadius: 12,
                              // ),
                            ),
                          ],
                        ),
                      ),
                      // animated(
                      //     [animationsMap['containerOnPageLoadAnimation1']]),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 12, 16, 12),
                      child: Container(
                        width: 230,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x34090F13),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 140,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: const Color(0x2CFFFFFF),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      alignment:
                                          const AlignmentDirectional(0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 36,
                                                height: 36,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0x22FFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                alignment:
                                                    const AlignmentDirectional(
                                                        0, 0),
                                                child: const Icon(
                                                  Icons.add_box,
                                                  color: Colors.white,
                                                  size: 24,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(135, 0, 0, 0),
                                                child: Container(
                                                  width: 36,
                                                  height: 36,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0x22FFFFFF),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0, 0),
                                                  child: const Icon(
                                                    Icons.horizontal_rule,
                                                    color: Colors.white,
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      'Pasir',
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Text(
                                      '30 April 2022',
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 12, 12, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: Stack(
                                      alignment:
                                          const AlignmentDirectional(-1, 0),
                                      children: const [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.04, 0),
                                          child: Text(
                                            'Stok :',
                                            // style: FlutterFlowTheme.of(context)
                                            //     .subtitle1,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.17, 0),
                                          child: Text(
                                            '300',
                                            textAlign: TextAlign.center,
                                            // style: FlutterFlowTheme.of(context)
                                            //     .subtitle1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 8, 0),
                                    child: Text(
                                      'sak',
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF0F1113),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DetailLaporanBarangWidget()),
                                );
                              },
                              child: const Text('Lihat'),
                              // options: FFButtonOptions(
                              //   width: 125,
                              //   height: 40,
                              //   color: Color(0xFF392409),
                              //   textStyle: FlutterFlowTheme.of(context)
                              //       .subtitle2
                              //       .override(
                              //         fontFamily: 'Poppins',
                              //         color: Colors.white,
                              //       ),
                              //   elevation: 3,
                              //   borderSide: BorderSide(
                              //     color: Colors.transparent,
                              //     width: 1,
                              //   ),
                              //   borderRadius: 12,
                              // ),
                            ),
                          ],
                        ),
                      ),
                      // ).animated(
                      //     [animationsMap['containerOnPageLoadAnimation2']]),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                child: Text(
                  'Jenis Barang',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Color(0xFF0F1113),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        color: Color(0x1B090F13),
                        offset: Offset(0, -2),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: DefaultTabController(
                      length: 3,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          const TabBar(
                            isScrollable: true,
                            labelColor: Color(0xFFEEC286),
                            unselectedLabelColor: Color(0xFF57636C),
                            labelStyle: TextStyle(
                              fontFamily: 'Outfit',
                              color: Color(0xFF0F1113),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            indicatorColor: Color(0xFF392409),
                            indicatorWeight: 2,
                            tabs: [
                              Tab(
                                text: 'Baru',
                              ),
                              Tab(
                                text: 'Barang',
                              ),
                              Tab(
                                text: 'Dihapus',
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 12),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 12),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color: const Color(0xFFE0E3E7),
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(12, 12, 12, 12),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Semen',
                                                  // style: FlutterFlowTheme.of(
                                                  //         context)
                                                  //     .subtitle1,
                                                ),
                                                const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 0),
                                                  child: Text(
                                                    'semen telah ditambah',
                                                    style: TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Color(0xFF57636C),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 24,
                                                  thickness: 1,
                                                  color: Color(0xFFE0E3E7),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Date',
                                                      style: TextStyle(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF0F1113),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                    const Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 0, 0, 0),
                                                        child: Text(
                                                          'Tuesday, 10:00am',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF4B39EF),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 100,
                                                      height: 32,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xFF39D2C0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(32),
                                                      ),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0, 0),
                                                      child: const Text(
                                                        'Lihat',
                                                        style: TextStyle(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          // ).animated([
                                          //   animationsMap[
                                          //       'containerOnPageLoadAnimation3']
                                          // ]
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: const Color(0xFFE0E3E7),
                                            width: 2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(12, 12, 12, 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Theme Collection',
                                                style: TextStyle(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF0F1113),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: Text(
                                                  'pasir telah berkurang',
                                                  style: TextStyle(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              const Divider(
                                                height: 24,
                                                thickness: 1,
                                                color: Color(0xFFE0E3E7),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Date',
                                                    style: TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Color(0xFF0F1113),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  const Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 0, 0, 0),
                                                      child: Text(
                                                        'Tuesday, 10:00am',
                                                        style: TextStyle(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF4B39EF),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    height: 32,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF39D2C0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32),
                                                    ),
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0, 0),
                                                    child: const Text(
                                                      'In Progress',
                                                      style: TextStyle(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        // ).animated([
                                        //   animationsMap[
                                        //       'containerOnPageLoadAnimation4']
                                        // ]),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 12),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 12),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color: const Color(0xFFE0E3E7),
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(12, 12, 12, 12),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Semen',
                                                  style: TextStyle(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF0F1113),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 24,
                                                  thickness: 1,
                                                  color: Color(0xFFE0E3E7),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Stok',
                                                      style: TextStyle(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF0F1113),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                    const Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 0, 0, 0),
                                                        child: Text(
                                                          '300',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF4B39EF),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      child: Container(
                                                        width: 100,
                                                        height: 32,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xFF39D2C0),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(32),
                                                        ),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0, 0),
                                                        child: const Text(
                                                          'Lihat',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const DetailLaporanBarangWidget()),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: const Color(0xFFE0E3E7),
                                            width: 2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(12, 12, 12, 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Semen',
                                                style: TextStyle(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF0F1113),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const Divider(
                                                height: 24,
                                                thickness: 1,
                                                color: Color(0xFFE0E3E7),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Stok',
                                                    style: TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Color(0xFF0F1113),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  const Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 0, 0, 0),
                                                      child: Text(
                                                        '300',
                                                        style: TextStyle(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF4B39EF),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    child: Container(
                                                      width: 100,
                                                      height: 32,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xFF39D2C0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(32),
                                                      ),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0, 0),
                                                      child: const Text(
                                                        'Lihat',
                                                        style: TextStyle(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const DetailLaporanBarangWidget()),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 12),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 12),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF1F4F8),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color: const Color(0xFFE0E3E7),
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(12, 12, 12, 12),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Design Template Screens',
                                                  style: TextStyle(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF0F1113),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 0),
                                                  child: Text(
                                                    'Create template screen for task todo app.',
                                                    style: TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Color(0xFF57636C),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 24,
                                                  thickness: 1,
                                                  color: Color(0xFFE0E3E7),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Dihapus',
                                                      style: TextStyle(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF0F1113),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                    const Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 0, 0, 0),
                                                        child: Text(
                                                          '27 april 2022',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF4B39EF),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 100,
                                                      height: 32,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(32),
                                                      ),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0, 0),
                                                      child: const Text(
                                                        'Kembali',
                                                        style: TextStyle(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF0F1113),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF1F4F8),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: const Color(0xFFE0E3E7),
                                            width: 2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(12, 12, 12, 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Design Template Screens',
                                                style: TextStyle(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF0F1113),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: Text(
                                                  'Create template screen for task todo app.',
                                                  style: TextStyle(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                              ),
                                              const Divider(
                                                height: 24,
                                                thickness: 1,
                                                color: Color(0xFFE0E3E7),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'dihapus',
                                                    style: TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Color(0xFF0F1113),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  const Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 0, 0, 0),
                                                      child: Text(
                                                        'Tuesday, 10:00am',
                                                        style: TextStyle(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF4B39EF),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    height: 32,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32),
                                                    ),
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0, 0),
                                                    child: const Text(
                                                      'Kembaii',
                                                      style: TextStyle(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF0F1113),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Barang {
  final String? id;
  final String nama_barang;
  final int jumlah;
  final DateTime tanggal;

  Barang({
    this.id,
    required this.nama_barang,
    required this.jumlah,
    required this.tanggal,
  });

  Map<String, dynamic> toMap() {
    return {
      'nama_barang': nama_barang,
      'jumlah': jumlah,
      'tanggal': tanggal,
    };
  }

  Barang.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        nama_barang = doc.data()!["nama_barang"],
        jumlah = doc.data()!["jumlah"],
        tanggal = doc.data()!["tanggal"]
            ? null
            : doc.data()?["employeeTraits"].cast<String>();
}

class Retreive {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  addEmployee(Barang employeeData) async {
    await _db.collection("Barang").add(employeeData.toMap());
  }

  updateEmployee(Barang employeeData) async {
    await _db
        .collection("Employees")
        .doc(employeeData.id)
        .update(employeeData.toMap());
  }

  Future<void> deleteEmployee(String documentId) async {
    await _db.collection("Employees").doc(documentId).delete();
  }

  Future<List<Barang>> retrieveEmployees() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Employees").get();
    return snapshot.docs
        .map((docSnapshot) => Barang.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
// class GetData extends StatefulWidget {
//   const GetData({Key? key}) : super(key: key);

//   @override
//   State<GetData> createState() => _GetDataState();
// }

// class _GetDataState extends State<GetData> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       child: StreamBuilder(
//       stream: FirebaseFirestore.instance.collection("Barang").snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData)
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         return ItemBarang(listBarang: snapshot.data.document);
//       },
//     ),
//     );
// }
// class ItemBarang extends StatelessWidget {
//   final List<DocumentSnapshot> listBarang;
//   const ItemBarang({ Key? key, this.listBarang }) : super(key: key, );
  
  
//   @override
//   Widget build(BuildContext context) {
    
//   }
// }

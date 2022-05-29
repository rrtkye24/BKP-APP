import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaporanHarianWidget extends StatefulWidget {
  const LaporanHarianWidget({Key? key}) : super(key: key);

  @override
  _LaporanHarianWidgetState createState() => _LaporanHarianWidgetState();
}

class _LaporanHarianWidgetState extends State<LaporanHarianWidget> {
  String? materialValue1;
  TextEditingController nomorController = TextEditingController();
  String? materialValue2;
  TextEditingController jumlahController = TextEditingController();
  String? satuanValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List material = ['Material Masuk', 'Material Keluar'];
  List namaMaterial = [
    'Semen',
    'Pasir Beton',
    'Besi ⌀ 7 mm',
    'Besi ⌀ 8 mm',
    'Wiremesh ⌀ 5 mm',
    'Beton Panel',
    'Kolom Tembok Panel',
    'Kawat Bendrat',
    'Batu Belah',
    'Split'
  ];
  List satuan = ['zak', 'm3', 'batang', 'm', 'pcs', 'ml', 'ember'];
  @override
  void initState() {
    super.initState();
    jumlahController = TextEditingController();
    nomorController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
            child: Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: IconButton(
                            // borderColor: Colors.transparent,
                            // borderRadius: 30,
                            // borderWidth: 1,
                            // buttonSize: 50,
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: Color(0xFF090F13),
                              size: 30,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                    child: Text(
                      'Tambah Laporan Harian',
                      style: TextStyle(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF090F13),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              DropdownButton(
                // initialOption: materialValue1 ??= 'Material',
                items: material.map((value) {
                  return DropdownMenuItem(child: Text(value), value: value);
                }).toList(),
                onChanged: (val) => setState(() => materialValue1),
                // width: 180,
                // height: 50,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                ),
                hint: Text('Material'),
                // color: Colors.white,
                // elevation: 2,
                // borderColor: Colors.transparent,
                // borderWidth: 0,
                // borderRadius: 0,
                // margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                // hidesUnderline: true,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                child: TextFormField(
                  controller: nomorController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Nomor',
                    labelStyle: TextStyle(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF95A1AC),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    hintStyle: TextStyle(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF95A1AC),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF1F4F8),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF1F4F8),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                  ),
                  style: TextStyle(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF090F13),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              DropdownButton(
                // initialOption: materialValue1 ??= 'Material',
                items: namaMaterial.map((value) {
                  return DropdownMenuItem(child: Text(value), value: value);
                }).toList(),
                onChanged: (item) => setState(() {
                  materialValue2 = item.toString();
                }),
                // width: 180,
                // height: 50,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                ),
                hint: Text('Nama Material'),
                // color: Colors.white,
                // elevation: 2,
                // borderColor: Colors.transparent,
                // borderWidth: 0,
                // borderRadius: 0,
                // margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                // hidesUnderline: true,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                child: TextFormField(
                  controller: jumlahController,
                  readOnly: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Jumlah',
                    labelStyle: TextStyle(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF95A1AC),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    hintText: 'Jumlah',
                    hintStyle: TextStyle(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF95A1AC),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF1F4F8),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF1F4F8),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                  ),
                  style: TextStyle(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF090F13),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              DropdownButton(
                // initialOption: materialValue1 ??= 'Material',
                items: satuan.map((value) {
                  return DropdownMenuItem(child: Text(value), value: value);
                }).toList(),
                onChanged: (val) => setState(() => materialValue2),
                // width: 180,
                // height: 50,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                ),
                hint: Text('Satuan'),
                // color: Colors.white,
                // elevation: 2,
                // borderColor: Colors.transparent,
                // borderWidth: 0,
                // borderRadius: 0,
                // margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                // hidesUnderline: true,
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.05),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: RaisedButton(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    child: Text('Save Changes'),
                    // options: FFButtonOptions(
                    // width: 340,
                    // height: 60,
                    color: Color(0xFFDCC5B2),
                    // textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                    //       fontFamily: 'Lexend Deca',
                    //       color: Colors.white,
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.normal,
                    //     ),
                    elevation: 2,
                    // borderSide: BorderSide(
                    //   color: Colors.transparent,
                    //   width: 1,
                    // ),
                    // borderRadius: 8,
                  ),
                ),
              ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bkp/home/laporan_barang.dart';
import 'package:flutter/material.dart';

class DetailLaporanBarangWidget extends StatefulWidget {
  const DetailLaporanBarangWidget({Key? key}) : super(key: key);

  @override
  _DetailLaporanBarangWidgetState createState() =>
      _DetailLaporanBarangWidgetState();
}

class _DetailLaporanBarangWidgetState extends State<DetailLaporanBarangWidget> {
  String? dropDownValue1;
  String? dropDownValue2;
  final List _detailbarang = [
    'Nama Barang :  Semen',
    'Status : Bertambah satu',
    'Sisa : 100 Kg'
  ];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF1F4F8),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1, -0.97),
                                      child: Image.network(
                                        'https://i.pinimg.com/564x/20/f2/33/20f2332f6aca65fc0994161686d6c9e1.jpg',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        height: 160,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: const [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.24, -0.73),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: Text(
                                              'Semen',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF090F13),
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Text(
                                            'Stok :   ',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0, 100, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    40, 0, 0, 0),
                                            child: IconButton(
                                              // borderColor: Colors.transparent,
                                              // borderRadius: 30,
                                              // borderWidth: 1,
                                              // buttonSize: 60,
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.black,
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
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: const [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 12, 0, 12),
                child: Text(
                  'Detail Laporan',
                  style: TextStyle(),
                ),
              ),
            ],
          ),
          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        DropdownButton(
                          value: dropDownValue1,
                          items: _detailbarang.map((value) {
                            return DropdownMenuItem(
                                child: Text(value), value: value);
                          }).toList(),
                          onChanged: (val) => setState(() => dropDownValue1),

                          // width: 380,
                          // height: double.infinity,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                          hint: const Text("1 May 2022"),
                          // color: Colors.white,
                          // elevation: 2,
                          // borderColor: Colors.transparent,
                          // borderWidth: 0,
                          // borderRadius: 1,
                          // margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          // hidesUnderline: true,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        DropdownButton(
                          value: dropDownValue1,
                          items: _detailbarang.map((value) {
                            return DropdownMenuItem(
                                child: Text(value), value: value);
                          }).toList(),
                          onChanged: (val) => setState(() => dropDownValue2),
                          // width: 380,
                          // height: double.infinity,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                          // hintText: '1 May 2022',
                          // fillColor: Colors.white,
                          elevation: 2,
                          // borderColor: Colors.transparent,
                          // borderWidth: 0,
                          // borderRadius: 0,
                          // margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          // hidesUnderline: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LaporanBarangWidget()));
                  },
                  child: const Text('kembali'),
                  // options: FFButtonOptions(
                  // width: 90,
                  // height: 40,
                  color: Colors.white,
                  // : TextStyle(
                  //       fontFamily: 'Lexend Deca',
                  //       color: Color(0xFF4B39EF),
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.normal,
                  //     ),
                  elevation: 3,
                  // border: BorderSide(
                  //   color: Colors.transparent,
                  //   width: 1,
                  // ),
                  // borderRadius: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

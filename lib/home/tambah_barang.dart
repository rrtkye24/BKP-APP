import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:date_field/date_field.dart';

class TambahBarangWidget extends StatefulWidget {
  const TambahBarangWidget({Key? key}) : super(key: key);

  @override
  _TambahBarangWidgetState createState() => _TambahBarangWidgetState();
}

class _TambahBarangWidgetState extends State<TambahBarangWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController namaBarang = TextEditingController();
  TextEditingController jumlah = TextEditingController();
  DateTime tanggal = DateTime.now();
  String getDate() {
    if (tanggal == null) {
      return 'Pilih Tanggal';
    } else {
      return '${tanggal.month}/${tanggal.day}/${tanggal.year}';
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: tanggal,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != tanggal) {
      setState(() {
        tanggal = picked;
      });
    }
  }

  File? image;
  Future pickImage() async {
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image!.path);
    setState(() => this.image = imageTemporary);
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
  }

  @override
  void initState() {
    super.initState();
    namaBarang = TextEditingController();
    jumlah = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('Barang');

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8EADA),
        automaticallyImplyLeading: false,
        leading: IconButton(
          // borderColor: Colors.transparent,
          // borderRadius: 30,
          // borderWidth: 1,
          // buttonSize: 60,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF090F13),
            size: 30,
          ),
          onPressed: () {
            print('Back');
            Navigator.of(context).pop(true);
          },
        ),
        title: const Text(
          'Tambah Barang',
          style: TextStyle(
            fontFamily: 'Lexend Deca',
            color: Color(0xFF090F13),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF8EADA),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(0x430F1113),
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30, 0, 30, 0),
                              child: SizedBox(
                                width: 30,
                                height: 170,
                                child: Stack(
                                  children: [
                                    Spacer(),
                                    image != null
                                        ? Image.file(image!,
                                            width: 160,
                                            height: 160,
                                            fit: BoxFit.cover)
                                        : Image.network(
                                            'https://images.unsplash.com/photo-1626544827763-d516dce335e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTc1fHxwcm9kdWN0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                                          ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0, 0),
                                      // child: Image.network(
                                      //   'https://images.unsplash.com/photo-1626544827763-d516dce335e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTc1fHxwcm9kdWN0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                                      //   child: ,
                                      //   width:
                                      //       MediaQuery.of(context).size.width,
                                      //   height: 130,
                                      //   fit: BoxFit.cover,
                                      // ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 130,
                                        decoration: const BoxDecoration(
                                          color: Color(0x77090F13),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              // borderColor: Colors.transparent,
                                              // borderRadius: 30,
                                              // buttonSize: 48,
                                              icon: const Icon(
                                                Icons.photo_camera,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              onPressed: () {
                                                pickImage();
                                                print('Pilih Gambar');
                                              },
                                            ),
                                            Text(
                                              'Foto Barang',
                                              style: GoogleFonts.getFont(
                                                'DM Sans',
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10,
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
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                        child: ElevatedButton(
                          onPressed: () {
                            print('pilih gambar');
                            pickImage();
                          },

                          // text: 'Edit Photo',
                          // options: FFButtonOptions(
                          //   width: 130,
                          //   height: 40,
                          // color: Color(0xFFF1F4F8),
                          // child: Row(
                          //   children: <Widget>[
                          //     IconButton(
                          //         onPressed: () {
                          //           pickImage();
                          //         },
                          //         icon: Icon(Icons.edit))
                          //   ],
                          // )

                          //   TextStyle(
                          //           fontFamily: 'Lexend Deca',
                          //           color: Color(0xFF090F13),
                          //           fontSize: 14,
                          //           fontWeight: FontWeight.normal,
                          //         ),
                          // borderSide: BorderSide(
                          //   color: Colors.transparent,
                          //   width: 1,
                          // ),
                          // borderRadius: 8,
                          child: Text('edit'),
                        ),
                      ),
                      // ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: namaBarang,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Nama Barang',
                                  hintText: 'Nama Barang',
                                  hintStyle: const TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF95A1AC),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFDCC5B2),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFDCC5B2),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  suffixIcon: const Icon(
                                    Icons.eco,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: jumlah,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Jumlah',
                                  hintStyle: const TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF95A1AC),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFDCC5B2),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFDCC5B2),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  suffixIcon: const Icon(
                                    Icons.queue_play_next_sharp,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              // child: ,
                              child: DateTimeField(
                                decoration: const InputDecoration(
                                  
                                  hintStyle: TextStyle(color: Colors.black45),
                                  errorStyle:
                                      TextStyle(color: Colors.redAccent),
                                  border: OutlineInputBorder(),
                                  suffixIcon: Icon(Icons.event_note),
                                  labelText: 'Only time',
                                ),
                                onDateSelected: (DateTime value) {
                                  setState(() {
                                    tanggal = value;
                                  });
                                },
                                selectedDate: tanggal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                        child: ElevatedButton(
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            print('Tambah');
                            users.add({
                              'nama_barang': namaBarang.text,
                              'jumlah': int.tryParse(jumlah.text) ?? 0,
                              'tanggal': tanggal,
                            });
                            namaBarang.text = '';
                            jumlah.text = '';
                            // tanggal.text = '';
                          },
                          child: const Text('Tambah'),
                          // options: FFButtonOptions(
                          //   width: 230,
                          //   height: 50,
                          // color: Color(0xFFDCC5B2),
                          // textStyle:
                          //     FlutterFlowTheme.of(context).bodyText2.override(
                          //           fontFamily: 'Lexend Deca',
                          //           color: Colors.white,
                          //           fontSize: 14,
                          //           fontWeight: FontWeight.normal,
                          //         ),
                          // elevation: 3,
                          // borderSide: BorderSide(
                          //   color: Colors.transparent,
                          //   width: 1,
                          // ),
                          // borderRadius: 8,
                        ),
                      ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

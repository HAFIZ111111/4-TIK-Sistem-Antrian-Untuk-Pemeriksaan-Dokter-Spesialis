import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpl/layar/halaman_dua_ubah_pass.dart';
import 'package:rpl/layar/halaman_login.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'package:rpl/layar/pilih_rs.dart';
// import 'package:logintunisia/screens/signUpScreen.dart';
import '../widget/InputTextWidget.dart';

class Halaman_Notifikasi extends StatefulWidget {
  const Halaman_Notifikasi({Key? key}) : super(key: key);

  @override
  State<Halaman_Notifikasi> createState() => _Halaman_Notifikasi();
}

class _Halaman_Notifikasi extends State<Halaman_Notifikasi> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
            top: true,
            child: Scaffold(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              body: SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 90, 15),
                        child: Transform.scale(
                          scale: 1.4,
                          child: IconButton(
                            //iconSize: 50,
                            icon: Image.asset('assets/images/back.png'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Utama()),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Image.asset('assets/images/notification.png'),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Container(
                          height: 100,
                          width: 370,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0)),
                          ),
                          child: Row(children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text('Antrian',
                                          style: TextStyle(fontSize: 25)),
                                    ),
                                    Center(
                                      child: Text('No.5',
                                          style: TextStyle(fontSize: 25)),
                                    ),
                                  ]),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                  ),
                                  color: Colors.green),
                            ),
                            Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(8, 20, 0, 3),
                                    child: Text('Nomor Antrian Anda',
                                        style: TextStyle(fontSize: 15))),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                                    child: Text('Sedang Dipanggil',
                                        style: TextStyle(fontSize: 15))),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 70, 0),
                                    child: Text('10.00 AM',
                                        style: TextStyle(color: Colors.green))),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                              child: Transform.scale(
                                scale: 1.4,
                                child: IconButton(
                                  //iconSize: 50,
                                  icon: Image.asset('assets/images/next.png'),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Halaman_Dua_Ubah_Pass()),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ]))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Container(
                          height: 100,
                          width: 370,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0)),
                          ),
                          child: Row(children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text('Antrian',
                                          style: TextStyle(fontSize: 25)),
                                    ),
                                    Center(
                                      child: Text('No.6',
                                          style: TextStyle(fontSize: 25)),
                                    ),
                                  ]),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                  ),
                                  color: Colors.green),
                            ),
                            Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(10, 20, 0, 3),
                                    child: Text('5 Menit Lagi Nomor Antrian',
                                        style: TextStyle(fontSize: 15))),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                                    child: Text('Anda Akan Dipanggil',
                                        style: TextStyle(fontSize: 15))),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 105, 0),
                                    child: Text('10.05 AM',
                                        style: TextStyle(color: Colors.green))),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Transform.scale(
                                scale: 1.4,
                                child: IconButton(
                                  //iconSize: 50,
                                  icon: Image.asset('assets/images/next.png'),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Utama()),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ]))),
                ],
              )),
            )));
  }
}

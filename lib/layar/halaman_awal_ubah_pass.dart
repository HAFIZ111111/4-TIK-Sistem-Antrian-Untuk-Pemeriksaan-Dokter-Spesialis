import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpl/layar/halaman_dua_ubah_pass.dart';
import 'package:rpl/layar/halaman_login.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'package:rpl/layar/pilih_rs.dart';
// import 'package:logintunisia/screens/signUpScreen.dart';
import '../widget/InputTextWidget.dart';

class Halaman_Awal_Ubah_Pass extends StatefulWidget {
  const Halaman_Awal_Ubah_Pass({Key? key}) : super(key: key);

  @override
  State<Halaman_Awal_Ubah_Pass> createState() => _Halaman_Awal_Ubah_Pass();
}

class _Halaman_Awal_Ubah_Pass extends State<Halaman_Awal_Ubah_Pass> {
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
                        padding: EdgeInsets.fromLTRB(8, 8, 60, 15),
                        child: Transform.scale(
                          scale: 1.4,
                          child: IconButton(
                            //iconSize: 50,
                            icon: Image.asset('assets/images/back.png'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Halaman_login()),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Image.asset('assets/images/Ubahpass.png'),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(5, 20, 110, 0),
                      child: Text('Pilih Satu Cara Untuk Mereset Password',
                          style: TextStyle(fontSize: 15))),
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
                              child: Icon(Icons.message,
                                  size: 70, color: Colors.white),
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
                                    padding: EdgeInsets.fromLTRB(5, 20, 40, 0),
                                    child: Text('via SMS:',
                                        style: TextStyle(fontSize: 15))),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(5, 20, 0, 0),
                                    child: Text('+62*********23',
                                        style: TextStyle(fontSize: 15))),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(110, 0, 0, 0),
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
                              child: Icon(Icons.mail,
                                  size: 70, color: Colors.white),
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
                                    padding: EdgeInsets.fromLTRB(5, 20, 100, 0),
                                    child: Text('via Email:',
                                        style: TextStyle(fontSize: 15))),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(5, 20, 0, 0),
                                    child: Text('unkonwn@axample.com',
                                        style: TextStyle(fontSize: 15))),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
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
                ],
              )),
            )));
  }
}

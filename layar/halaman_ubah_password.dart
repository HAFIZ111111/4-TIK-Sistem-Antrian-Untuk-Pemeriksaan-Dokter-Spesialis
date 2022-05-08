import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpl/layar/halaman_dua_ubah_pass.dart';
import 'package:rpl/layar/halaman_login.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'package:rpl/layar/pilih_rs.dart';
// import 'package:logintunisia/screens/signUpScreen.dart';
import '../widget/InputTextWidget.dart';

class Halaman_UbahPass extends StatefulWidget {
  const Halaman_UbahPass({Key? key}) : super(key: key);

  @override
  State<Halaman_UbahPass> createState() => _Halaman_UbahPass();
}

class _Halaman_UbahPass extends State<Halaman_UbahPass> {
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
                                    builder: (context) =>
                                        Halaman_Dua_Ubah_Pass()),
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
                      padding: EdgeInsets.fromLTRB(10, 30, 240, 0),
                      child: Text('Buat Password Baru',
                          style: TextStyle(fontSize: 15))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 250, 5),
                      child: Text('Password Baru',
                          style: TextStyle(fontSize: 15))),
                  Container(
                    height: 55,
                    width: 370,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Masukkan Password Baru Anda',
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2.0),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15.0),
                              )),
                          border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                            Radius.circular(15.0),
                          ))),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 15, 200, 5),
                      child: Text('Ulangi Password Baru',
                          style: TextStyle(fontSize: 15))),
                  Container(
                    height: 55,
                    width: 370,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Masukkan Ulang Password Baru Anda',
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2.0),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15.0),
                              )),
                          border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                            Radius.circular(15.0),
                          ))),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(16.0)),
                  Padding(padding: EdgeInsets.fromLTRB(0, 100, 0, 0)),
                  Container(
                      height: 36,
                      width: 310,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          alignment: Alignment.center,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Pilih_rs()),
                          );
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff4EC72D)),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Color(0xff4EC72D),
                      )),
                ],
              )),
            )));
  }
}

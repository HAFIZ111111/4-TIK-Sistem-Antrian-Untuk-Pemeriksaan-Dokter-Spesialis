import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpl/layar/halaman_daftar.dart';
import 'package:rpl/layar/halaman_login.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'package:rpl/layar/pilih_rs.dart';
// import 'package:logintunisia/screens/signUpScreen.dart';
import '../widget/InputTextWidget.dart';
import 'package:pinput/pinput.dart';

final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(10),
      ),
    );

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.green),
      borderRadius: BorderRadius.circular(8),
    );



class Pass extends StatefulWidget {
  const Pass({Key? key}) : super(key: key);
 
  @override
  State<Pass> createState() => _Pass();
}
 
class _Pass extends State<Pass> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: 
     SafeArea(
       top: true,
       child:  Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
          
      body :SingleChildScrollView( 
        child:
        Column(
        children:<Widget> [
          SizedBox(height: 10,),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding
                  (padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: 
                  Transform.scale(
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
                        ),),
                  Container(
                    width: 340,
                    child: 
                  Align(
                  alignment: Alignment.center,
                  child:    
                  Image.asset('assets/images/lupapass.png'))) 
                ],
              ),

          SizedBox(height: 80,),

          Center(
            child: Column(
              children: [
                Text("Masukkan Kode yang telah di kirim ke"),
                Text("no +62********67")
              ],
            ),
          ),
          SizedBox(height: 30,),
          Pinput(
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            
      
      validator: (s) {
        return s == '2222' ? null : 'salah anjimm';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
          ),
          SizedBox(height: 30,),
          Center(
            child: Text("Kirim ulang kode dalam 50 s")),
            SizedBox(height: 50,),
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
                          MaterialPageRoute(builder: (context) => Utama()),
                        );
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Color(0xff000000),
                            
                          ),
                ),
                ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4EC72D)),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Color(0xff4EC72D),
                    )
                    ),

                    ],
          )
        ),
    )));
        }}
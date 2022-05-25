 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpl/database/data_fix.dart';
import 'package:rpl/layar/halaman_login.dart';
import 'package:rpl/layar/halaman_utama.dart';
// import 'package:logintunisia/screens/signUpScreen.dart';


class Halaman_daftar extends StatefulWidget {
  const Halaman_daftar({Key? key}) : super(key: key);
 
  @override
  State<Halaman_daftar> createState() => _Halaman_daftar();
}
 
class _Halaman_daftar extends State<Halaman_daftar> {
  final TextEditingController _username = TextEditingController();
   final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _no_telepon = TextEditingController();
 
 List<Map<String, dynamic>> cek = [];
 bool _isObscure = true;


 void _refreshJournals1(String data9) async {
 
    final data = await DataPasien.getItemNama("$data9");
      setState(() {
        cek = data;
      });
     
   
  }

 Future<void> _addItem() async {
    await DataPasien.createItem(
        _username.text,
        _password.text,
        "",
        0,
        _email.text, 
        _no_telepon.text);
  }

  String katadaftar = "";


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
          
      body :
      SingleChildScrollView( 
        child:
        Center(
          child:
        Container(
          width: 370,

          alignment: Alignment.center,
          child:
        Column(
        children:<Widget> [
          Padding(
          padding: EdgeInsets.all(16.0)),
          Center(
            child:Image.asset('assets/images/logodaftar.png'), 
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Center(child:
          Text(katadaftar, textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.red,),),),
          Padding(
          padding: EdgeInsets.fromLTRB(0,16,0,0)),
          Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          child: Text('Username', 
            style: TextStyle(fontSize: 15))),
            Container(
              width: 370,
              child:
         TextField(
           //cursorHeight: 55,
                    textInputAction: TextInputAction.next,
                    controller: _username,
                    decoration: InputDecoration(
                      
                    contentPadding:
                  EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                //labelText: 'Enter something',
                //labelText: "Jadwal 1",
                hintText: "Masukkan Username Anda",
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.green,
                ),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.amber),
                  borderRadius: BorderRadius.circular(20),
                )),
                ),),
              Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 300, 5),
          child: Text('Password', 
            style: TextStyle(fontSize: 15))),
              Container(
              width: 370,
              child:
         TextField(
           //cursorHeight: 55,
           obscureText: _isObscure,


                    textInputAction: TextInputAction.next,
                    controller: _password,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off, color: Colors.green,),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    }),
                    contentPadding:
                  EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                //labelText: 'Enter something',
                //labelText: "Jadwal 1",
                hintText: "Masukkan Password Anda",
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.green,
                ),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.amber),
                  borderRadius: BorderRadius.circular(20),
                )),
                ),),
                      Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 258, 5),
          child: Text('Email', 
            style: TextStyle(fontSize: 15))),
          Container(
              width: 370,
              child:
         TextField(
           //cursorHeight: 55,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    controller: _email,
                    decoration: InputDecoration(
                    contentPadding:
                  EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                //labelText: 'Enter something',
                //labelText: "Jadwal 1",
                hintText: "Masukkan Email Anda",
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.green,
                ),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.amber),
                  borderRadius: BorderRadius.circular(20),
                )),
                ),),
              Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 295, 5),
          child: Text('No telepon', 
            style: TextStyle(fontSize: 15))),
              Container(
              width: 370,
              child:
         TextField(
           textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
           //cursorHeight: 55,
        
                    controller: _no_telepon,
                    decoration: InputDecoration(
                    contentPadding:
                  EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                //labelText: 'Enter something',
                //labelText: "Jadwal 1",
                hintText: "Masukkan No.Telepon Anda",
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.green,
                ),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.amber),
                  borderRadius: BorderRadius.circular(20),
                )),
                ),),
                    
                Padding(
                padding: EdgeInsets.all(16.0)),
                Center(
                  child:
                Container(
                    height: 36,
                    width: 310,
                    child: TextButton(
                        style: TextButton.styleFrom( 
                        alignment: Alignment.center,
                        ),
                        onPressed: () {
                        _refreshJournals1(_username.text);
                        Future.delayed(const Duration(milliseconds: 1000), () {

 
                        

                        print(cek);
          if (cek.isNotEmpty){
            setState(() {
                            print("Username udah terdaftar");
                            katadaftar = "Username sudah terdaftar";
                             Future.delayed(const Duration(milliseconds: 2000), () {

   setState(() {
     katadaftar = "";
       });
                          });
                          });
            

          }else{
     
      


                          if(_username.text!=""&&_password.text!=""
                          &&_email.text!=""&&_no_telepon.text!=""){_addItem();
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Halaman_login()),
                        );}
                        else{
                          setState(() {
                            print("gak boleh kosong");
                            katadaftar = "Isi semua data gak boleh ada yang kosong";
                             Future.delayed(const Duration(milliseconds: 2000), () {

   setState(() {
     katadaftar = "";
       });
                          });
                          });
                          
                        }}});},
                        child: Text(
                          "Daftar",
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
                    ),),
                    Padding(
                    padding: EdgeInsets.all(5.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, 
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Pengguna Lama?",style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20),),
                        TextButton(
                        style: TextButton.styleFrom( 
                        alignment: Alignment.center,
                        ),
                        onPressed: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Halaman_login()),
                        );
                        },
                        child:
                        Text("Login",style: TextStyle(
                        fontSize: 20,color: Colors.green),),)
                        
                      ],
                    )])
                    ],
          )
        ),
    ))));
        }}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpl/admin/admin_class.dart';
import 'package:rpl/admin/admin_utama.dart';
import 'package:rpl/admin/data_variable.dart';
import 'package:rpl/database/data_fix.dart';
import 'package:rpl/layar/class_utama.dart';
import 'package:rpl/layar/halaman_daftar.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'package:rpl/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Map<String, dynamic>> users = [];

class Halaman_login extends StatefulWidget {
  const Halaman_login({Key? key}) : super(key: key);
 
   @override
  _Halaman_loginState createState() => _Halaman_loginState();
}
 
class _Halaman_loginState extends State<Halaman_login> {

  late SharedPreferences logindata;
  late SharedPreferences logindataadmin;
  late bool newuser;
  late bool newuser1;
  bool _loading = true;
  bool _isObscure = true;

   void _refreshJournals1(String data9) async {
 
    final data = await DataPasien.getItemNama("$data9");
      setState(() {
        users = data;
      });
     
   
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    logindataadmin = await SharedPreferences.getInstance();

      newuser1 = (logindataadmin.getBool('login1') ?? true);
      print(" $newuser1+ iniiiiiiadmin");
      newuser = (logindata.getBool('login') ?? true);
      print(" $newuser+ iniiiiiiuser");
      Future.delayed(const Duration(milliseconds: 1000), () {
   

   
    if (newuser == false) {
      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Utama()),
                        ); 
      
                       
    }

    if (newuser1 == false) {
      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Admin_utama()),
                        );
                        print("jalan");
                       
    }
    });
    if(newuser == true&&newuser1 == true){
      Future.delayed(const Duration(milliseconds: 1000), () {
       setState(() {
         _loading = false;
       });
    //_loading = false;

   });
    
    }

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
    //check_if_already_login1();
  

  }
  
  String katalogin = "";

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
          
      body :  _loading
      ? 
      Center(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Text("Memuat!",style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green),),
                        SizedBox(height: 30,),
      SizedBox(
        height: 70,
        width: 70,
        child:
      CircularProgressIndicator(
            backgroundColor: Colors.grey,
            color: Colors.green,
         
          strokeWidth: 10,
          
          ))])):
      SingleChildScrollView( child:
      Column(
        children:<Widget> [
          SizedBox(height: 20,),
          Padding(
          padding: EdgeInsets.all(16.0)),
          Center(
            child:Image.asset('assets/images/hallogin1.png'), 
          ),
          Center(child:
          Text(katalogin, textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.red,),),),
          
          Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 300, 5),
          child: Text('Username', 
            style: TextStyle(fontSize: 15))),
          Container(
              width: 370,
              child:
         TextField(
           
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
          padding: EdgeInsets.fromLTRB(0, 15, 300, 5),
          child: Text('Password', 
            style: TextStyle(fontSize: 15))),
              Container(
              width: 370,
              child:
         TextField(
           obscureText: _isObscure,
           
           //cursorHeight: 55,
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
                padding: EdgeInsets.all(16.0)),
                Container(
                    height: 36,
                    width: 310,
                    child: TextButton(
                        style: TextButton.styleFrom( 
                        alignment: Alignment.center,
                        ),
                        onPressed: ()  {


if (_username.text != ""&&_password.text != ""){


  
        if (_username.text == 'admin'&& _password.text == '123'){
          logindataadmin.setBool('login1', false);
          print("ini admin jalan");
          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Admin_utama()),
                        );
        } else {
        
        _refreshJournals1(_username.text);
         Future.delayed(const Duration(milliseconds: 1000), () {
      if (users.length == 0){
  setState(() {
                          
                       
                        katalogin = "Username tidak terdaftar";
                        Future.delayed(const Duration(milliseconds: 2000), () {

   setState(() {
     katalogin = "";
       });
                          });
                        
                        
                        });
}

      if (_password.text != users[0]['password']){
        print('Password nya salah');
        //pengguna = users[0]['password'];
        setState(() {
                          
                       
                        katalogin = "Username atau password salah!";
                        Future.delayed(const Duration(milliseconds: 2000), () {

   setState(() {
     katalogin = "";
       });
                          });
                        
                        
                        });
        
      } else {
        String username = _username.text;
        logindata.setBool('login', false);
        logindata.setString('username', username);
        print('ini jalan');
        print('Password nya benar');
        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Utama()),
                        );
                        pengguna = users[0]['username'];
                        book = users[0]['book'];
      }

   });

              



                          //print(users);
                          
                          
                          //print(users[0]["password"] + " ini pass");


} 
                        }
                        else{
                        print('gakboleh kosongg');
                        setState(() {
                          
                       
                        katalogin = "Gak boleh kosong!";
                        Future.delayed(const Duration(milliseconds: 2000), () {

   setState(() {
     katalogin = "";
       });
                          });
                        
                        
                        });

                        }
                        print('ini jalan');
                },
                        
                        



                        child: Text(
                          "Login",
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
                    
                    Padding(
                    padding: EdgeInsets.all(0)),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, 
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Pengguna baru?",style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20),),
                        TextButton(
                        style: TextButton.styleFrom( 
                        alignment: Alignment.center,
                        ),
                        onPressed: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Halaman_daftar()),
                        );
                        },
                        child:
                        Text("Daftar",style: TextStyle(
                        fontSize: 20,color: Colors.green),),)
                        
                      ],
                    )
                    ],
          )
        ),
    ));
        }}
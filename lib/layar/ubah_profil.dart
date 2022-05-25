import 'package:flutter/material.dart';
import 'package:rpl/database/data_fix.dart';
import 'package:rpl/layar/booking.dart';
import 'package:rpl/layar/class_utama.dart';
import 'package:rpl/layar/halaman_login.dart';
import 'package:rpl/layar/halaman_profil.dart';
import 'package:rpl/layar/informasi.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'bonus.dart';
import 'package:rpl/admin/data_variable.dart';





class Ubah extends StatefulWidget {
  const Ubah({Key? key}) : super(key: key);
 
  @override
  State<Ubah> createState() => _Ubah();
}
 
class _Ubah extends State<Ubah> {
 
 final TextEditingController _username = TextEditingController();
   final TextEditingController _bpjs = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _no_telepon = TextEditingController();
 

void _refreshJournals1(String data9) async {
 
    final data = await DataPasien.getItemNama("$data9");
      setState(() {
        users = data;
      });
  }


bool loading = false;

Future<void> _updateProfil(int id) async {
    await DataPasien.updateItem(
        id,
        users[0]['username'],
        users[0]['password'],
        _bpjs.text,
        users[0]['book'],
        _email.text, 
        _no_telepon.text);
        _refreshJournals1(users[0]['username']);
  }

 





 @override
  void initState() {
    super.initState();

    _username.text = users[0]['username'];
    _email.text = users[0]['email'];
    _bpjs.text = users[0]['bpjs'];
    _no_telepon.text = users[0]['no_telepon'];

  
  }

konfirmasi_ubah(BuildContext context) {

  // set up the buttons
  Widget cancelButton = Container(
                    height: 36,
                    width: 110,
                    child: TextButton(
                        style: TextButton.styleFrom( 
                        alignment: Alignment.center,
                        ),
                        onPressed: () {Navigator.pop(context); },
                        child: Text(
                          "Batal",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            
                          ),
                ),
                ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4EC72D)),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Color(0xff4EC72D),
                    )
                    );
  
  Widget continueButton = Container(
                    height: 36,
                    width: 110,
                    child: TextButton(
                        style: TextButton.styleFrom( 
                        alignment: Alignment.center,
                        ),
                        onPressed: () async { 
                          print(_username.text + "ini text");
                          await _updateProfil(users[0]['id']);
                          Future.delayed(const Duration(milliseconds: 0), () {
                            print("$users ini userrrrr");
                          pengguna = _username.text;
                          print(pengguna +"ini pengguna");
                          loading = true;
                          _refreshJournals1(pengguna);
                           Future.delayed(const Duration(milliseconds: 2000), () {
                          
                          loading = false;

                          print(users);

                         
                            print(users);
      Navigator.pop(context);
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (context) => Profil()));
                           });
                    
                          });
                          
                         
                          },
                        child: Text(
                          "Konfirmasi",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            
                          ),
                ),
                ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4EC72D)),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Color(0xff4EC72D),
                    )
                    );

  // set up the AlertDialog
  AlertDialog alert2 = AlertDialog(
    title: Text("Konfirmasi"),
    content: Text("Simpan perubahan akun?"),
    actions: [
      Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      
      cancelButton,
      continueButton,])),
      SizedBox(height: 10,)
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert2;
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: SafeArea(
          top: true,
          child: Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
          
     
          body:  
          loading
      ? 
      Center(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Text("Simpan data baru",style: TextStyle(fontWeight: FontWeight.bold,
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
          SingleChildScrollView( 
            child: 
            Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                   child: Transform.scale(
                    scale: 1.4,
                    child:IconButton(
                    //iconSize: 50,
                    icon: Image.asset('assets/images/back.png'),
                    onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profil()),
                        );},   
                    ),
                  ),),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 130, 0),
                   child: Image.asset('assets/images/ubah1.png'),
                  ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                   child:
                Container(
                    height: 110,
                    width: 110,
                    child: 
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                   child: Icon(Icons.person,
                   size: 100,),
                  ),
                    
                    decoration: BoxDecoration(
                      //border: Border.all(color: Color(0xff4EC72D)),
                      borderRadius: BorderRadius.all(Radius.circular(1000.0)),
                    color: Color(0xffEBF1FA),
                    )
                    )),
               Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                   child:
                Container(
                    
                    height: 380,
                    width: 370,
                    child: 
                    Align(
                      alignment: Alignment.center,
                      child:
                    
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Text('Nama Pengguna',style: TextStyle(
                            fontWeight: FontWeight.bold),
                        ),),
                      
                      Container(
                    padding: EdgeInsets.fromLTRB(10,2,10,2),
                    height: 36,
                    width: 340,
                    child: 
                    Row(children: [
                      Text(users[0]['username']
                        ),]),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4EC72D)),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    //color: Color(0xffEBF1FA),
                    )
                    ),
                      
                    //decoration: BoxDecoration(
                      //border: Border.all(color: Color(0xff4EC72D)),
                      //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    //color: Color(0xffEBF1FA),
                   // )
                    
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Text('Email',style: TextStyle(
                            fontWeight: FontWeight.bold),
                        ),),
                      SizedBox(
                      height: 36,
                      width: 340,
                      child: TextField(
                        controller: _email,
                        decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: const BorderRadius.all(Radius.circular(20.0),)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.green),
                            borderRadius: const BorderRadius.all(Radius.circular(20.0),)),
                        
                        
  
                            hintText: "Email baru",
                            contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            suffixIcon: Icon(Icons.edit)
                      ),
                    )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Text('No Telepon',style: TextStyle(
                            fontWeight: FontWeight.bold),
                        ),),
                      SizedBox(
                      height: 36,
                      width: 340,
                      child: TextField(
                        controller: _no_telepon,
                        decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: const BorderRadius.all(Radius.circular(20.0),)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.green),
                            borderRadius: const BorderRadius.all(Radius.circular(20.0),)),
                        
                        
  
                            hintText: "No Telepon baru",
                            contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            suffixIcon: Icon(Icons.edit)
                      ),
                    )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Text('No BPJS',style: TextStyle(
                            fontWeight: FontWeight.bold),),
                        ),
                      SizedBox(
                      height: 36,
                      width: 340,
                      child: TextField(
                        controller: _bpjs,
                        decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: const BorderRadius.all(Radius.circular(20.0),)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.green),
                            borderRadius: const BorderRadius.all(Radius.circular(20.0),)),
                        
                        
  
                            hintText: "BPJS",
                            contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            suffixIcon: Icon(Icons.edit)
                      ),
                    )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
                      child:
                    Container(
                    height: 36,
                    width: 340,
                    child: 
                    TextButton(
                        style: TextButton.styleFrom( 
                        alignment: Alignment.center,
                        ),
                        onPressed: () {konfirmasi_ubah(context);
                        },
                        child: 
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Simpan', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255))),
                            
                      ],
                    ),),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4EC72D)),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Color(0xff4EC72D),
                    )
                    ),),
                    
          
                      ]),),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4EC72D)),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    //color: Color(0xffEBF1FA),
                    )
                    )
                    ),
                      

                    
              ],
            )
     
      ),
    )
    ));
  }
}

class _selectedIndex {
}




















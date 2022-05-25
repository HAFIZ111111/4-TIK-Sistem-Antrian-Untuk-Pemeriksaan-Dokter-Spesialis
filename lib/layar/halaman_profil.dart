import 'package:flutter/material.dart';
import 'package:rpl/admin/data_variable.dart';
import 'package:rpl/database/data_fix.dart';
import 'package:rpl/layar/booking.dart';
import 'package:rpl/layar/class_utama.dart';
import 'package:rpl/layar/halaman_login.dart';
import 'package:rpl/layar/informasi.dart';
import 'package:rpl/layar/pengaturan.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'package:rpl/layar/ubah_profil.dart';
import 'package:rpl/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bonus.dart';





class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);
 
  @override
  State<Profil> createState() => _Profil();
}
 
class _Profil extends State<Profil> {



  void _refreshJournals2(String data9) async {
 
    final data = await DataPasien.getItemNama("$data9");
      setState(() {
        users = data;
      });
  }
    
    void _initial() async {
    logindata = await SharedPreferences.getInstance();

  }

 late SharedPreferences logindata;

  @override
  void initState() {
    super.initState();
    _refreshJournals2(pengguna);
    _initial();
    Future.delayed(const Duration(milliseconds: 2000), () {
 print(pengguna + "ini loen");
                          });
    // Loading the diary when the app starts
  }
  


  @override
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(book == 0){
        if ( _selectedIndex == 2 ){
        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pages1[3]),);
          
  
} else {
    Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pages1[_selectedIndex]),

                        );
}}
if (book == 1){
Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pages1[_selectedIndex]),);
}

    });
  }

 konfirmasi_logout(BuildContext context) {


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
                        onPressed: () {
                          
 logindata.setBool('login', true);
                        Navigator.pop(context);
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (context) => Halaman_login()));
                        book = 0;
                        
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
    content: Text("Logout dari aplikasi?"),
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
          bottomNavigationBar: BottomNavigationBar(
            
        
            backgroundColor: Color(0xff4EC72D),


            selectedFontSize: 15,
            selectedIconTheme: IconThemeData(color: Colors.white, size: 30),
            selectedItemColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
                
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Utama',
                
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'List',
                
              ),

            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
     
          body:  
          SingleChildScrollView( 
            child: 
            Column(
              children: [
                SizedBox(height: 5,),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                   child: Transform.scale(
                    scale: 1.4,
                    child:IconButton(
                    //iconSize: 50,
                    icon: Image.asset('assets/images/back.png'),
                    onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Utama()),
                        );},   
                    ),
                  ),),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                   child: Image.asset('assets/images/logopro1.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                   child: IconButton(onPressed: (){
                     Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Pengaturan()),
                        );
                   }, icon: Icon(Icons.settings,
                   color: Colors.green,
                   size: 40,))
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Text('Email',style: TextStyle(
                            fontWeight: FontWeight.bold),
                        ),),
                      Container(
                        padding: EdgeInsets.fromLTRB(10,0,10,0),
                    height: 36,
                    width: 340,
                    child: 
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text(users[0]['email']),
                    Icon(Icons.email),
                        ]),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4EC72D)),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    //color: Color(0xffEBF1FA),
                    )
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Text('No Telepon',style: TextStyle(
                            fontWeight: FontWeight.bold),
                        ),),
                      Container(
                        padding: EdgeInsets.fromLTRB(10,0,10,0),
                    height: 36,
                    width: 340,
                    child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text(users[0]['no_telepon']),
                    Icon(Icons.phone),
                        ]),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4EC72D)),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    //color: Color(0xffEBF1FA),
                    )
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Text('No BPJS',style: TextStyle(
                            fontWeight: FontWeight.bold),),
                        ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10,0,10,0),
                    height: 36,
                    width: 340,
                    child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text(users[0]['bpjs']),
                    Icon(Icons.card_membership),
                        ]),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4EC72D)),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    //color: Color(0xffEBF1FA),
                    )
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                      child:
                    Container(
                    height: 36,
                    width: 340,
                    child: 
                    TextButton(
                        style: TextButton.styleFrom( 
                        alignment: Alignment.center,
                        ),
                        onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Ubah()),
                        );
                        },
                        child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Ubah profil', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255))),
                            
                      ],
                    ),),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4EC72D)),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Color(0xff4EC72D),
                    )
                    ),
                    ),
                    
                    
                    Container(
                    height: 36,
                    width: 340,
                    child: 
                    TextButton(
                        style: TextButton.styleFrom( 
                        alignment: Alignment.center,
                        ),
                        onPressed: () { //konfirmasi_logout(context);
                        konfirmasi_logout(context);
                        book = 0;
                        },
                        child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.exit_to_app,
                        color: Color.fromARGB(255, 255, 255, 255) ,),
                        Text('Logout', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255))),
                            
                      ],
                    ),),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4EC72D)),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.red,
                    )
                    ),
                
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




















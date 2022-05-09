import 'package:flutter/material.dart';
import 'package:rpl/layar/booking.dart';
import 'package:rpl/layar/informasi.dart';
import 'package:rpl/layar/pilih_rs.dart';
import 'package:rpl/layar/plih_dokter.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'package:rpl/layar/ubah_profil.dart';
import 'bonus.dart';





class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);
 
  @override
  State<Profil> createState() => _Profil();
}
 
class _Profil extends State<Profil> {
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
                   child: Icon(Icons.settings,
                   size: 40,
                   color: Color(0xff4EC72D),)
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
                      Text('M Hafiz Rinaldi'
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
                    Text('Hafiz221@gmail.com'),
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
                    Text('08berapayaaaa'),
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
                    Text('H1235237'),
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
                        ); book = 0;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.exit_to_app,
                        color: Color.fromARGB(255, 255, 255, 255) ,),
                        Text('Logout', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255))),
                            
                      ],
                    ),
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

class _selectedIndex {
}




















import 'package:flutter/material.dart';
import 'package:rpl/layar/booking.dart';
import 'package:rpl/layar/halaman_profil.dart';
import 'package:rpl/layar/informasi.dart';
import 'package:rpl/layar/pilih_rs.dart';
import 'package:rpl/layar/plih_dokter.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'bonus.dart';





class Ubah extends StatefulWidget {
  const Ubah({Key? key}) : super(key: key);
 
  @override
  State<Ubah> createState() => _Ubah();
}
 
class _Ubah extends State<Ubah> {
 
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: SafeArea(
          top: true,
          child: Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
          
     
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
                      
                      SizedBox(
                      height: 36,
                      width: 340,
                      child: TextField(
                        decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: const BorderRadius.all(Radius.circular(20.0),)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.green),
                            borderRadius: const BorderRadius.all(Radius.circular(20.0),)),
                        
                        
  
                            hintText: 'M Hafiz Rinaldi',
                            contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            suffixIcon: Icon(Icons.edit)
                      ),
                    )),
                      
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
                      Container(
                        padding: EdgeInsets.fromLTRB(10,0,10,0),
                    height: 36,
                    width: 340,
                    child: 
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text('Hafiz221@gmail.com'),
                    Icon(Icons.lock),
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
                    Icon(Icons.lock),
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
                      SizedBox(
                      height: 36,
                      width: 340,
                      child: TextField(
                        decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: const BorderRadius.all(Radius.circular(20.0),)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.green),
                            borderRadius: const BorderRadius.all(Radius.circular(20.0),)),
                        
                        
  
                            hintText: 'h7y71hyuhuhd',
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
                        onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profil()),
                        ); book = 0;
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




















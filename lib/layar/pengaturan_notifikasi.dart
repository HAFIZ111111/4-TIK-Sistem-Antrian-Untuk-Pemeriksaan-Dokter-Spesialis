import 'package:flutter/material.dart';
import 'package:rpl/layar/booking.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'package:rpl/layar/pengaturan.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'dart:math';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:rpl/admin/data_variable.dart';

bool bar = false; 
bool suara = false; 
bool getaran = false; 



class Pnotifikasi extends StatefulWidget {
  const Pnotifikasi({Key? key}) : super(key: key);
 
  @override
  State<Pnotifikasi> createState() => _Pnotifikasi();
}
 
class _Pnotifikasi extends State<Pnotifikasi> {
  @override
  int _selectedIndex = 1;

  
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
      
    });print(_selectedIndex);
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
          
          Column(
            children: [
              SizedBox(height: 10,),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding
                  (padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                                      builder: (context) => Pengaturan()),
                                );
                              },
                            ),
                          ),),
                  Container(
                    width: 350,
                    child: 
                  Align(
                  alignment: Alignment.center,
                  child:    
                  Image.asset('assets/images/penga.png'))) 
                ],
              ),
              SizedBox(height: 40),
              Column(
                children: [
                    
                    SizedBox(height: 10),
                    Container(
                    padding: EdgeInsets.fromLTRB(10,2,10,2),
                    height: 49,
                    width: 370,
                    child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text('Suara',style: TextStyle(fontSize: 18
                        )
                        ),
                         FlutterSwitch(
                        height: 30.0,
                        width: 50.0,
                        padding: 4.0,
                        toggleSize: 20.0,
                        borderRadius: 20.0,
                        //activeColor: lets_cyan,
                        value: suara,
                        onToggle: (value) {
                              setState(() {
                                    suara = value;
                              });
                              print(suara);
                                },),]),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4EC72D),width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    //color: Color(0xffEBF1FA),
                    )
                    ),
                    SizedBox(height: 10),
                    Container(
                    padding: EdgeInsets.fromLTRB(10,2,10,2),
                    height: 49,
                    width: 370,
                    child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text('Getaran',
                      style: TextStyle(fontSize: 18
                        )
                        ),
                         FlutterSwitch(
                        height: 30.0,
                        width: 50.0,
                        padding: 4.0,
                        toggleSize: 20.0,
                        borderRadius: 20.0,
                        //activeColor: lets_cyan,
                        value: getaran,
                        onToggle: (value) {
                              setState(() {
                                    getaran = value;
                              });
                              print(getaran);
                                },),]),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4EC72D),width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    //color: Color(0xffEBF1FA),
                    )
                    ),

                ],
              )

            ],)
        
      )
    )
    );
  }
}






















import 'package:flutter/material.dart';
import 'package:rpl/admin/data_variable.dart';
import 'package:rpl/layar/booking.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'package:rpl/layar/pengaturan.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'dart:math';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';




class Bantuan extends StatefulWidget {
  const Bantuan({Key? key}) : super(key: key);
 
  @override
  State<Bantuan> createState() => _Bantuan();
}
 
class _Bantuan extends State<Bantuan> {
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
  bool bar = false; 
  bool suara = false; 
  bool getaran = false; 
  bool _expanded = false;
 

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
                  Image.asset('assets/images/bantuan.png'))) 
                ],
              ),
              SizedBox(height: 40),
              
    
          Container(
            width: 370,
            child:
          Card(
            
            //color: Colors.purple,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                side: BorderSide(
              width: 2,
              color: Colors.green
          )),
            child: RoundedExpansionTile(
              
              //leading: Icon(Icons.person),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Text('Bantuan 1', style: TextStyle(fontSize: 18),),
              trailing: Icon(Icons.keyboard_arrow_down, size: 50, color: Colors.green,),
              rotateTrailing: true,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15,0,0,10),
                  child: Text("""Lagu rossa :v
                  
                  """, style: TextStyle(fontSize: 50),)
                )
              ],
            ),
          ),),
          Container(
            width: 370,
            child:
          Card(
            
            //color: Colors.purple,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                side: BorderSide(
              width: 2,
              color: Colors.green
          )),
            child: RoundedExpansionTile(
              
              //leading: Icon(Icons.person),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Text('Bantuan 2', style: TextStyle(fontSize: 18),),
              trailing: Icon(Icons.keyboard_arrow_down, size: 50, color: Colors.green,),
              rotateTrailing: true,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15,0,0,10),
                  child: Text("""gahfgahfgagbfjagfahfgha
ahkfgagfjkahjkfahfjkahjfhjkhaf
ahfuaghgfjkahfjkahklfhklahjkfa
afhhagfjkaklfjklajklfa
abhhfhajkfklajlkfa
abhfjanbfjkanhjfhjakfklahbfjga""", style: TextStyle(fontSize: 18),)
                )
              ],
            ),
          ),),
          Container(
            width: 370,
            child:
          Card(
            
            //color: Colors.purple,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                side: BorderSide(
              width: 2,
              color: Colors.green
          )),
            child: RoundedExpansionTile(
              
              //leading: Icon(Icons.person),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Text('Bantuan 3', style: TextStyle(fontSize: 18),),
              trailing: Icon(Icons.keyboard_arrow_down, size: 50, color: Colors.green,),
              rotateTrailing: true,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15,0,0,10),
                  child: Text("""gahfgahfgagbfjagfahfgha
ahkfgagfjkahjkfahfjkahjfhjkhaf
ahfuaghgfjkahfjkahklfhklahjkfa
afhhagfjkaklfjklajklfa
abhhfhajkfklajlkfa
abhfjanbfjkanhjfhjakfklahbfjga""", style: TextStyle(fontSize: 18),)
                )
              ],
            ),
          ),)


            ],)
        
      )
    ))
    );
  }
}






















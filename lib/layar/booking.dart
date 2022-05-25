import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rpl/admin/admin_class.dart';
import 'package:rpl/admin/data_variable.dart';
//import 'package:rpl/admin/widget_punya_admin.dart';
import 'package:rpl/database/data_fix.dart';
import 'package:rpl/layar/bonus.dart';
import 'package:rpl/layar/class_pilih_dokter.dart';
import 'package:rpl/layar/halaman_login.dart';
import 'package:rpl/layar/informasi.dart';
import 'package:rpl/layar/pilih_dokter.dart';
import 'package:rpl/main.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'dart:math';
import 'package:rpl/layar/pilih_dokter.dart';


//int book = 0;
final List lis  =['21 - 04 -2077', '22 - 04 -2077','23 - 04 -2077','24 - 04 -2077','25 - 04 -2077'];
final List lis1 =['''21
Senin''','''22
Selasa''','''23
Rabu''','''24
Senin''','''25
Senin'''];
//final List lis2 =[dokterZA[index2]['jw1'],dokterZA[index2]['jw2']];
//List dataUser = [];

final List lis3=['BPJS','Non BPJS'];

var tanggal = '';
var jam = database1[index2]['jw2'];
var bpjs = lis3[1];


int antre = 1;

List database1 = [];
int index2 = 0;

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);
 
  @override
  State<Booking> createState() => _Booking();
}
 
class _Booking extends State<Booking> {
  @override
  int _selectedIndex = 1;

  int no1 = database1[index2]['noAntrian1'] + 1;
  int no2 = database1[index2]['noAntrian2'] + 1;

  
  final TextEditingController _keluhan = TextEditingController();

  void _refreshJournals1() async {
 
    final data = await DataAntrian.getItems();
    setState(() {
      adokterZA = data;
    });
  }

  int antre = 1;

 @override
  void initState() {
    super.initState();
    _refreshJournals1();
    print('$adokterZA manokkk1');
 // Loading the diary when the app starts
  }
  

  Future<void> _addItem() async {
    await DataAntrian.createItem(
        users[0]['username'],
        database1[index2]['nama'],
         database1[index2]['spesialis'],
         jam,
         bpjs,
        database1[index2]['noAntrian1'] + 1,
        _keluhan.text);
    _refreshJournals1();
  }

  Future<void> _addItem1() async {
    await DataAntrian.createItem(
        users[0]['username'],
        database1[index2]['nama'],
         database1[index2]['spesialis'],
         jam,
         bpjs,
        database1[index2]['noAntrian2'] + 1,
        _keluhan.text);
    _refreshJournals1();
  }

  Future<void> _updateAntrian1(String nama) async {
    await DataDokter.updateAntrian(
        nama,
         database1[index2]['spesialis'],
          database1[index2]['jw1'], 
          database1[index2]['jw2'],
          antrian1.length,
          antrian2.length,
          database1[index2]['noAntrian1'] + 1,
          database1[index2]['noAntrian2']);
    
    _refreshJournals1();
  }

  Future<void> _updateAntrian2(String nama) async {
    await DataDokter.updateAntrian(
        nama,
         database1[index2]['spesialis'],
          database1[index2]['jw1'], 
          database1[index2]['jw2'],
          antrian1.length,
          antrian2.length,
          database1[index2]['noAntrian1'],
         database1[index2]['noAntrian2'] + 1);
    
    _refreshJournals1();
  }


  Future<void> _updatebook(String nama) async {
    await DataPasien.updateBook(
        nama,
         users[0]['password'],
         users[0]['bpjs'],
        1,
        users[0]['email'], 
         users[0]['no_telepon']);
    _refreshJournals1();
  }

  
  konfirmasi_booking(BuildContext context) {


  Widget cancelButton = Container(
                    height: 36,
                    width: 110,
                    child: TextButton(
                        style: TextButton.styleFrom( 
                        alignment: Alignment.center,
                        ),
                        onPressed: () {Navigator.pop(context,false); },
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

if (book == 1) {
                           setState(() {
                             kataPenuh = 'Cuma sekali bisa booking';
                              Future.delayed(const Duration(milliseconds: 2000), () {

   setState(() {
     kataPenuh = "";
       
   });
});
                           });
                           //kataPenuh = 'Cuma sekali bisa booking';
                         }else{

                          if (antre == 0)  {
                            if (antrian1.length == 0){
                             Navigator.pop(context);
                              setState(() { kataPenuh = "Antrian penuh,balek besok boss!";
                                Future.delayed(const Duration(milliseconds: 2000), () {

   setState(() {
     kataPenuh = "";
       Future.delayed(const Duration(milliseconds: 2000), () {

 
      
});
   });
});
                              });
                            } 
                            else{
                              //no1 += 1;
                              print("ini urut $no1");
                              print('jadwal 1');
                              _updatebook(users[0]['username']);
                              _addItem();
                            print("ini 0");
                            antrian1.removeAt(0);
                            _updateAntrian1(dokterZA[index2]['nama']);
                            _refreshJournals1();
                            print('antrenya adalahhhh');
                            
                            
                            print(antrian1.length);
                            book = 1;
                            //Navigator.pop(context);
                            Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Info()));
                             } }

                          if (antre == 1){
                            if (antrian2.length == 0){
                              Navigator.pop(context);
                               setState(() { kataPenuh = "Antrian penuh,balek besok boss!";
                                Future.delayed(const Duration(milliseconds: 2000), () {

   setState(() {
     kataPenuh = "";

   });
});
                              });}
                            
                            else {
                              //no2 += 1;
                            print("ini 0");
                            _updatebook(users[0]['username']);
                            _addItem1();
                            antrian2.removeAt(0);
                            _updateAntrian2(dokterZA[index2]['nama']);
                            _refreshJournals1();
                            
                            print(antrian1.length);
                            book = 1;
                            //Navigator.pop(context);
                            Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Info()));
                             } 
                          }
                          print("keluhan $antre");
                        }

 
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
  AlertDialog alert1 = AlertDialog(
    title: Text("Konfirmasi"),
    content: Text("Booking dokter ini?"),
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
      return alert1;
    },
  );
}
 

  String kataPenuh = "";
  
  List lis2 =[database1[index2]['jw1'],database1[index2]['jw2']];
  var antrian1 = new List<int>.generate(database1[index2]["antrian1"], (i) => i + 1);
  var antrian2 = new List<int>.generate(database1[index2]["antrian2"], (i) => i + 1);

  String namaTes = "admin";


  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
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
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 110, 15),
                   child: Transform.scale(
                    scale: 1.4,
                    child:IconButton(
                    //iconSize: 50,
                    icon: Image.asset('assets/images/back.png'),
                    onPressed: () {Navigator.pop(context);},   
                    ),
                  ), ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                   child: Image.asset('assets/images/pilihdokter.png'),
                  ),
                ],
              ),
              Foto(database1,index2),
              Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Container(
        height: 405,
        width: 370,
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          
                    Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Text('Jadwal berobat',style: TextStyle(
                            fontWeight: FontWeight.bold),
                  ),
                                      ),
                                      ToggleSwitch(
                      minWidth: 90.0,
                      minHeight: 45,
                      initialLabelIndex: 1,

                      cornerRadius: 5.0,
                      customWidths: [155, 155.0],
                      activeBgColor: [Colors.green],
                      activeFgColor: Colors.black,
                      inactiveBgColor: Colors.white,
                      inactiveFgColor: Colors.grey[900],
                      totalSwitches: 2,
                      labels: [dokterZA[index2]['jw1'],dokterZA[index2]['jw2']],
                      iconSize: 30.0,
                      borderWidth: 2.0,
                      borderColor: [Colors.green],

                      onToggle: (index) {
                        print('switched to: $index');
                         int square(index) {
  assert(index != null); // for debugging
  if (index == null) throw Exception();
  return index;
}
var a = square(index);
print(a);
print(lis2[a]);
jam = lis2[a];
antre = a;
                      },
                    ),
                    Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Text('Pembayaran',style: TextStyle(
                            fontWeight: FontWeight.bold),
                  ),
                                      ),
                                      ToggleSwitch(
                      minWidth: 90.0,
                      minHeight: 45,
                      initialLabelIndex: 1,
                      customWidths: [155, 155],
                      cornerRadius: 5.0,
                      activeBgColor: [Colors.green],
                      activeFgColor: Colors.black,
                      inactiveBgColor: Colors.white,
                      inactiveFgColor: Colors.grey[900],
                      totalSwitches: 2,
                      labels: ['BPJS', 'Non BPJS'],
                      borderWidth: 2.0,
                      borderColor: [Colors.green],
                      
                      onToggle: (index) {
                        print('switched to: $index');
                         int square(index) {
  assert(index != null); // for debugging
  if (index == null) throw Exception();
  return index;
}
var a = square(index);
print(a);
print(lis3[a]);
bpjs = lis3[a];
                      },
                    ),
                    Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Text('Keluhan',style: TextStyle(
                            fontWeight: FontWeight.bold),
                  ),
                                      ),
                    SizedBox(
                    height: 115,
                    width: 320,
                    child:
                    TextField(
                      controller: _keluhan,
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      
                      decoration: InputDecoration( 
                        enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2.0),
                        borderRadius: const BorderRadius.all(Radius.circular(5.0),)
                        ),
                         hintText: "isi keluhan",
                         focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.redAccent),
                            borderRadius: const BorderRadius.all(Radius.circular(5.0),
                         )
                      ),
                    ),)),
                Padding(
                                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                child:   
                Container(
                    height: 36,
                    width: 310,
                    child: TextButton(
                        style: TextButton.styleFrom( 
                        alignment: Alignment.center,
                        ),
                        onPressed: () async { 
                          konfirmasi_booking(context);
                         
                        },
                        child: Text(
                          "Mendaftar",
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
                    ),
          SizedBox(height: 20,),
                    
          Text(kataPenuh, style: TextStyle(fontSize: 20,color: Colors.red),)],
        ),
        decoration: BoxDecoration(
           border: Border.all(color: Color(0xff4EC72D),width: 2.0),
           borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      )
      ),
      
    
            ],
          )
        
      )
    )
    ));
  }
}






















import 'package:flutter/material.dart';
import 'package:rpl/admin/admin_class.dart';
import 'package:rpl/database/data_fix.dart';
import 'package:rpl/layar/booking.dart';
import 'package:rpl/layar/class_utama.dart';
import 'package:rpl/layar/halaman_login.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'package:rpl/layar/infor.dart';
import 'package:rpl/main.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'dart:math';
import 'package:rpl/admin/data_variable.dart';

List<Map<String, dynamic>> dataUser = [];



class Info extends StatefulWidget {


  const Info({Key? key}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();

}
class _InfoState extends State<Info> {
  
  bool _loading = true;
  int _selectedIndex = 2;
  late int index5; 
  
  void _refreshJournals1() async {
 
    final data = await DataAntrian.getItemNama(pengguna);
    setState(() {
      dataUser= data;
    });
  }



  @override
  void initState() {
    super.initState();
    _refreshJournals1();
     Future.delayed(const Duration(milliseconds: 2000), () {
       setState(() {
         _loading = false;
       });
    //_loading = false;
    print('$dataUser manokkk111');

   });
  }

  Future<void> _updatebook(String nama) async {
    var user;
    await DataPasien.updateBook(
        nama,
         users[0]['password'],
         users[0]['bpjs'],
        0,
        users[0]['email'], 
         users[0]['no_telepon']);
    _refreshJournals1();
  }


  void _deleteItem(int id) async {
    await DataAntrian.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Antrian Telah di panggil'),
    ));
   _refreshJournals1();
  }

  void _refreshJournals9(String data9) async {
 
    final data = await DataPasien.getItemNama("$data9");
      setState(() {
        users = data;
      });
     
   
  }

  
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
  

konfirmasi_batal(BuildContext context) {

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
                          setState(() {
                          _loading = true;
                          _updatebook(users[0]['username']);
                          _deleteItem(dataUser[index5]['id']);
                          _refreshJournals9(users[0]['username']);
                          Future.delayed(const Duration(milliseconds: 2000), () {
                            book = users[0]['book'];
                          });
                        
                        
                        });
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Infor()),
                        );


                        
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
    content: Text("Batalkan Antrean?"),
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
          
          _loading
          ? Center(child: 
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
          
          ))]))
          :Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 120, 15),
                   child: Transform.scale(
                    scale: 1.4,
                    child:IconButton(
                    //iconSize: 50,
                    icon: Image.asset('assets/images/back.png'),
                    onPressed: () {
                      print("ini " + dataUser[0]['namap'].toString() + "ini");
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Utama()),
                        );

                        },   
                    ),
                  ),),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                   child: Image.asset('assets/images/info.png'),
                  ),
                ],
              ),
              //Foto(),
              Expanded(child:
              Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Container(
        height: 405,
        width: 370,
        child: 

        ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
            padding: EdgeInsets.fromLTRB(10, 15, 0, 10),
            child: Image.asset('assets/images/jadwal.png'),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Row(
                                  children: [
                                    Text('Dokter : '),
                                    Text(dataUser[index]['namad'],
                                    style: TextStyle(
                            color: Color(0xff4EC72D),
                         ),)])
                                      ),
                                      
                    Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Row(
                                  children: [
                                    Text('Pasien : '),
                                    Text(dataUser[index]["namap"],
                                    style: TextStyle(
                            color: Color(0xff4EC72D),
                         ),)])),
                         Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Row(
                                  children: [
                                    Text('Jadwal : '),
                                    Text(dataUser[index]["jw"],
                                    style: TextStyle(
                            color: Color(0xff4EC72D),
                         ),)])
                                      ),
                                      Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Row(
                                  children: [
                                    Text('Pembayaran : '),
                                    Text(dataUser[index]["pb"],
                                    style: TextStyle(
                            color: Color(0xff4EC72D),
                         ),)])),
                         Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Row(
                                  children: [
                                    Text('Keluhan : '),
                                    Text(dataUser[index]["keluhan"],
                                    style: TextStyle(
                            color: Color(0xff4EC72D),
                         ),)])),
                                      
                   ]
                                      ),
                    Center(
                      child: 
                      Padding(
      padding: EdgeInsets.fromLTRB(0, 17, 0, 10),
      child: Container(
       
        height: 170,
        width: 170,
        child: 
        Column(
     
          children: [
            Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text('Antrean'), ),
            Padding(
            padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
              Text('No. ',              
            style: 
            TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 40,
            fontWeight: FontWeight.bold
                         ),),
                                    Text(dataUser[index]["no_antrian"].toString(),
                                    style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                            
                            
                         ),)])
            
            
    
             ) )

        ]),
        
        
        decoration: BoxDecoration(
          
           border: Border.all(color: Color(0xff4EC72D),width: 2.0),
           borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: Color(0xffEBF1FA),
        
        
      ),
    )),),
    Center(
      child: 
    
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
                        onPressed: () {
                          setState(() {
                            index5 = index;
                          });
                          //index5 = index;

                          konfirmasi_batal(context);
  
                        },
                        child: Text(
                          "Batal",
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
                    ))
                    
          ],
        ),

                    ),
        decoration: BoxDecoration(
           border: Border.all(color: Color(0xff4EC72D),width: 2.0),
           borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      )
      ),)
      
    
            ],
          )
        
      )
    )
    );
  }
}






















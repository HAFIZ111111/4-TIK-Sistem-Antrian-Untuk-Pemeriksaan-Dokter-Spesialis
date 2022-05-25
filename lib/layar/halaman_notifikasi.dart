import 'package:flutter/material.dart';
import 'package:rpl/database/data_fix.dart';
import 'package:rpl/layar/booking.dart';
import 'package:rpl/layar/class_pilih_dokter.dart';
import 'package:rpl/layar/halaman_login.dart';
import 'package:rpl/layar/halaman_utama.dart';
import 'package:rpl/layar/informasi.dart';

List<Map<String, dynamic>> notifikasi = [];

class Dokter_favorit extends StatefulWidget {
  const Dokter_favorit({Key? key}) : super(key: key);

  @override
  State<Dokter_favorit> createState() => _Dokter_favorit();
}

class _Dokter_favorit extends State<Dokter_favorit> {

  
  
  void _refreshJournals1(String data9) async {
 
    final data = await DataNotif.getItemNama("$data9");
      setState(() {
        notifikasi = data;
      });
     
   
  }
  
  void _deleteItem(int id) async {
    await DataNotif.deleteItem(id);
   _refreshJournals1(users[0]['username']);
  }


  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  

  @override
  void initState() {
    //book = users[0]['book'];
    super.initState();
    _refreshJournals1(users[0]['username']);
 
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
          top: true,
          child: Scaffold(
   
    
    
    body:
    SingleChildScrollView(
      child:
    Center(
      child:
    Column(
      children: [
        Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 8, 100, 15),
                        child: Transform.scale(
                          scale: 1.4,
                          child: IconButton(
                            //iconSize: 50,
                            icon: Image.asset('assets/images/back.png'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Utama()),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Image.asset('assets/images/notif.png'),
                      ),
                    ],
                  ),
        SizedBox(height: 10,),
        
        Container(
          width: 380,
          height: 560,
         

          child:
 ListView.builder(
              itemCount: notifikasi.length,
              itemBuilder: (context, index) => Center(
        child: 
Container(
  padding: EdgeInsets.all(5),
  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          width: 380,
        
          child:
          IntrinsicHeight(
            child:
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
            alignment: Alignment.center,        
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
          
           border: Border.all(color: Color(0xff4EC72D),width: 2),
           borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
              child: Text(notifikasi[index]['no_antrian'].toString(),style: TextStyle(
                fontSize: 50,
              ),)),
          Expanded(
            child:
          Container(
            //color: Colors.amber,
            padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          Text("Antrian anda di panggil!",style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.green,),),
          SizedBox(height: 5,),
          Text("Jadwal : " + notifikasi[index]['jw'],style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.green,),),
          SizedBox(height: 5,),
          Text("Dokter: " + notifikasi[index]['pb'],style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.green,),),
  
          ]) )
        ),
        
                          IconButton(
                            icon: const Icon(Icons.delete,color: Colors.red,size: 40,),
                            onPressed: () {
                             
   _deleteItem(notifikasi[index]['id']);
   print(notifikasi);
                          })

        

    ])),decoration: BoxDecoration(
           border: Border.all(color: Color(0xff4EC72D),width: 2),
           borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Color.fromARGB(255, 255, 255, 255),
        
        
      ),
        
        ))
                    ))])))));}
}

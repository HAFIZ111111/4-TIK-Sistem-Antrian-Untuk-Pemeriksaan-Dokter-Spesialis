import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpl/admin/admin_class.dart';
import 'package:rpl/layar/bonus.dart';
import 'package:rpl/layar/booking.dart';
import 'package:rpl/layar/class_pilih_dokter.dart';
import 'package:rpl/layar/pilih_dokter.dart';
import 'package:rpl/main.dart';


String pengguna = '';
int kode2 = 0;

class Orang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                child:  
                                Material(
  elevation: 10,
  borderRadius: BorderRadius.all(Radius.circular(10)),
  child: 
                Container(
                    height: 180,
                    width: 133,
                    child: TextButton(
                        style: TextButton.styleFrom( 
                        alignment: Alignment.center,
                        ),
                        onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Booking()),
                        );
                        
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                    width: 143,
                              child:
                            Image.asset('assets/images/foto.png'),
                            decoration: BoxDecoration(
                      
                      //border: Border.all(color: Color(0xff4EC72D)),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    )),
                        Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),),  
                        
                        Text(
                          "dr. Ihsan",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                         ),),
                         Text(
                          "Spesialis Jantung",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                        
 
                          ),
                ),
                         ])
                ),
                    decoration: BoxDecoration(
                      
                      //border: Border.all(color: Color(0xff4EC72D)),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color(0xffEBF1FA),
                    )
                    ),
                    ));
                  }
                  }




final List<Widget> teratas = [
  Orang(),
  Orang(),
  Orang(),
  Orang(),
  Orang(),
  Orang(),
  Orang(),
  Orang(),
];





class Spesialis1 extends StatefulWidget {
  
  
  const Spesialis1({Key? key }) : super(key: key);
  @override
  State<Spesialis1> createState() => _Spesialis1State();
}
class _Spesialis1State extends State<Spesialis1> {
  
 
  


  spesialis1(String spesialis,
  String dok,String gambar,
  Color warna1,
  Color warna2,
  int kode,
  int nilai,
  int banyakDokter,) {
    return Center(
      child:
      Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                child:  
                Container(
                  height: 180,
                  width: 133,
  
                    
                  child: 
    
                Container(
                    
                    child: TextButton(
                        style: TextButton.styleFrom( 
                        alignment: Alignment.center,
                        ),
                        onPressed: () {
                      
                          value = kode;
                          kode2 = nilai;
                          //pilih_dokter.jumpToPage(nilai);
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dokter()),
                        );
                        b = nilai -1;
                        //pilih_dokter.jumpToPage(nilai);
                        //Apploen.bim.currentState._tabController.animateTo(1);
                        
                        },
                        child: Center(
                          child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/$gambar.png'),
                          
                        
                        Text(
                          "Spesialis",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                         ),),
                         Text(
                          "$spesialis",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                        
 
                          ),
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment : MainAxisAlignment.center,
                  children: [
                    //SizedBox(height: 40,),

                    Text(
                          "$banyakDokter ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                        
 
                          ),),
               
                Text(
                          "$dok",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                        
 
                          ),)
                ,])
                         ])
                )),
                    decoration: BoxDecoration(
                      
                      //border: Border.all(color: Color(0xff4EC72D)),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color(0xffFF5978),
                    boxShadow: [
      BoxShadow(
        color: Colors.grey,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(4, 4)
        ),],
                    
                    gradient:LinearGradient(
            colors: [
            warna1,
            warna2
            //Colors.red,
            //Colors.redAccent
            //add more colors for gradient
            ],
            begin: Alignment.topLeft, //begin of the gradient color
            end: Alignment.bottomRight, //end of the gradient color
            stops: [0.5, 0.8] //stops for individual color
            //set the stops number equal to numbers of color
        ),

                    )
                    ),
                    )));
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child:
                  Container(
                      height:200,
                      width: 370,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          //shrinkWrap: true,
                          children: [
                            spesialis1("Jantung","Dokter","hati",Colors.red,Colors.redAccent,1,2,jantung.length,),
  spesialis1("Gigi","Dokter","gigi",Colors.blue,Colors.blueAccent,2,3,gigi.length),
  spesialis1("Mata","Dokter","mata",Colors.orange,Colors.orangeAccent,3,4,mata.length),
  spesialis1("Kejiwaan","Dokter","otak",Colors.red,Colors.redAccent,4,5,otak.length,),
  spesialis1("Kelamin","Dokter","kelamin",Colors.blue,Colors.blueAccent,5,6,kelamin.length),
  spesialis1("Anak","Dokter","anak",Colors.orange,Colors.orangeAccent,6,7,anak.length),
  spesialis1("Saraf","Dokter","saraf",Colors.red,Colors.redAccent,7,8,saraf.length),
  spesialis1("THT","Dokter","mulut",Colors.blue,Colors.blueAccent,8,9,mulut.length),]
    )));
  }
}












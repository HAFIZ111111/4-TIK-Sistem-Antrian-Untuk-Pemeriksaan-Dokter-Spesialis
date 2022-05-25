import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpl/layar/booking.dart';
import 'package:rpl/layar/halaman_login.dart';
import 'package:rpl/layar/halaman_utama.dart';

class Foto extends StatelessWidget {

  Foto(this.database1,this.index);

  final List database1;
  final int index;

  
  @override
  Widget build(BuildContext context) {
    return Center(
        child: 
Container(
  padding: EdgeInsets.all(5),
  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          width: 370,
        
          child:
          IntrinsicHeight(
            child:
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Expanded(child:
          Container(        
            width: 80,
            decoration: BoxDecoration(
           border: Border.all(color: Color(0xff4EC72D),width: 2),
           borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Color.fromARGB(255, 255, 255, 255),),
              child: Icon(Icons.person,size: 80,color: Colors.green,),),),
              SizedBox(width: 10,),
          Expanded(
            child:
          Container(
            //color: Colors.amber,
            padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          Text(database1[index]['nama'],style: TextStyle(fontWeight: FontWeight.bold,
          color: Colors.black,),),
          SizedBox(height: 10,),
          Text("Spesialis " + database1[index]['spesialis'],style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.black,),),

          
 

          ]) )
        ),
        
      Container(
        alignment: Alignment.center,
            //width: 80,
            decoration: BoxDecoration(
           border: Border.all(color: Color(0xff4EC72D),width: 2),
           borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Color.fromARGB(255, 255, 255, 255),),
              child: IconButton(
                                  padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                    color: Colors.green,
                    iconSize: 60,
                    onPressed: () {},
                  ),), 

    ])),decoration: BoxDecoration(
           border: Border.all(color: Color(0xff4EC72D),width: 2),
           borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Color.fromARGB(255, 255, 255, 255),
        
        
      ),
        
        ));
  }
}





int value = 0;
class Semua extends StatefulWidget {
  
  
  const Semua({Key? key }) : super(key: key);
  @override
  State<Semua> createState() => _SemuaState();
}
/// This is the private State class that goes with MyStatefulWidget.
class _SemuaState extends State<Semua> {
  
  //int value = 0;
  Widget CustomRadioButton(String text, int index, int halaman) {
    return Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                   child: 
                   Container(
        height: 31,
        width: 75,
        child: Center(child: TextButton(
          
          
                        style: TextButton.styleFrom( 
                        alignment: Alignment.center,
                        ),
                        onPressed: () {
                          
                          setState(() {
                         

                            print(index);
                          value = index;
                          print(value);
                          });

                  
                        },
                        child: Text(
                          "$text",
                          style: TextStyle(
                            color: Color(0xff000000),
                            
                          ),
                ),
                ),),
        decoration: BoxDecoration(
           color: (value == index) ? Colors.green : Color(0xffEBF1FA),
           border: Border.all(color: Color(0xff4EC72D)),
           borderRadius: BorderRadius.all(Radius.circular(20.0)),
        

      ),
    )
                  );
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                      height: 35,
                      width: 370,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            CustomRadioButton("Semua", 9, 0),
        CustomRadioButton("Jantung", 1, 1,),
        CustomRadioButton("Gigi", 2,2),
        CustomRadioButton("Mata", 3, 3),
        CustomRadioButton("Kejiwaan", 4,4),
        CustomRadioButton("Kelamin", 5, 5),
        CustomRadioButton("Anak", 6,6),
        CustomRadioButton("Saraf", 7, 7),
        CustomRadioButton("Mulut", 8,9),

      ],
    ));
  }
}

int hal = 0;




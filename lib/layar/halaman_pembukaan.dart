import 'package:flutter/material.dart';
import 'package:rpl/layar/halaman_daftar.dart';

class Pembukaan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          
          body:  Column(
              children: <Widget>[
                Padding(
                padding: EdgeInsets.all(16.0)),
                Image.asset('assets/images/cover.png', scale: 0.5,height: 100,),
                Padding(
                padding: EdgeInsets.all(50.0)),
                Image.asset('assets/images/logoawal2.png', scale: 0.5,height: 100,),
                Padding(
                padding: EdgeInsets.all(72.0)),
                Image.asset('assets/images/logoawal3.png'),
                Padding(
                padding: EdgeInsets.all(5.0)),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0)),
                  ),
                  //color: Colors.green,
                  alignment: Alignment.center,
                  child:Container(
                    height: 60,
                    width: 340,
                    child: TextButton(
                        style: TextButton.styleFrom( 
                        alignment: Alignment.center,
                        ),
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Halaman_daftar()),
                        );
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: Color(0xff000000),
                            
                          ),
                ),
                ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4EC72D)),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    color: Color(0xffEBF1FA),
                    )
                    ),
                )   
            ]
          )
      ),
    );
  }
}
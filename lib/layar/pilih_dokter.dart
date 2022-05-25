import 'package:flutter/material.dart';
import 'package:rpl/admin/admin_class.dart';
import 'package:rpl/database/data_fix.dart';
import 'package:rpl/layar/booking.dart';
import 'package:rpl/layar/halaman_utama.dart';
int b = 0;
class Dokter extends StatefulWidget {
  const Dokter({Key? key}) : super(key: key);
  @override
  _Dokter  createState() => _Dokter();
}



class _Dokter  extends State<Dokter> with SingleTickerProviderStateMixin {
  late TabController _tabController;

void _refreshJournals1() async {
    final jantung1 = await DataDokter.getItemSpesialis("Jantung");
    final gigi1 = await DataDokter.getItemSpesialis("Gigi");
    final mata1 = await DataDokter.getItemSpesialis("Mata");
    final otak1 = await DataDokter.getItemSpesialis("Kejiwaan");
    final kelamin1 = await DataDokter.getItemSpesialis("Kelamin");
    final anak1 = await DataDokter.getItemSpesialis("Anak");
    final saraf1 = await DataDokter.getItemSpesialis("Saraf");
    final mulut1 = await DataDokter.getItemSpesialis("THT");
    final data = await DataDokter.getItems();
    setState(() {
      dokterZA = data;
      jantung = jantung1;
      gigi = gigi1;
      mata = mata1;
      otak = otak1;
      kelamin = kelamin1;
      anak = anak1;
      saraf = saraf1;
      mulut = mulut1;
    });
  }


  @override
  void initState() {
    _tabController = new TabController(length: 9, vsync: this,initialIndex: b);
    super.initState();
  }

  

  void _runFilter(String enteredKeyword,  List<Map<String, dynamic>> dokter) {

    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      _refreshJournals1();
      // if the search field is empty or only contains white-space, we'll display all users
      results = dokter;
    } else {
      results = dokter
          .where((user) =>
              user["nama"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      jantung = results;
      dokterZA = results;
      gigi = results;
      mata = results;
      kelamin = results;
      anak = results;
      otak = results;
      saraf = results;
      mulut = results;
 

  });
}
  

  dokterza(List dokter) {
    return ListView.builder(
              itemCount: dokter.length,
              itemBuilder: (context, index) => Center(
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
          
          Container(        
            width: 120,
            decoration: BoxDecoration(
           border: Border.all(color: Color(0xff4EC72D),width: 2),
           borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Color.fromARGB(255, 255, 255, 255),),
              child: Icon(Icons.person,size: 80,color: Colors.green,),),
              SizedBox(width: 10,),
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
          Text(dokter[index]['nama'],style: TextStyle(fontWeight: FontWeight.bold,
          color: Colors.black,),),
          SizedBox(height: 10,),
          Text("Spesialis " + dokter[index]['spesialis'],style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.black,),),
          Text(dokter[index]['jw1'],style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.black,),),
          Text(dokter[index]['jw2'],style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.black,),),
      
          SizedBox(height: 10,),
          Text("Antrian Tersedia: " + "(" + dokter[index]['antrian1'].toString() +","+ dokter[index]['antrian2'].toString() + ")",style: TextStyle(fontWeight: FontWeight.w500,
          color: Colors.green,),),
          

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
                    onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Booking()),
                        );
                        database1 = dokter;
                        index2 = index;},
                  ),), 

    ])),decoration: BoxDecoration(
           border: Border.all(color: Color(0xff4EC72D),width: 2),
           borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Color.fromARGB(255, 255, 255, 255),
        
        
      ),
        
        ))
                    );
                    
                    }




  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp(
     home: SafeArea(
          child: Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
          
            
     
          body:  
 Column(
        children: [Row(
                children: [
                  
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 110, 20),
                   child: Transform.scale(
                    scale: 1.4,
                    child:IconButton(
                    //iconSize: 50,
                    icon: Image.asset('assets/images/back.png'),
                    onPressed: () {
                      Navigator.pop(context);
                    },   
                    ),
                  ),),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                   child: Image.asset('assets/images/pilihdokter.png'),
                  ),
                  
                ],
              ),
              SizedBox(
                width: 380,
                 height: 40,
                child: 
            TextField(
                 onChanged: (value){_runFilter(value,dokterZA);
                 },
          
                    decoration: InputDecoration(
                       suffixIcon: Icon(Icons.search,color: Colors.green,),
                    contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                //labelText: 'Enter something',
               // labelText: "Nama Dokter",
                hintText: "Cari Dokter",
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.green,
                ),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.amber),
                  borderRadius: BorderRadius.circular(20),
                ))
                
                ),),
                    SizedBox(height: 10,),
            PreferredSize(
            preferredSize: Size(200.0, 200.0),
            child:  Container(
              width: 380,
              height: 35,
              child:
            TabBar(
              isScrollable: true,
              indicator: BoxDecoration(
                //border: Border.all(color: Color(0xff4EC72D)),
                borderRadius: BorderRadius.circular(20), // Creates border
    color: Colors.green, 
),
              unselectedLabelColor: Colors.black,
              labelColor: Colors.white,
              tabs: [
                Tab(
                  text: 'Semua',
                ),
                Tab(
                  text: 'Jantung',
                ),
                Tab(
                  text: 'Gigi',
                ),
                Tab(
                  text: 'Mata',
                ),
                Tab(
                  text: 'Kejiwaan',
                ),
                Tab(
                  text: 'Kelamin',
                ),
                Tab(
                  text: 'Anak',
                ),
                Tab(
                  text: 'Saraf',
                ),
                Tab(
                  text: 'THT',
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),)),
            SizedBox(height: 10,),
            Expanded(
              child: TabBarView(
                children: [
                  dokterza(dokterZA),
                  dokterza(jantung),
                  dokterza(gigi),
                  dokterza(mata),
                  dokterza(otak),
                  dokterza(kelamin),
                  dokterza(anak),
                  dokterza(saraf),
                  dokterza(mulut),
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      
          )));
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
import 'package:flutter/material.dart';

class WellComePage extends StatefulWidget {
  const WellComePage({super.key});

  @override
  State<WellComePage> createState() => _WellComePageState();
}

class _WellComePageState extends State<WellComePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WellCome Page',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Well Come you Are \nSuccessfully Login...',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w700,fontSize: 30),),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.celebration,color: Colors.blue,size: 55,),
                Icon(Icons.celebration,color: Colors.blue,size: 55,),
                Icon(Icons.celebration,color: Colors.blue,size: 55,),
              ],
            )


          ],
        ),
      ),
    );
  }
}

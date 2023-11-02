import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

import 'details_db.dart';


class FormScreenPage extends StatefulWidget {
  const FormScreenPage({super.key});

  @override
  State<FormScreenPage> createState() => _FormScreenPageState();
}

class _FormScreenPageState extends State<FormScreenPage> {
  
  TextEditingController _nameController = TextEditingController();

  // var config = Configuration.local([DetailsModel.schema]);

  @override
  Widget build(BuildContext context) {
    Realm realm;
    return Scaffold(
      appBar: AppBar(title: Text('Realm Database Demo'),),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child:Column(
          children: [
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Name"
              ),
              controller: _nameController,
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  var config = Configuration.local([DetailsModel.schema]);
                   realm = Realm(config);
                  realm.all<DetailsModel>().changes.listen((event) {
                    print('object');
                  });
                  Future.delayed(Duration(seconds: 1));
                  var detailsModel = DetailsModel('name');
                  realm.write((){
                    detailsModel.name = _nameController.text;
                    realm.add(detailsModel);
                  });

                  }, 
                child: Text('Add Data',style: TextStyle(color: Colors.white),)),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  var config = Configuration.local([DetailsModel.schema]);
                   realm = Realm(config);
                  print("Getting all cars from the Realm.");
                  RealmResults<DetailsModel> detailsList = realm.all<DetailsModel>();
                  print("Total numbers : ${detailsList.length}");
                  for(int i=0;i<detailsList.length;i++){
                    print("Name : ${detailsList[i].name}");
                  }
                },
                child: Text('Get All Data',style: TextStyle(color: Colors.white),)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:realmdatabase/model/signup_model.dart';
import 'package:realmdatabase/pages/signUp_page.dart';
import 'package:realmdatabase/pages/wellcome_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text('Login now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 16),),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black12,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 350,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      spreadRadius: 4,
                      offset: Offset(0, 6),
                    ),
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      spreadRadius: 4,
                      offset: Offset(6, 0),
                    )
                  ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  Container(
                    width: double.infinity,
                    height: 55,
                    // alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.account_circle_outlined,color: Colors.white,size: 25,),
                        SizedBox(width: 20,),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            controller: _nameController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter Name',
                                hintStyle: TextStyle(color: Colors.white)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: double.infinity,
                    height: 55,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.remove_red_eye_outlined,color: Colors.white,size: 25,),
                        SizedBox(width: 20,),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            controller: _passwordController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter Password',
                                hintStyle: TextStyle(color: Colors.white)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  SizedBox(
                    width: 200,
                    height: 55,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        onPressed: (){
                          checkCondition(_nameController.text, _passwordController.text);
                        },
                        child: Text('Login')),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 15,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('User is not Exits then ? '),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUPPage()));
                    },
                    child: Text('Sign Up',style: TextStyle(color: Colors.blue)),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  void checkCondition(String userEnterName,String passwordEnter) {
    Realm realm;
    var config = Configuration.local([SignUpModel.schema]);
    realm = Realm(config);
    print("Getting all Users from the Realm.");
    RealmResults<SignUpModel> detailsList = realm.all<SignUpModel>();
    print("Total numbers : ${detailsList.length}");
    for(int i=0;i<detailsList.length;i++){
      print("Name : ${detailsList[i].userName}");
      print("Password : ${detailsList[i].password}");
      if(detailsList[i].userName == userEnterName && detailsList[i].password == passwordEnter){
        Navigator.push(context, MaterialPageRoute(builder: (context) => WellComePage()));
        print("Login Successfully...");
      }else if(detailsList[i].userName != userEnterName){
        print("User is Not Exits Please SignUp...");
      }else if(detailsList[i].password != passwordEnter){
        print("incorrect Password Please Enter Correct One...");
      }else{
        print("Something Went to wrong...");
      }
    }
  }
}

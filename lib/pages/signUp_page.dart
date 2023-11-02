import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:realmdatabase/model/signup_model.dart';
import 'package:realmdatabase/pages/login_page.dart';

class SignUPPage extends StatefulWidget {
  const SignUPPage({super.key});

  @override
  State<SignUPPage> createState() => _SignUPPageState();
}

class _SignUPPageState extends State<SignUPPage> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text('SingUp now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 16),),
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
                            controller: _passwordConfirmController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter Confirm Password',
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
                        checkCondition(_nameController.text, _passwordController.text, _passwordConfirmController.text);
                    },
                        child: Text('Submit')),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 15,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already Registered then '),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text('Login Now',style: TextStyle(color: Colors.blue),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  checkCondition(String userName,String password,String confirmPassword){
    Realm realm;
    if(userName.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty){
      if(password == confirmPassword){
        var config = Configuration.local([SignUpModel.schema]);
        realm = Realm(config);
        realm.all<SignUpModel>().changes.listen((event) {
          print('Entered Data Successful...');
          final snackBar = SnackBar(
            content: Text('SingUp  Successful...'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            width: 250,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
        Future.delayed(Duration(seconds: 1));
        var signUpModel = SignUpModel('userName', 'password');
        realm.write((){
          signUpModel.userName = userName.toString();
          signUpModel.password  = password.toString();
          realm.add(SignUpModel(signUpModel.userName , signUpModel.password));
        });
      }else{
          final snackBar = SnackBar(
            content: Text('Password is Not Match???'),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
            width: 250,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print('Password is Not Match???');
      }
    }else{
      final snackBar = SnackBar(
        content: Text('Please Fill All Details...'),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        width: 250,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('Please Fill All Details...');
    }
  }
}

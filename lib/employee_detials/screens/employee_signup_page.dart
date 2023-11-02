import 'package:flutter/material.dart';
import 'package:realmdatabase/employee_detials/constant/constants.dart';
import 'package:realmdatabase/employee_detials/my_widgets/my_text.dart';

class EmployeeSignUpPage extends StatefulWidget {
  const EmployeeSignUpPage({super.key});

  @override
  State<EmployeeSignUpPage> createState() => _EmployeeSignUpPageState();
}

class _EmployeeSignUpPageState extends State<EmployeeSignUpPage> {

  TextEditingController _userIdController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: MyText(text: 'Employee SignUp'),),
      body:  Container(
        width: width,
        height: height,
        child: Column(
          children: [
            Container(
              width: width,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  MyText(text: 'SignUp Now!',color: Colors.blue.shade900,fontSize: 40,),
                  SizedBox(height: 30,),
                  SizedBox(
                    width: width,
                    height: 60,
                    child: TextField(
                      style: TextStyle(color: Colors.blue.shade900,fontSize: 15),
                      controller: _userIdController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.5,color: Colors.blue.shade900),
                          ),
                          hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                          hintText: 'Enter User Id'
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: width,
                    height: 60,
                    child: TextField(
                      style: TextStyle(color: Colors.blue.shade900,fontSize: 15),
                      controller: _passwordController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.5,color: Colors.blue.shade900),
                          ),
                          hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                          hintText: 'Enter Password'
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: width,
                    height: 60,
                    child: TextField(
                      style: TextStyle(color: Colors.blue.shade900,fontSize: 15),
                      controller: _passwordConfirmController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1.5,color: Colors.blue.shade900),),
                          hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                          hintText: 'Enter Confirm Password'
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: 250,
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child:ElevatedButton(
                  onPressed: (){}, child: MyText(text: 'Login',fontSize: 15,)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeSignUpPage()));
                  },
                  child: MyText(text: 'Already Account Go to LogIn',color: Colors.blue.shade900,fontSize: 16,fontWeight: FontWeight.w500,),)
              ],
            )
          ],
        ),
      ),
    );
  }
}

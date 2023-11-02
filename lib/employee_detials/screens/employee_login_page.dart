import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:realmdatabase/employee_detials/models/employee_details_model.dart';
import 'package:realmdatabase/employee_detials/my_widgets/my_text.dart';
import 'package:realmdatabase/employee_detials/screens/employee_registration_page.dart';
import '../constant/constants.dart';
import 'employee_details_page.dart';

class EmployeeLoginPage extends StatefulWidget {
  const EmployeeLoginPage({super.key});

  @override
  State<EmployeeLoginPage> createState() => _EmployeeLoginPageState();
}

class _EmployeeLoginPageState extends State<EmployeeLoginPage> {


  @override
  Widget build(BuildContext context) {

    TextEditingController _userIdController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: MyText(text: 'Employee Login')),
      body: Container(
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
                  MyText(text: 'Login Now!',color: Colors.blue.shade900,fontSize: 40,),
                  SizedBox(height: 30,),
                  SizedBox(
                    width: width,
                    height: 60,
                    child: TextField(
                      style: TextStyle(color: Colors.blue.shade900,fontSize: 15),
                      controller: _userIdController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
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
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.5,color: Colors.blue.shade900),
                          ),
                          hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                          hintText: 'Enter Password'
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
                  onPressed: (){
                    getDataRealmDataBase(_userIdController.text, _passwordController.text);
                  }, child: MyText(text: 'Login',fontSize: 15,)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeRegistrationPage()));
                  },
                  child: MyText(text: 'Create Account Now',color: Colors.blue.shade900,fontSize: 16,fontWeight: FontWeight.w500,),)
              ],
            )
          ],
        ),
      ),
    );
  }

  void getDataRealmDataBase(String userName,String password){
    Realm realm;
    var config = Configuration.local([EmployeeDetailsModel.schema]);
    realm = Realm(config);
    RealmResults<EmployeeDetailsModel> employeeDetails = realm.all<EmployeeDetailsModel>();
    print('Total Number : ${employeeDetails.length}');
    if(userName.isNotEmpty && password.isNotEmpty){
      for(int i = 0;i<employeeDetails.length;i++){
        print("UserName : ${employeeDetails[i].firstName} ${employeeDetails[i].lastName}");
        print("Password : ${employeeDetails[i].password}");
        print("i : $i");
        if(employeeDetails[i].firstName == userName && employeeDetails[i].password == password){
          print("Login Successfully...");
          final snackBar = SnackBar(content: MyText(text: 'Login Successfully...',fontSize: 15,),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            width: 300,);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeDetailsPage(firstName: employeeDetails[i].firstName, lastName: employeeDetails[i].lastName, designation: employeeDetails[i].designation, dateOfBirth: employeeDetails[i].dateOfBirth, companyAddress: employeeDetails[i].companyAddress)));
        }else if(employeeDetails[i].firstName != userName){
          print("User is Not Exits Please SignUp...");
          // final snackBar = SnackBar(
          //   content: Text('User is Not Exits Please SignUp...'),
          //   backgroundColor: Colors.redAccent,
          //   behavior: SnackBarBehavior.floating,
          //   width: 300,
          // );
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }else if(employeeDetails[i].password != password){
          print("incorrect Password Please Enter Correct One...");
          // final snackBar = SnackBar(
          //   content: Text('incorrect Password Please Enter Correct One...'),
          //   backgroundColor: Colors.redAccent,
          //   behavior: SnackBarBehavior.floating,
          //   width: 300,
          // );
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          final snackBar = SnackBar(content: MyText(text: 'Password is not Match Please Enter Correct One... ',fontSize: 15,),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
            width: 300,);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    }
    else{
      final snackBar = SnackBar(
        content: Text('Enter Login Id and Password...'),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        width: 300,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realm/realm.dart';
import 'package:realmdatabase/employee_detials/models/employee_details_model.dart';
import 'package:realmdatabase/employee_detials/screens/employee_login_page.dart';

import '../constant/constants.dart';
import '../my_widgets/my_text.dart';
import 'employee_signup_page.dart';

class EmployeeRegistrationPage extends StatefulWidget {
  const EmployeeRegistrationPage({super.key});

  @override
  State<EmployeeRegistrationPage> createState() => _EmployeeRegistrationPageState();
}

class _EmployeeRegistrationPageState extends State<EmployeeRegistrationPage> {

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _designationController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();

  @override
  void initState() {
    _birthDateController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(title: MyText(text: 'Employee Registration'),),
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
                  MyText(text: 'Registration Now!',color: Colors.blue.shade900,fontSize: 40,),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      SizedBox(
                        width: 160,
                        height: 60,
                        child: TextField(
                          style: TextStyle(color: Colors.blue.shade900,fontSize: 15),
                          controller: _firstNameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1.5,color: Colors.blue.shade900),
                              ),
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                              hintText: 'Enter First Name',
                            labelText: "Enter First Name",
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      SizedBox(
                        width: 160,
                        height: 60,
                        child: TextField(
                          style: TextStyle(color: Colors.blue.shade900,fontSize: 15),
                          controller: _lastNameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1.5,color: Colors.blue.shade900),
                              ),
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                              hintText: 'Enter Last Name',
                            labelText: "Enter Last Name",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: width,
                    height: 60,
                    child: TextField(
                      style: TextStyle(color: Colors.blue.shade900,fontSize: 15),
                      controller: _designationController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(width: 1.5,color: Colors.blue.shade900),),
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                        hintText: 'Enter Designation',
                        labelText: "Enter Designation",
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: width,
                    height: 60,
                    child: TextField(
                      style: TextStyle(color: Colors.blue.shade900,fontSize: 15),
                      controller: _birthDateController,
                      readOnly: true,
                      decoration: InputDecoration(
                          // icon: Icon(Icons.calendar_today),
                          labelText: "Enter Date of Birth",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.5,color: Colors.blue.shade900),
                          ),
                          hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                          hintText: 'Enter Date of Birth'
                      ),
                      onTap: ()async{
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                        );
                        if(pickedDate != null){
                          print(pickedDate);
                          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate);
                          setState(() {
                            _birthDateController.text = formattedDate;
                          });
                        }else {
                          final snackBar = SnackBar(
                            content: Text('Date is not selected'),
                            backgroundColor: Colors.redAccent,
                            behavior: SnackBarBehavior.floating,
                            width: 250,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
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
                          border: OutlineInputBorder(borderSide: BorderSide(width: 1.5,color: Colors.blue.shade900),),
                          hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                          hintText: 'Enter Password',
                          labelText: 'Enter Password',
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
                          border: OutlineInputBorder(borderSide: BorderSide(width: 1.5,color: Colors.blue.shade900),),
                          hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                          hintText: 'Enter Confirm Password',
                          labelText: 'Enter Confirm Password'
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: width,
                    child: TextField(
                      style: TextStyle(color: Colors.blue.shade900,fontSize: 15),
                      controller: _addressController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 40.0,horizontal: 12),
                        border: OutlineInputBorder(borderSide: BorderSide(width: 1.5,color: Colors.blue.shade900),),
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                        hintText: 'Enter Company Address',
                        labelText: "Enter Company Address",
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
                    saveDataOnDatabase(_firstNameController.text, _lastNameController.text, _designationController.text,
                        _birthDateController.text, _passwordController.text, _passwordConfirmController.text, _addressController.text);
                  }, child: MyText(text: 'Submit',fontSize: 15,)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeLoginPage()));
                  },
                  child: MyText(text: 'Already Account Go to LogIn',color: Colors.blue.shade900,fontSize: 16,fontWeight: FontWeight.w500,),)
              ],
            )
          ],
        ),
      ),
    );
  }

  void saveDataOnDatabase(String firstName,String lastName,String designation,String dateOfBirth,String password,String confirmPassword,String companyAddress){
    Realm realm;
    if(firstName.isNotEmpty && lastName.isNotEmpty &&  designation.isNotEmpty && dateOfBirth.isNotEmpty && password.isNotEmpty &&
        confirmPassword.isNotEmpty && companyAddress.isNotEmpty){
      if(password == confirmPassword){
        var config = Configuration.local([EmployeeDetailsModel.schema]);
        realm = Realm(config);
        realm.all<EmployeeDetailsModel>().changes.listen((event) {
          final snackBar = SnackBar(
            content: MyText(text: 'Employee Details Submit Successfully...',fontSize: 15),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            width: 300,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
        var employeeModel = EmployeeDetailsModel('firstName', 'lastName', 'designation', 'dateOfBirth', 'password', 'confirmPassword', 'companyAddress');
        Future.delayed(Duration(seconds: 1));
        realm.write(() {
          employeeModel.firstName = firstName;
          employeeModel.lastName = lastName;
          employeeModel.designation = designation;
          employeeModel.dateOfBirth = dateOfBirth;
          employeeModel.password = password;
          employeeModel.confirmPassword = confirmPassword;
          employeeModel.companyAddress = companyAddress;
          realm.add(EmployeeDetailsModel(employeeModel.firstName, employeeModel.lastName, employeeModel.designation,
              employeeModel.dateOfBirth, employeeModel.password, employeeModel.confirmPassword, employeeModel.companyAddress));
          print('Employee Details Submit Success...');
          final snackBar = SnackBar(
            content: MyText(text: 'Employee Details Submit Successfully...',fontSize: 15),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            width: 300,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
        Navigator.push(context,MaterialPageRoute(builder: (context) => EmployeeLoginPage()));
        return ;
      }else{
        final snackBar = SnackBar(
          content: Text('Password is Not Match Please Enter Same Password...'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          width: 300,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print('Password is Not Match Please Enter Same Password...');
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

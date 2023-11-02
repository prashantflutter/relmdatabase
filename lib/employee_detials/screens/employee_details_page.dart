import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:realmdatabase/employee_detials/constant/constants.dart';
import 'package:realmdatabase/employee_detials/models/employee_details_model.dart';
import 'package:realmdatabase/employee_detials/my_widgets/my_TextField.dart';
import 'package:realmdatabase/employee_detials/my_widgets/my_text.dart';

class EmployeeDetailsPage extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String designation;
  final  String dateOfBirth;
  final String companyAddress;
  const EmployeeDetailsPage({super.key, required this.firstName, required this.lastName, required this.designation, required this.dateOfBirth, required this.companyAddress});

  @override
  State<EmployeeDetailsPage> createState() => _EmployeeDetailsPageState();
}

class _EmployeeDetailsPageState extends State<EmployeeDetailsPage> {

  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _designation = TextEditingController();
  TextEditingController _dateOfBirth = TextEditingController();
  TextEditingController _companyAddress = TextEditingController();

  @override
  void initState() {
    _firstName.text = widget.firstName.toString();
    _lastName.text = widget.lastName.toString();
    _dateOfBirth.text = widget.dateOfBirth.toString();
    _designation.text = widget.designation.toString();
    _companyAddress.text = widget.companyAddress.toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Realm realm;
    var config = Configuration.local([EmployeeDetailsModel.schema]);
    realm = Realm(config);


    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: MyText(text: 'Employee Details',),),
      body: Container(
        width: width,
        height: height,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 15,),
                  child: MyText(text: 'Employee Details : ',color: Colors.blue.shade900,fontSize: 18,)),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 170,
                      child: MyTextField(controller: _firstName,top_Padding: 40,labelText: 'Employee Name',hintText: '',textColor: Colors.blue.shade900,text_fontSize: 18,left_Padding: 15,)),
                  SizedBox( width: 150,child: MyTextField(controller: _lastName,top_Padding: 40, labelText: 'Employee Surname',hintText: '',textColor: Colors.blue.shade900,text_fontSize: 18,left_Padding: 15,)),
                ],
              ),
              SizedBox(height: 20,),
              MyTextField(controller: _designation,top_Padding: 40, labelText: 'Employee Designation',hintText: '',textColor: Colors.blue.shade900,text_fontSize: 18,left_Padding: 15,),
              SizedBox(height: 20,),
              MyTextField(controller: _dateOfBirth,top_Padding: 40, labelText: 'Employee Date Of Birth',hintText: '',textColor: Colors.blue.shade900,text_fontSize: 18,left_Padding: 15,),
              SizedBox(height: 20,),
              MyTextField(controller: _companyAddress,labelText: 'Employee Company Address', hintText: '',textColor: Colors.blue.shade900,
                text_fontSize: 20,left_Padding: 15,bottom_Padding: 100,),
            ],
          ),
        ),
      ),
    );
  }
}

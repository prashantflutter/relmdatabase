
import 'package:realm/realm.dart';
part 'employee_details_model.g.dart';
@RealmModel()
class _EmployeeDetailsModel {
 late String firstName;
 late String lastName;
 late String designation;
 late  String dateOfBirth;
 late String password;
 late String confirmPassword;
 late String companyAddress;
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_details_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class EmployeeDetailsModel extends _EmployeeDetailsModel
    with RealmEntity, RealmObjectBase, RealmObject {
  EmployeeDetailsModel(
    String firstName,
    String lastName,
    String designation,
    String dateOfBirth,
    String password,
    String confirmPassword,
    String companyAddress,
  ) {
    RealmObjectBase.set(this, 'firstName', firstName);
    RealmObjectBase.set(this, 'lastName', lastName);
    RealmObjectBase.set(this, 'designation', designation);
    RealmObjectBase.set(this, 'dateOfBirth', dateOfBirth);
    RealmObjectBase.set(this, 'password', password);
    RealmObjectBase.set(this, 'confirmPassword', confirmPassword);
    RealmObjectBase.set(this, 'companyAddress', companyAddress);
  }

  EmployeeDetailsModel._();

  @override
  String get firstName =>
      RealmObjectBase.get<String>(this, 'firstName') as String;
  @override
  set firstName(String value) => RealmObjectBase.set(this, 'firstName', value);

  @override
  String get lastName =>
      RealmObjectBase.get<String>(this, 'lastName') as String;
  @override
  set lastName(String value) => RealmObjectBase.set(this, 'lastName', value);

  @override
  String get designation =>
      RealmObjectBase.get<String>(this, 'designation') as String;
  @override
  set designation(String value) =>
      RealmObjectBase.set(this, 'designation', value);

  @override
  String get dateOfBirth =>
      RealmObjectBase.get<String>(this, 'dateOfBirth') as String;
  @override
  set dateOfBirth(String value) =>
      RealmObjectBase.set(this, 'dateOfBirth', value);

  @override
  String get password =>
      RealmObjectBase.get<String>(this, 'password') as String;
  @override
  set password(String value) => RealmObjectBase.set(this, 'password', value);

  @override
  String get confirmPassword =>
      RealmObjectBase.get<String>(this, 'confirmPassword') as String;
  @override
  set confirmPassword(String value) =>
      RealmObjectBase.set(this, 'confirmPassword', value);

  @override
  String get companyAddress =>
      RealmObjectBase.get<String>(this, 'companyAddress') as String;
  @override
  set companyAddress(String value) =>
      RealmObjectBase.set(this, 'companyAddress', value);

  @override
  Stream<RealmObjectChanges<EmployeeDetailsModel>> get changes =>
      RealmObjectBase.getChanges<EmployeeDetailsModel>(this);

  @override
  EmployeeDetailsModel freeze() =>
      RealmObjectBase.freezeObject<EmployeeDetailsModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(EmployeeDetailsModel._);
    return const SchemaObject(
        ObjectType.realmObject, EmployeeDetailsModel, 'EmployeeDetailsModel', [
      SchemaProperty('firstName', RealmPropertyType.string),
      SchemaProperty('lastName', RealmPropertyType.string),
      SchemaProperty('designation', RealmPropertyType.string),
      SchemaProperty('dateOfBirth', RealmPropertyType.string),
      SchemaProperty('password', RealmPropertyType.string),
      SchemaProperty('confirmPassword', RealmPropertyType.string),
      SchemaProperty('companyAddress', RealmPropertyType.string),
    ]);
  }
}

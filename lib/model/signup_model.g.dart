// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class SignUpModel extends _SignUpModel
    with RealmEntity, RealmObjectBase, RealmObject {
  SignUpModel(
    String userName,
    String password,
  ) {
    RealmObjectBase.set(this, 'userName', userName);
    RealmObjectBase.set(this, 'password', password);
  }

  SignUpModel._();

  @override
  String get userName =>
      RealmObjectBase.get<String>(this, 'userName') as String;
  @override
  set userName(String value) => RealmObjectBase.set(this, 'userName', value);

  @override
  String get password =>
      RealmObjectBase.get<String>(this, 'password') as String;
  @override
  set password(String value) => RealmObjectBase.set(this, 'password', value);

  @override
  Stream<RealmObjectChanges<SignUpModel>> get changes =>
      RealmObjectBase.getChanges<SignUpModel>(this);

  @override
  SignUpModel freeze() => RealmObjectBase.freezeObject<SignUpModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(SignUpModel._);
    return const SchemaObject(
        ObjectType.realmObject, SignUpModel, 'SignUpModel', [
      SchemaProperty('userName', RealmPropertyType.string),
      SchemaProperty('password', RealmPropertyType.string),
    ]);
  }
}

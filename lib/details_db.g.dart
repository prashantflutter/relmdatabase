// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_db.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class DetailsModel extends _DetailsModel
    with RealmEntity, RealmObjectBase, RealmObject {
  DetailsModel(
    String name,
  ) {
    RealmObjectBase.set(this, 'name', name);
  }

  DetailsModel._();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  Stream<RealmObjectChanges<DetailsModel>> get changes =>
      RealmObjectBase.getChanges<DetailsModel>(this);

  @override
  DetailsModel freeze() => RealmObjectBase.freezeObject<DetailsModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(DetailsModel._);
    return const SchemaObject(
        ObjectType.realmObject, DetailsModel, 'DetailsModel', [
      SchemaProperty('name', RealmPropertyType.string),
    ]);
  }
}

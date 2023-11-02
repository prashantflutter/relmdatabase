import 'package:realm/realm.dart';


@RealmModel()
class _Item {
  @PrimaryKey()
  late int id;

  late String name;

  int price = 42;
}
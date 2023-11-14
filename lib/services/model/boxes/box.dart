
import 'package:hive/hive.dart';

class Boxes{

  static Box getPersonalData() => Hive.box('personalaccount');
  static Box getBusinessData() => Hive.box('businessaccount');

}

import 'package:hive/hive.dart';
part 'businessaccount_model.g.dart';

@HiveType(typeId: 1)
class BusinessAccountModel extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  String bankAccount;
  @HiveField(2)
  String ibanNumber;
  @HiveField(3)
  String swiftCode;
  @HiveField(4)
  String branchCode;

  BusinessAccountModel(
    this.name,
    this.bankAccount,
    this.ibanNumber,
    this.swiftCode,
    this.branchCode,
  );
}

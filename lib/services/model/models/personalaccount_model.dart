import 'package:hive/hive.dart';
part 'personalaccount_model.g.dart';

@HiveType(typeId: 0)
class PersonalAccountModel extends HiveObject {
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

  PersonalAccountModel(
    this.name,
    this.bankAccount,
    this.ibanNumber,
    this.swiftCode,
    this.branchCode,
  );

  @override
  String toString() {
    return 'Name: $name\n, Bank Account: $bankAccount\n, Iban Number: $ibanNumber\n, Swift Code: $swiftCode\n, Branch Code: $branchCode\n';
  }
}

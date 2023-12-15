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
    if (ibanNumber == '' && swiftCode == '' && branchCode == '') {
      return 'Name: $name\nBank Account: $bankAccount\n';
    } else if (swiftCode == '' && branchCode == '') {
      return 'Name: $name\nBank Account: $bankAccount\nIban Number: $ibanNumber\n';
    } else if (branchCode == '') {
      return 'Name: $name\nBank Account: $bankAccount\nIban Number: $ibanNumber\nSwift Code: $swiftCode\n';
    } else {
      return 'Name: $name\nBank Account: $bankAccount\nIban Number: $ibanNumber\nSwift Code: $swiftCode\nBranch Code: $branchCode\n';
    }
  }
}

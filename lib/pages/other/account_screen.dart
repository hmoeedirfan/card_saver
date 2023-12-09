import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import '../../services/model/boxes/box.dart';
import '../../services/model/models/businessaccount_model.dart';
import '../../services/model/models/personalaccount_model.dart';
import '../../widgets/features/custom_textfield.dart';
import '../../widgets/features/login_button.dart';
import '../home.dart';
import 'setting_screen.dart';

class AccountScreen extends StatefulWidget {
  final Account currentAccount;

  const AccountScreen({super.key, required this.currentAccount});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String countryValue = "";
  String? mySelection;

  // List of Banks json
  List<Map> bankJson = [
    {
      "id": 0,
      "name": "ALBarakh",
      "image": "assets/banks/ALBarakh.png",
    },
    {
      "id": 1,
      "name": "Allied Bank",
      "image": "assets/banks/Allied Bank.png",
    },
    {
      "id": 2,
      "name": "Askari Bank",
      "image": "assets/banks/Askari Bank.png",
    },
    {
      "id": 3,
      "name": "Bank Al Habib",
      "image": "assets/banks/Bank Al Habib.png",
    },
    {
      "id": 4,
      "name": "Bank Islami",
      "image": "assets/banks/Bank Islami.png",
    },
    {
      "id": 5,
      "name": "Bank of Azad Jammu & Kashmir",
      "image": "assets/banks/Bank of AJK.png",
    },
    {
      "id": 6,
      "name": "Bank of Khyber",
      "image": "assets/banks/Bank of Khyber.png",
    },
    {
      "id": 7,
      "name": "Bank of Punjab",
      "image": "assets/banks/Bank of Punjab.png",
    },
    {
      "id": 8,
      "name": "Citi Bank",
      "image": "assets/banks/Citi Bank.png",
    },
    {
      "id": 9,
      "name": "Dubai Islamic Bank",
      "image": "assets/banks/Dubai Islamic Bank.png",
    },
    {
      "id": 10,
      "name": "Easy Paisa",
      "image": "assets/banks/Easy Paisa.png",
    },
    {
      "id": 11,
      "name": "Faysal Bank",
      "image": "assets/banks/Faysal Bank.png",
    },
    {
      "id": 12,
      "name": "Habib Metro",
      "image": "assets/banks/Habib Metro.png",
    },
    {
      "id": 13,
      "name": "HBL",
      "image": "assets/banks/HBL.png",
    },
    {
      "id": 14,
      "name": "Jazz Cash",
      "image": "assets/banks/JazzCash.png",
    },
    {
      "id": 15,
      "name": "JS Bank",
      "image": "assets/banks/JS Bank.png",
    },
    {
      "id": 16,
      "name": "MCB",
      "image": "assets/banks/MCB.png",
    },
    {
      "id": 17,
      "name": "Meezan Bank",
      "image": "assets/banks/Meezan Bank.png",
    },
    {
      "id": 18,
      "name": "NayaPay",
      "image": "assets/banks/NayaPay.png",
    },
    {
      "id": 19,
      "name": "SadaPay",
      "image": "assets/banks/Sada Pay.png",
    },
    {
      "id": 20,
      "name": "Sindh Bank",
      "image": "assets/banks/Sindh Bank.png",
    },
    {
      "id": 21,
      "name": "Soneri Bank",
      "image": "assets/banks/Soneri Bank.png",
    },
    {
      "id": 22,
      "name": "Standard Chartered Bank",
      "image": "assets/banks/Standard Chartered.png",
    },
    {
      "id": 23,
      "name": "Summit Bank",
      "image": "assets/banks/Summit Bank.png",
    },
    {
      "id": 24,
      "name": "United Bank",
      "image": "assets/banks/United Bank.png",
    },
    {
      "id": 25,
      "name": "UPaisa",
      "image": "assets/banks/Upaisa.png",
    },
    {
      "id": 26,
      "name": "Zindigi",
      "image": "assets/banks/Zindigi.png",
    },
  ];

  // List of Controllers
  final name = TextEditingController();
  final bankAccount = TextEditingController();
  final ibanNumber = TextEditingController();
  final swiftCode = TextEditingController();
  final branchCode = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      // Appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 80,
        leading: Image.asset(
          Theme.of(context).brightness == Brightness.dark
              ? 'assets/images/logo_white.png'
              : 'assets/images/appbar_logo.png',
          scale: 4,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const SettingScreen()),
                ),
              );
            },
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      // Body
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 80, 16, 0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: name,
                  text: "Account Holder's Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your details";
                    } else {
                      return null;
                    }
                  },
                ),
                // ====================================== TODO Country Picker
                CSCPicker(
                  flagState: CountryFlag.ENABLE,
                  disabledDropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  dropdownHeadingStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  showCities: false,
                  showStates: false,
                  searchBarRadius: 50,
                  defaultCountry: CscCountry.Pakistan,
                  countryDropdownLabel: countryValue,
                  onCountryChanged: (value) {
                    setState(() {
                      countryValue = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                // ====================================== Bank Dropdown ===================
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: false,
                            child: DropdownButton<String>(
                              isDense: true,
                              hint: const Text('Select your Bank'),
                              value: mySelection,
                              icon: const Icon(
                                Icons.expand_more_sharp,
                                textDirection: TextDirection.rtl,
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  mySelection = newValue;
                                });

                                // ignore: avoid_print
                                print(mySelection);
                              },
                              items: bankJson.map((Map map) {
                                return DropdownMenuItem(
                                  value: map["name"].toString(),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        map["image"],
                                        width: 24,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        map["name"],
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: bankAccount,
                  text: "Account Number",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your details";
                    } else {
                      return null;
                    }
                  },
                ),
                CustomTextField(
                  controller: ibanNumber,
                  text: "IBAN Number",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    } else {
                      return null;
                    }
                  },
                ),
                CustomTextField(
                  controller: swiftCode,
                  text: "Swift/BIC Code",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    } else {
                      return null;
                    }
                  },
                ),
                CustomTextField(
                  controller: branchCode,
                  text: "Branch Code",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    } else {
                      return null;
                    }
                  },
                ),
                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            if (widget.currentAccount == Account.Personal) {
                              final data = PersonalAccountModel(
                                name.text,
                                bankAccount.text,
                                ibanNumber.text,
                                swiftCode.text,
                                branchCode.text,
                              );
                              final box = Boxes.getPersonalData();
                              box.add(data);
                              data.save();
                            } else {
                              final data = BusinessAccountModel(
                                name.text,
                                bankAccount.text,
                                ibanNumber.text,
                                swiftCode.text,
                                branchCode.text,
                              );
                              final box = Boxes.getBusinessData();
                              box.add(data);
                              data.save();
                            }
                            Navigator.of(context).pop();
                          }
                        },
                        child: loginButton(
                          text: 'Save',
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: loginButton(
                          text: 'Go Back',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

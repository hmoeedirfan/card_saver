import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import '../../services/model/boxes/box.dart';
import '../../services/model/models/businessaccount_model.dart';
import '../../services/model/models/personalaccount_model.dart';
import '../../widgets/features/custom_textfield.dart';
import '../../widgets/features/login_button.dart';
import '../home.dart';

class UpdateScreen extends StatefulWidget {
  final Account currentAccount;

  const UpdateScreen({super.key, required this.currentAccount});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  String countryValue = "";

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
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.edit,
        //       color: Theme.of(context).colorScheme.primary,
        //     ),
        //   ),
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.menu,
        //       color: Theme.of(context).colorScheme.primary,
        //     ),
        //   ),
        //   const SizedBox(width: 10),
        // ],
      ),
      // Body
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: name,
                  text: "Account Holder's Name",
                ),
                // Country Picker
                CSCPicker(
                  flagState: CountryFlag.ENABLE,
                  disabledDropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.black54,
                      width: 1,
                    ),
                  ),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.black54,
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
                CustomTextField(
                  controller: bankAccount,
                  text: "Account Number",
                ),
                CustomTextField(
                  controller: ibanNumber,
                  text: "IBAN Number",
                ),
                CustomTextField(
                  controller: swiftCode,
                  text: "Swift/BIC Code",
                ),
                CustomTextField(
                  controller: branchCode,
                  text: "Branch Code",
                ),
                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
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
                        text: 'Update',
                        color: Colors.blue,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const Home();
                            },
                          ),
                        );
                      },
                      child: loginButton(
                        text: 'Go Back',
                        color: Colors.black,
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

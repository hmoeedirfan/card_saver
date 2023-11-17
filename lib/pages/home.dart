// ignore_for_file: camel_case_types, constant_identifier_names

import 'package:card_saver/pages/other/update_screen.dart';
import 'package:flutter/material.dart';
import '../services/model/boxes/box.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../services/model/models/personalaccount_model.dart';
import '../widgets/features/custom_button.dart';
import 'other/account_screen.dart';
import 'other/setting_screen.dart';

enum Account {
  Personal,
  Business,
}

final personalAccountModel = PersonalAccountModel(
  'name',
  'bankAccount',
  'ibanNumber',
  'swiftCode',
  'branchCode',
);

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAppBarToggled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              setState(() {
                isAppBarToggled = !isAppBarToggled;
              });
            },
            icon: Icon(
              Icons.edit,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
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
      body: ValueListenableBuilder(
        valueListenable: Boxes.getPersonalData().listenable(),
        builder: (context, box, _) {
          var data = box.values.toList().cast();
          if (data.isEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Personal
                  const Text(
                    'Personal',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Button to add information
                  customButton(
                    text: 'personal',
                    accountType: Account.Personal,
                  ),
                  const SizedBox(height: 50),
                  // Business
                  const Text(
                    'Business',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Button to add information
                  customButton(
                    text: 'business',
                    accountType: Account.Business,
                  ),
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Personal
                    Row(
                      children: [
                        const Text(
                          'Personal',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(width: 8),
                        CircleAvatar(
                          backgroundColor: const Color(0xfff4f4f4),
                          radius: 12,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.add,
                              size: 20,
                            ),
                            color: Colors.black,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return const AccountScreen(
                                    currentAccount: Account.Personal,
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    // Button to show information
                    ValueListenableBuilder(
                        valueListenable: Boxes.getPersonalData().listenable(),
                        builder: (context, box, _) {
                          var data = box.values.toList().cast();
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: box.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.only(left: 16),
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/hbl_logo.png',
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            data[index].name.toString(),
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    isAppBarToggled
                                        ? IconButton(
                                            onPressed: () {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      "Copied to your clipboard !"),
                                                ),
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.copy,
                                              size: 20,
                                            ),
                                          )
                                        : const editIcons(
                                            currentaccountType:
                                                Account.Personal,
                                          ),
                                  ],
                                ),
                              );
                            },
                          );
                        }),
                    const SizedBox(height: 20),
                    // Business
                    Row(
                      children: [
                        const Text(
                          'Business',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(width: 8),
                        CircleAvatar(
                          backgroundColor: const Color(0xfff4f4f4),
                          radius: 12,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.add,
                              size: 20,
                            ),
                            color: Colors.black,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return const AccountScreen(
                                    currentAccount: Account.Business,
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    // Button to add information
                    ValueListenableBuilder(
                        valueListenable: Boxes.getBusinessData().listenable(),
                        builder: (context, box, _) {
                          var data = box.values.toList().cast();
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: box.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.only(left: 16),
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/hbl_logo.png',
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            data[index].name.toString(),
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    isAppBarToggled
                                        ? const copyIcon()
                                        : const editIcons(
                                            currentaccountType:
                                                Account.Business,
                                          ),
                                  ],
                                ),
                              );
                            },
                          );
                        }),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

// Copy Icon
class copyIcon extends StatelessWidget {
  const copyIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Copied to your clipboard !"),
          ),
        );
      },
      icon: const Icon(
        Icons.copy,
        size: 20,
      ),
    );
  }
}

// Edit Icons
class editIcons extends StatelessWidget {
  final Account currentaccountType;
  const editIcons({super.key, required this.currentaccountType});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.edit,
            color: Theme.of(context).colorScheme.primary,
            size: 20,
          ),
        ),
        IconButton(
          onPressed: () {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) {
            //     return DeleteScreen(
            //       accountType: currentaccountType,
            //     );
            //   }),
            // );
          },
          icon: const Icon(
            Icons.close,
            color: Colors.red,
            size: 20,
          ),
        ),
      ],
    );
  }
}

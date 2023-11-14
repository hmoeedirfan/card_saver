import 'package:flutter/material.dart';

import '../../pages/home.dart';
import '../../pages/other/account_screen.dart';


// ignore: must_be_immutable, camel_case_types
class customButton extends StatelessWidget {
  late String text;
  late Account accountType;
  customButton({super.key, required this.text, required this.accountType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          width: .5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return AccountScreen(
                    currentAccount: accountType,
                  );
                }),
              );
            },
            icon: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.primary,
              size: 30,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Tap to add $text \naccount details',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
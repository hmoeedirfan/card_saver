import 'dart:async';
import 'package:flutter/material.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return const Home();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20, top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      Theme.of(context).brightness == Brightness.dark
                          ? 'assets/images/logo_white.png'
                          : 'assets/images/appbar_logo.png',
                      scale: 2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'BankBoard',
                    style: TextStyle(
                      fontSize: 38,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GridView.count(
                    padding: const EdgeInsets.all(0),
                    crossAxisCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: const [
                      Divider(
                        color: Colors.red,
                        thickness: 20,
                      ),
                      Divider(
                        color: Colors.blue,
                        thickness: 20,
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 20,
                      ),
                    ],
                  ),
                  const Text(
                    'Sharing bank details made \n                   easy.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'Made with ♥ in Pakistan',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

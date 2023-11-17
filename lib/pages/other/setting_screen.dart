import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/settings/darktheme/model/theme_changer.dart';
import '../../widgets/features/custom_switch.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeChanger>(context);

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
      // Body Content
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Dark Mode',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  // Dark Mode Button
                  CustomSwitch(
                    value: themeChange.darkTheme,
                    onChanged: (bool value) {
                      themeChange.darkTheme = value;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            const Text(
              'Important Links',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Privacy policy',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Terms and conditions',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Share app with friends',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Rate or Review app',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Report a bug',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}

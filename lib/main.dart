import 'package:card_saver/services/settings/darktheme/model/theme_changer.dart';
import 'package:card_saver/services/settings/darktheme/styles.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'pages/splash_screen.dart';
import 'services/model/models/businessaccount_model.dart';
import 'services/model/models/personalaccount_model.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(PersonalAccountModelAdapter());
  Hive.registerAdapter(BusinessAccountModelAdapter());
  await Hive.openBox('personalaccount');
  await Hive.openBox('businessaccount');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeChanger themeChangeProvider = ThemeChanger();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => themeChangeProvider,
      child: Consumer<ThemeChanger>(
        builder: (context, value, child) {
          return MaterialApp(
            theme: Styles.themeData(
              themeChangeProvider.darkTheme,
              context,
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}

import 'package:card_saver/firebase_options.dart';
import 'package:card_saver/services/settings/darktheme/model/theme_changer.dart';
import 'package:card_saver/services/settings/darktheme/styles.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'pages/splash_screen.dart';
import 'services/model/models/businessaccount_model.dart';
import 'services/model/models/personalaccount_model.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  
  // Initialize Hive
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

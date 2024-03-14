import 'package:designs_hub/common/di/app_module.dart';
import 'package:designs_hub/common/utilities/helpers/firebase_helper.dart';
import 'package:designs_hub/feature/dark_mode/presentation/manager/toggle_theme_bloc.dart';
import 'package:designs_hub/feature/dark_mode/utilities/theme_constants.dart';
import 'package:designs_hub/feature/dark_mode/utilities/theme_enums.dart';
import 'package:designs_hub/feature/dark_mode/utilities/theme_helper.dart';
import 'package:designs_hub/feature/home/presentation/manager/bottom_navigation_bloc.dart';
import 'package:designs_hub/feature/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await appModuleSetup();
  await FirebaseHelper.initializeFirebase();

  var prefs = locator.get<SharedPreferences>();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<BottomNavigationBloc>(
          create: (_) => BottomNavigationBloc(),
        ),
        RepositoryProvider<ToggleThemeBloc>(
          create: (_) => ToggleThemeBloc(
            getCurrentTheme(
              prefs.get(ThemeConstants.appTheme).toString(),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleThemeBloc, AppTheme>(
        builder: (context, themeState) {
      return MaterialApp(
        title: 'Designs Hub',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple, brightness: Brightness.light),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple, brightness: Brightness.dark),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }),
        ),
        themeMode:
            themeState == AppTheme.dark ? ThemeMode.dark : ThemeMode.light,
        home: const HomePage(),
      );
    });
  }
}

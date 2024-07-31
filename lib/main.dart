import 'package:desktop/page/frame_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_styled/radius_extension.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    //1245 比 700
    size: Size(1600, 900),
    center: true,
    minimumSize: Size(1200, 600),
    backgroundColor: Colors.transparent,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desktop Demo',
      locale: const Locale("zh", "CN"),
      supportedLocales: const <Locale>[
        Locale("zh", "CN"),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        SfGlobalLocalizations.delegate,
      ],
      theme: ThemeData(
        //fontFamily: "微软雅黑",
        fontFamily: "ITCAvantGarde",
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFA9D196),
          primary: const Color(0xFFA9D196),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        navigationRailTheme: NavigationRailThemeData(
          backgroundColor: Colors.transparent,
          indicatorColor: const Color(0xFFA9D196),
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: 100.borderRadius,
            borderSide: const BorderSide(
              color: Color(0xFFD8E4E9),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: 100.borderRadius,
            borderSide: const BorderSide(
              color: Color(0xFFD8E4E9),
            ),
          ),
          hintStyle: const TextStyle(
            color: Color(0xFF939EA2),
          ),
        ),
        outlinedButtonTheme: const OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
            shape: WidgetStatePropertyAll(
              CircleBorder(),
            ),
            side: WidgetStatePropertyAll(
              BorderSide(
                color: Color(0xFFD8E4E9),
              ),
            ),
          ),
        ),
        dividerTheme: DividerThemeData(
          color: const Color(0xFFC8D8C7).withOpacity(.3),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const FramePage(),
    );
  }
}

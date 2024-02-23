import 'package:flutter/material.dart';
import 'package:storeapp/consts/global_colors.dart';
import 'package:storeapp/screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store App',
      theme: ThemeData(
          scaffoldBackgroundColor: lightScaffoldColor,
          primaryColor: lightCardColor,
          backgroundColor: lightBackgondColor,
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: lightIconsColor),
              backgroundColor: lightBackgondColor,
              centerTitle: true,
              titleTextStyle: TextStyle(
                  color: lightTextColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
              elevation: 0),
          iconTheme: IconThemeData(
            color: lightIconsColor,
          ),
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colors.black, selectionColor: Colors.blue),
          cardColor: lightCardColor,
          brightness: Brightness.light,
          colorScheme: ThemeData().colorScheme.copyWith(
              secondary: lightCardColor, brightness: Brightness.light)),
      home: const HomeScreen(),
    );
  }
}

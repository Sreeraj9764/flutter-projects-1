import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/presentation/main_page/widgets/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BLOC_DEMO',
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
            headline1: TextStyle(color: Colors.white, fontSize: 30)),
        scaffoldBackgroundColor: kBackgroundColor,
        primarySwatch: Colors.blue,
        backgroundColor: kBackgroundColor,
      ),
      home: ScreenMainPage(),
    );
  }
}

import 'package:deal_app/pages/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //   apiKey: "AIzaSyCrnuK6hN5f1a8m9E1qSwQD3HtNyzFdG4w",
  //   appId: "1:337419386266:web:ad4435c57ebce569424e23",
  //   messagingSenderId: "337419386266",
  //   projectId: "deal-app-c0f78",
  // ));
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignIn(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[50],
            iconTheme: IconThemeData(color: Colors.grey[900]),
            elevation: 0.2,
            titleTextStyle: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
            centerTitle: true),
      ),
    );
  }
}

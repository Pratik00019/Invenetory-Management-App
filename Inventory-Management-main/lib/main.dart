import 'package:dbms_assignment/pages/mobile_home_page.dart';
import 'package:dbms_assignment/pages/web_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
   await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1280, 720),
      builder: () => MaterialApp(
        title: 'Inventory Management',
        theme: ThemeData(
          textTheme: GoogleFonts.nunitoTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.grey,
          primaryColor: Colors.red,
        ),
        home: const MyHomePage(title: 'Inventory Management'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LayoutBuilder(
        builder: (context, constraint) {
          if (constraint.maxWidth > 720) {
            return WebHomePage(
              pageNo: 0,
            );
          }
          return MobileHomePage(
            pageNo: 0,
          );
        },
      ),
    );
  }
}

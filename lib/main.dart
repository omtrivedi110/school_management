import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/controllers/management_controller.dart';
import 'package:school_management/utils/route_utils.dart';
import 'package:school_management/views/screens/homepage.dart';
import 'package:school_management/views/screens/loginpage.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (ctx) => SchoolController(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.login: (ctx) => LoginPage(),
        MyRoutes.home: (ctx) => const HomePage(),
      },
    );
  }
}

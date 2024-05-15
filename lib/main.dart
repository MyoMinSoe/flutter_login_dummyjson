import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_dummyjson/screen/login.dart';
import 'package:flutter_login_dummyjson/utility/my_shared_preference.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MySharedPreference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login DummyJson',
      home: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          child: LoginWidget(),
        ),
      ),
    );
  }
}

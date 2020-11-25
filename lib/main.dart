import 'package:app_teste_user/screens/login/login_screen.dart';
import 'package:app_teste_user/stores/login_store.dart';
import 'package:app_teste_user/stores/page_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(LoginStore());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Test',
      theme: ThemeData(
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          cursorColor: Colors.black,
          appBarTheme: AppBarTheme(
            elevation: 0,
          )
      ),
      home: LoginScreen(),
    );
  }
}


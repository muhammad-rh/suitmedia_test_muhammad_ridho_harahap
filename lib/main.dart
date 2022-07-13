import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/screens/first_screen/first_screen.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/screens/first_screen/first_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirstViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Palindrome App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/firstScreen',
        routes: {
          '/firstScreen': (context) => const FirstScreen(),
          // '/secondScreen' : (context) => const FirstScreen(),
          // '/thirdScreen' : (context) => const FirstScreen(),
        },
      ),
    );
  }
}

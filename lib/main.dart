import 'package:flutter/material.dart';
import 'package:movie/pages/detailpage.dart';
import 'package:movie/pages/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
// await di.init()
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/detail': (context) => DetailPage(),
        // '/secondScreen': (context) => const SecondScreen(),
        // '/secondScreenWithData': (context) => SecondScreenWithData(
        //     ModalRoute.of(context)?.settings.arguments as String),
        // '/returnDataScreen': (context) => const ReturnDataScreen(),
        // '/replacementScreen': (context) => const ReplacementScreen(),
        // '/anotherScreen': (context) => const AnotherScreen(),
      },
    );
  }
}

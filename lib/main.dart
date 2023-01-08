import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:getx_practice/views/favorite_screen.dart';
import 'package:getx_practice/views/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: const CupertinoThemeData(brightness: Brightness.light),
      home: const MainScreen(),
      routes: {
        'MainScreen': (context) => const MainScreen(),
        'FavoriteScreen': (context) => const FavoriteScreen(),
      },
    );
  }
}

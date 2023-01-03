import 'package:flutter/cupertino.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() =>
      _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('News'),
        trailing: Icon(CupertinoIcons.heart),
      ),
      child: FutureBuilder(
        builder: (context, snapshot) {

        },),
    ),
    );
  }
}
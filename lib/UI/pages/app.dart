import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../routes/routes2.dart';
import 'login.dart';
import 'principal.dart';
import 'principalEMP.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Principal',
        theme: ThemeData(primaryColor: Colors.black),
        home: const Login(),
        debugShowCheckedModeBanner: false);
  }
}

//---------------------------------------------------------------------------

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 1;
  BottomNavigation? myBNB;
  @override
  void initState() {
    myBNB = BottomNavigation(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myBNB,
      body: Routes(index: index),
    );
  }
}

//-----------------------------------------------------------------------
class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  int index = 1;
  BottomNavigationEMP? myBNB;
  @override
  void initState() {
    myBNB = BottomNavigationEMP(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myBNB,
      body: Routes2(index: index),
    );
  }
}

import 'package:animaiton_test2/pageOne.dart';
import 'package:animaiton_test2/pagethree.dart';
import 'package:animaiton_test2/pagetwo.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _tabs = <Widget>[PageOne(), PageTwo(), PageThree()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (Widget child, Animation<double> primaryAnimation,
            Animation<double> secondaryAnimation) {
          return FadeThroughTransition(
              animation: primaryAnimation,
              child: child,
              secondaryAnimation: secondaryAnimation);
        },
        child: _tabs[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int pos) {
          setState(() {
            _selectedIndex = pos;
          });
        },
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        // ignore: prefer_const_literals_to_create_immutables
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'dashboard'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
    );
    // floatingActionButton: OpenContainer(
    //     closedBuilder: (BuildContext context, action) =>
    //         FloatingActionButton(
    //           onPressed: action,
    //           child: Icon(Icons.add),
    //         ),
    //     closedShape: const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.all(Radius.circular(56.0)),
    //     ),
    //     closedColor: Colors.white,
    //     openBuilder: (BuildContext context, action) => SecondScreen()));
  }
}

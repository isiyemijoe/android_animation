import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'secondScreen.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Page one'),
        ),
        body: Container(
          color: Colors.green,
          child: Center(
            child: RaisedButton(
              onPressed: () {
                showModal(
                    context: context,
                    configuration: const FadeScaleTransitionConfiguration(),
                    builder: (BuildContext context) {
                      return Dialog(
                        child: Container(
                          height: 200,
                          width: 200,
                          color: Colors.white,
                          child: const Center(
                            child: Text('A POP UP'),
                          ),
                        ),
                      );
                    });
              },
              child: const Text('Show modal'),
            ),
          ),
        ),
        floatingActionButton: OpenContainer(
            closedElevation: 6,
            closedBuilder: (BuildContext context, Function() action) =>
                FloatingActionButton(
                  onPressed: action,
                  child: const Icon(Icons.add),
                ),
            closedShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(56.0)),
            ),
            closedColor: Colors.blue,
            openBuilder: (BuildContext context, Function() action) =>
                SecondScreen()));
  }
}

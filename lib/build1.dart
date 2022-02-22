import 'package:flutter/material.dart';

class Build1Page extends StatefulWidget {
  const Build1Page({
    Key? key,
  }) : super(key: key);

  @override
  _Build1PageState createState() => _Build1PageState();
}

class _Build1PageState extends State<Build1Page> {
  int _clicks = 0;
  int _builds = 0;

  int _clicks2 = 0;
  int _builds2 = 0;

  void _onClick() {
    setState(() {
      _clicks++;
    });
  }

  void _onClick2() {
    setState(() {
      _clicks2++;
    });
  }

  @override
  Widget build(BuildContext context) {
    _builds++;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rebuild2 Example'),
      ),
      body: GestureDetector(
        onTap: _onClick,
        child: Container(
          color: Colors.amberAccent,
          child: Stack(
            children: <Widget>[
              Center(
                child: _myWidget(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Text('Clicks: $_clicks'),
                    Text('Builds: $_builds'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget _myWidget() {
    return GestureDetector(
      onTap: _onClick2,
      child: Builder(
        builder: (context) {
          _builds2++;
          return Container(
            color: Colors.pink,
            width: 200.0,
            height: 200.0,
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Text('Clicks: $_clicks2'),
                  Text('Builds: $_builds2'),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
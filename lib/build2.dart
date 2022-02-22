import 'package:flutter/material.dart';

class Build2Page extends StatefulWidget {
  const Build2Page({
    Key? key,
  }) : super(key: key);

  @override
  _Build2PageState createState() => _Build2PageState();
}

class _Build2PageState extends State<Build2Page> {
  int _clicks = 0;
  int _builds = 0;

  void _onClick() {
    setState(() {
      _clicks++;
    });
  }

  @override
  Widget build(BuildContext context) {
    _builds++;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rebuild1 Example'),
      ),
      body: GestureDetector(
        onTap: _onClick,
        child: Container(
          color: Colors.amberAccent,
          child: Stack(
            children: <Widget>[
              const Center(
                child: _MyWidget(),
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
}

class _MyWidget extends StatefulWidget {
  const _MyWidget({
    Key? key,
  }) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<_MyWidget> {
  int _clicks = 0;
  int _builds = 0;

  void _onClick() {
    setState(() {
      _clicks++;
    });
  }

  @override
  Widget build(BuildContext context) {
    _builds++;

    return GestureDetector(
      onTap: _onClick,
      child: Container(
        color: Colors.pink,
        width: 200.0,
        height: 200.0,
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: <Widget>[
              Text('Clicks: $_clicks'),
              Text('Builds: $_builds'),
            ],
          ),
        ),
      ),
    );
  }
}
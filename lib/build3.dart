import 'package:flutter/material.dart';

class Build3Page extends StatefulWidget {
  const Build3Page({Key? key}) : super(key: key);

  @override
  _Build3PageState createState() => _Build3PageState();
}

class _Build3PageState extends State<Build3Page> {
  final Build3PageController _controller = Build3PageController();

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rebuild3 Example'),
      ),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return GestureDetector(
      onTap: _controller.onClick,
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
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      print('_builds');
                      return Text('Clicks: ${_controller.clicks}');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _myWidget() {
    return GestureDetector(
      onTap: _controller.onClick2,
      child: Builder(builder: (context) {
        return Container(
          color: Colors.pink,
          width: 200.0,
          height: 200.0,
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: <Widget>[
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    print('_builds2');
                    return Text('Clicks: ${_controller.clicks2}');
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class Build3PageController with ChangeNotifier {
  int clicks = 0;

  int clicks2 = 0;

  void onClick() {
    clicks++;
    notifyListeners();
  }

  void onClick2() {
    clicks2++;
    notifyListeners();
  }
}

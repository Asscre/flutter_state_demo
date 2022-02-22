import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Build4Page extends StatefulWidget {
  const Build4Page({Key? key}) : super(key: key);

  @override
  _Build4PageState createState() => _Build4PageState();
}

class _Build4PageState extends State<Build4Page> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return ChangeNotifierProvider(
      create: (_) => Build4PageProvider(),
      builder: (BuildContext ctx, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Rebuild3 Example'),
          ),
          body: _bodyWidget(ctx),
        );
      },
    );
  }

  Widget _bodyWidget(BuildContext ctx) {
    return GestureDetector(
      onTap: ctx.read<Build4PageProvider>().onClick,
      child: Container(
        color: Colors.amberAccent,
        child: Stack(
          children: <Widget>[
            Center(
              child: _myWidget(ctx),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Builder(builder: (context) {
                print('build1');
                int clicks = context.select<Build4PageProvider, int>(
                    (Build4PageProvider p) => p.clicks);
                return Text(
                  'Clicks: $clicks',
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _myWidget(BuildContext ctx) {
    return GestureDetector(
      onTap: ctx.read<Build4PageProvider>().onClick2,
      child: Container(
        color: Colors.pink,
        width: 200.0,
        height: 200.0,
        child: Align(
          alignment: Alignment.topLeft,
          child: Builder(builder: (context) {
            print('build2');
            int clicks2 = context.select<Build4PageProvider, int>(
                (Build4PageProvider p) => p.clicks2);
            return Text(
              'Clicks: $clicks2',
            );
          }),
        ),
      ),
    );
  }
}

class Build4PageProvider with ChangeNotifier {
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

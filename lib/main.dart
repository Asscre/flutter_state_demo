import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_demo/build2.dart';
import 'package:state_demo/build1.dart';
import 'package:state_demo/build3.dart';
import 'package:state_demo/build4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          children: [
            _navBtnWidget(
              context,
              NavBtnModel(
                name: 'Build1',
                page: const Build2Page(),
              ),
            ),
            _navBtnWidget(
              context,
              NavBtnModel(
                name: 'Build2',
                page: const Build2Page(),
              ),
            ),
            _navBtnWidget(
              context,
              NavBtnModel(
                name: 'Build3',
                page: const Build3Page(),
              ),
            ),
            _navBtnWidget(
              context,
              NavBtnModel(
                name: 'Build4',
                page: const Build4Page(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navBtnWidget(BuildContext ctx, NavBtnModel param) {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        ctx,
        MaterialPageRoute(
          builder: (_) => param.page,
        ),
      ),
      child: Text(param.name),
    );
  }
}

class NavBtnModel {
  String name;
  Widget page;

  NavBtnModel({required this.name, required this.page});
}

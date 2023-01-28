import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black54,
        body: SafeArea(
          child: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  textAlign: TextAlign.center,
                  'Some cats are actually allergic to humans',
                  style: TextStyle(fontSize: 42.5, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: kButtonsPadding,
                  backgroundColor: Colors.green,
                ),
                onPressed: () {},
                child: Text(
                  'True',
                  style: kTextStyle,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: kButtonsPadding,
                  backgroundColor: Colors.red,
                ),
                onPressed: () {},
                child: Text(
                  'False',
                  style: kTextStyle,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 20,
          ),
        ),
      ],
    );
  }
}

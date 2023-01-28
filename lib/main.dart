import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'questionBank.dart';

QuestionBank myQuestionsList = QuestionBank();

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
  List<Icon> myIconsList = [];
  int indexOfQuesions = 0;

  void doTheWorkWhenButtonPressed(bool isTrue) {
    bool correctAns = myQuestionsList.getAnswear();
    setState(() {
      if (!myQuestionsList.areQuestionsFinished()) {
        if (isTrue) {
          myIconsList.add(
            getIconForYourAnswear(correctAns),
          );
        } else {
          myIconsList.add(
            getIconForYourAnswear(!correctAns),
          );
        }
      } else {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        myQuestionsList.reset();

        myIconsList = [];
      }
    });
  }

  Icon getIconForYourAnswear(bool isTrue) {
    if (isTrue) {
      return Icon(
        Icons.check,
        color: Colors.green,
      );
    } else {
      return Icon(
        Icons.close,
        color: Colors.red,
      );
    }
  }

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
                  style: TextStyle(fontSize: 42.5, color: Colors.white),
                  myQuestionsList.getQuestion(),
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
                child: Text(
                  'True',
                  style: kTextStyle,
                ),
                onPressed: () {
                  doTheWorkWhenButtonPressed(true);
                  myQuestionsList.goToNextQuestion();
                },
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
                child: Text(
                  'False',
                  style: kTextStyle,
                ),
                onPressed: () {
                  doTheWorkWhenButtonPressed(false);
                  myQuestionsList.goToNextQuestion();
                },
              ),
            ],
          ),
        ),
        Expanded(
            child: Row(
          children: myIconsList,
        ))
      ],
    );
  }
}

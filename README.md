# Quiz Bank

A package containing the general quiz questions based on True False. Quiz Bank is super easy to use TRUE FALSE based question bank for Flutter. You may add your own quiz questions in addition to the existing one.

[![Version](https://img.shields.io/badge/version-0.0.2-blue.svg)](https://pub.dartlang.org/packages/quiz_bank)



<p align="center">
<img src="https://raw.githubusercontent.com/droidbg/quiz_bank/master/readme-assests/demo.gif">
</p>


## Features

- Single line question generator
- Super customizable
	- Randomize the questions
	- Add your own questions
## Getting started

You must add the library as a dependency to your project.
```yaml
dependencies:
 quiz_bank: ^0.0.1
```

You can also reference the git repo directly if you want:
```yaml
dependencies:
 quiz_bank:
   git: git://github.com/droidbg/quiz_bank.git
```


You should then run `flutter packages get`


## Usage
```dart
import 'package:quiz_bank/quiz_bank.dart'
main(){
QuizBrain quiz_brain=QuizBrain(); //Create Object
//Random Question Generate
quiz_brain.RandomQuestion();
//Generate Next Question: return type Void
quiz_brain.nextQuestion();

//Print Question and Correct Options
print(quiz_brain.getQuestionText());
print(quiz_brain.getCorrectAnswer());


}
```

<h3>Example Code </h3>
<br>

```dart
import 'package:flutter/material.dart';
import 'package:quiz_bank/quiz_bank.dart';

void main() => runApp(DemoQuiz());

class DemoQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuestionPage(),
    );
  }
}

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  QuizBrain quiz_brain = QuizBrain();

  RandomText() {
    setState(() {
      quiz_brain.RandomQuestion();
    });
  }

  changeText() {
    setState(() {
      quiz_brain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    String QuestionText = quiz_brain.getQuestionText(); //Question Goes Here
    bool AnswerText = quiz_brain.getCorrectAnswer(); //Answer Goes Here
    return Scaffold(
        appBar: AppBar(title: Text('Quiz Demo')),
        body: Center(
            child: Column(children: [
          SizedBox(
            height: 70.0,
          ),
          Text(
            '$QuestionText',
          ),
          Text(
            '$AnswerText',
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
              child: Text('Next Question'),
              onPressed: () {
                changeText();
              }),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
              child: Text('Random Question'),
              onPressed: () {
                RandomText();
              })
        ])));
  }
}
```
<br><br>
<h3>Output</h3>
<p align="center">
![Output](https://raw.githubusercontent.com/droidbg/quiz_bank/master/readme-assests/demo.gif)
</p>

## Contributions
* If you **found a bug**, open an issue.
* If you **have a feature request**, open an issue.
* If you **want to contribute**, submit a pull request.
## Version compatability

See CHANGELOG for all breaking (and non-breaking) changes.

<hr/>
Made with ❤ by <a href="https://www.linkedin.com/in/binni-goel/">Binni G.</a>
</p>
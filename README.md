# Quiz Bank

A package containing the general quiz questions based on True False. Quiz Bank is super easy to use TRUE FALSE based question bank for Flutter. You may add your own quiz questions in addition to the existing one.

[![Version](https://img.shields.io/badge/version-0.0.1-blue.svg)](https://pub.dartlang.org/packages/quiz_bank)



<p align="center">
<img src=""> 
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
QuizBrain quiz_brain=QuizBrain();
print(quiz_brain.getQuestionText());
print(quiz_brain.getCorrectAnswer());
//Random Question Generate
print(quiz_brain.RandomQuestion());

}
```


## Contributions
* If you **found a bug**, open an issue.
* If you **have a feature request**, open an issue.
* If you **want to contribute**, submit a pull request.
## Version compatability

See CHANGELOG for all breaking (and non-breaking) changes.

<hr/>
Made with ❤ by <a href="https://www.linkedin.com/in/binni-goel/">Binni G.</a>
</p>
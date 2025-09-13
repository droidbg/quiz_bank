# Quiz Bank 🧠

[![pub package](https://img.shields.io/pub/v/quiz_bank.svg)](https://pub.dev/packages/quiz_bank)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)](https://flutter.dev)

A simple Flutter package for true/false quiz questions. Perfect for educational apps, trivia games, and learning platforms.

## ✨ Features

- 🎯 **Easy to Use** - Simple API with just a few lines of code
- 📚 **Built-in Questions** - 20+ questions across different categories
- 🎚️ **Difficulty Levels** - Easy to hard questions
- 🔄 **Quiz Management** - Navigate questions, track scores, shuffle
- ➕ **Custom Questions** - Add your own questions

## 🚀 Quick Start

### 1. Add to pubspec.yaml

```yaml
dependencies:
  quiz_bank: ^1.0.0
```

### 2. Basic Usage

```dart
import 'package:quiz_bank/quiz_bank.dart';

void main() {
  // Create a quiz
  final quiz = QuizBrain();
  
  // Get question and answer
  print(quiz.questionText);      // "Some cats are actually allergic to humans"
  print(quiz.correctAnswer);     // true
  
  // Check if user's answer is correct
  bool userAnswer = true;
  bool isCorrect = quiz.checkAnswer(userAnswer);  // true
  
  // Move to next question
  quiz.nextQuestion();
}
```

### 3. Simple Quiz App

```dart
class MyQuizApp extends StatefulWidget {
  @override
  _MyQuizAppState createState() => _MyQuizAppState();
}

class _MyQuizAppState extends State<MyQuizApp> {
  QuizBrain quiz = QuizBrain();
  int score = 0;

  void _answerQuestion(bool answer) {
    if (quiz.checkAnswer(answer)) {
      score++;
    }
    quiz.nextQuestion();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(quiz.questionText),
          ElevatedButton(
            onPressed: () => _answerQuestion(true),
            child: Text('TRUE'),
          ),
          ElevatedButton(
            onPressed: () => _answerQuestion(false),
            child: Text('FALSE'),
          ),
          Text('Score: $score'),
        ],
      ),
    );
  }
}
```

## 📱 Example App

Check out the `example/` directory for a complete, simple quiz app that shows how to use the package.

## 🎯 More Features

### Different Quiz Types

```dart
// Science questions only
final scienceQuiz = QuizBrain.fromCategory('Science');

// Easy questions only  
final easyQuiz = QuizBrain.fromDifficulty(1);

// Custom questions
final customQuiz = QuizBrain(questions: [
  Question(text: 'Is Flutter awesome?', answer: true),
]);
```

### Quiz Controls

```dart
quiz.nextQuestion();        // Next question
quiz.previousQuestion();    // Previous question  
quiz.randomQuestion();      // Random question
quiz.shuffleQuestions();    // Shuffle all questions
quiz.reset();              // Start over
```

## 📚 API Reference

### Main Methods

| Method | Description |
|--------|-------------|
| `QuizBrain()` | Create a new quiz |
| `quiz.questionText` | Get current question |
| `quiz.correctAnswer` | Get correct answer (true/false) |
| `quiz.checkAnswer(answer)` | Check if answer is correct |
| `quiz.nextQuestion()` | Go to next question |
| `quiz.isFinished` | Check if quiz is done |
| `quiz.totalQuestions` | Get total number of questions |

## 🔄 Upgrading from 0.0.2

Your existing code works with **zero changes**! Just update the version number:

```yaml
dependencies:
  quiz_bank: ^1.0.0  # was ^0.0.2
```

Your old code still works:
```dart
QuizBrain quiz_brain = QuizBrain();
quiz_brain.RandomQuestion();
String text = quiz_brain.getQuestionText();
```

But you can also use the new API:
```dart
QuizBrain quiz = QuizBrain();
quiz.randomQuestion();
String text = quiz.questionText;
```

## 🤝 Contributing

Found a bug or want to add a feature? Open an issue or submit a pull request!

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

---

Made with ❤️ by [Binni G.](https://www.linkedin.com/in/binni-goel/)
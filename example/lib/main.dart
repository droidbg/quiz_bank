import 'package:flutter/material.dart';
import 'package:quiz_bank/quiz_bank.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Quiz App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late QuizBrain quiz;
  int score = 0;
  bool? userAnswer;
  bool showResult = false;

  @override
  void initState() {
    super.initState();
    quiz = QuizBrain();
  }

  void _answerQuestion(bool answer) {
    if (showResult) return;
    
    setState(() {
      userAnswer = answer;
      if (quiz.checkAnswer(answer)) {
        score++;
      }
      showResult = true;
    });
  }

  void _nextQuestion() {
    if (quiz.hasNextQuestion) {
      setState(() {
        quiz.nextQuestion();
        userAnswer = null;
        showResult = false;
      });
    } else {
      _showScore();
    }
  }

  void _showScore() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Complete!'),
        content: Text('Your Score: $score / ${quiz.totalQuestions}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _resetQuiz();
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  void _resetQuiz() {
    setState(() {
      quiz.reset();
      score = 0;
      userAnswer = null;
      showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Quiz'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Progress
            Text('Question ${quiz.currentQuestionNumber} of ${quiz.totalQuestions}'),
            const SizedBox(height: 20),
            
            // Question
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  quiz.questionText,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Answer Buttons
            if (!showResult) ...[
              ElevatedButton(
                onPressed: () => _answerQuestion(true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('TRUE', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => _answerQuestion(false),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('FALSE', style: TextStyle(fontSize: 18)),
              ),
            ] else ...[
              // Result
              Card(
                color: quiz.checkAnswer(userAnswer!) ? Colors.green.shade100 : Colors.red.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Icon(
                        quiz.checkAnswer(userAnswer!) ? Icons.check : Icons.close,
                        size: 50,
                        color: quiz.checkAnswer(userAnswer!) ? Colors.green : Colors.red,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        quiz.checkAnswer(userAnswer!) ? 'Correct!' : 'Wrong!',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text('Answer: ${quiz.correctAnswer ? 'TRUE' : 'FALSE'}'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(quiz.isFinished ? 'See Score' : 'Next Question'),
              ),
            ],
            
            const Spacer(),
            
            // Score
            Text('Score: $score', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

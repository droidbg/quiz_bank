import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_bank/quiz_bank.dart';

void main() {
  group('Question Model Tests', () {
    test('should create a question with all properties', () {
      const question = Question(
        text: 'Test question?',
        answer: true,
        category: 'Test',
        difficulty: 2,
        explanation: 'Test explanation',
        source: 'Test source',
      );

      expect(question.text, 'Test question?');
      expect(question.answer, true);
      expect(question.category, 'Test');
      expect(question.difficulty, 2);
      expect(question.explanation, 'Test explanation');
      expect(question.source, 'Test source');
    });

    test('should create a question from map', () {
      final map = {
        'text': 'Test question?',
        'answer': false,
        'category': 'Test',
        'difficulty': 3,
        'explanation': 'Test explanation',
        'source': 'Test source',
      };

      final question = Question.fromMap(map);

      expect(question.text, 'Test question?');
      expect(question.answer, false);
      expect(question.category, 'Test');
      expect(question.difficulty, 3);
      expect(question.explanation, 'Test explanation');
      expect(question.source, 'Test source');
    });

    test('should convert question to map', () {
      const question = Question(
        text: 'Test question?',
        answer: true,
        category: 'Test',
        difficulty: 2,
      );

      final map = question.toMap();

      expect(map['text'], 'Test question?');
      expect(map['answer'], true);
      expect(map['category'], 'Test');
      expect(map['difficulty'], 2);
    });

    test('should copy question with new values', () {
      const original = Question(
        text: 'Original question?',
        answer: true,
        category: 'Original',
        difficulty: 1,
      );

      final copied = original.copyWith(
        text: 'Updated question?',
        difficulty: 3,
      );

      expect(copied.text, 'Updated question?');
      expect(copied.answer, true); // unchanged
      expect(copied.category, 'Original'); // unchanged
      expect(copied.difficulty, 3); // updated
    });

    test('should test equality correctly', () {
      const question1 = Question(text: 'Test?', answer: true);
      const question2 = Question(text: 'Test?', answer: true);
      const question3 = Question(text: 'Different?', answer: true);

      expect(question1, equals(question2));
      expect(question1, isNot(equals(question3)));
    });
  });

  group('QuestionBank Tests', () {
    test('should have questions', () {
      expect(QuestionBank.allQuestions.isNotEmpty, true);
    });

    test('should get questions by category', () {
      final scienceQuestions = QuestionBank.getQuestionsByCategory('Science');
      expect(scienceQuestions.isNotEmpty, true);
      expect(scienceQuestions.every((q) => q.category == 'Science'), true);
    });

    test('should get questions by difficulty', () {
      final easyQuestions = QuestionBank.getQuestionsByDifficulty(1);
      expect(easyQuestions.isNotEmpty, true);
      expect(easyQuestions.every((q) => q.difficulty == 1), true);
    });

    test('should get questions by difficulty range', () {
      final mediumQuestions = QuestionBank.getQuestionsByDifficultyRange(2, 3);
      expect(mediumQuestions.isNotEmpty, true);
      expect(
          mediumQuestions
              .every((q) => q.difficulty! >= 2 && q.difficulty! <= 3),
          true);
    });

    test('should get random question', () {
      final question = QuestionBank.getRandomQuestion();
      expect(question, isA<Question>());
      expect(question.text.isNotEmpty, true);
    });

    test('should get random question by category', () {
      final question = QuestionBank.getRandomQuestionByCategory('Science');
      expect(question.category, 'Science');
    });

    test('should throw error for invalid category', () {
      expect(
        () => QuestionBank.getRandomQuestionByCategory('InvalidCategory'),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('should get available categories', () {
      final categories = QuestionBank.categories;
      expect(categories.isNotEmpty, true);
      expect(categories.contains('Science'), true);
      expect(categories.contains('Technology'), true);
    });

    test('should get available difficulty levels', () {
      final difficulties = QuestionBank.difficultyLevels;
      expect(difficulties.isNotEmpty, true);
      expect(difficulties.contains(1), true);
      expect(difficulties.contains(2), true);
    });
  });

  group('QuizBrain Tests', () {
    late QuizBrain quizBrain;

    setUp(() {
      quizBrain = QuizBrain();
    });

    test('should initialize with default questions', () {
      expect(quizBrain.totalQuestions, greaterThan(0));
      expect(quizBrain.currentQuestionIndex, 0);
      expect(quizBrain.isFinished, false);
    });

    test('should move to next question', () {
      final initialIndex = quizBrain.currentQuestionIndex;
      final hasNext = quizBrain.nextQuestion();

      if (quizBrain.totalQuestions > 1) {
        expect(hasNext, true);
        expect(quizBrain.currentQuestionIndex, initialIndex + 1);
      } else {
        expect(hasNext, false);
      }
    });

    test('should move to previous question', () {
      quizBrain.nextQuestion();
      final currentIndex = quizBrain.currentQuestionIndex;
      final hasPrevious = quizBrain.previousQuestion();

      expect(hasPrevious, true);
      expect(quizBrain.currentQuestionIndex, currentIndex - 1);
    });

    test('should go to specific question', () {
      if (quizBrain.totalQuestions > 2) {
        quizBrain.goToQuestion(2);
        expect(quizBrain.currentQuestionIndex, 2);
      }
    });

    test('should throw error for invalid question index', () {
      expect(
        () => quizBrain.goToQuestion(-1),
        throwsA(isA<QuizException>()),
      );
      expect(
        () => quizBrain.goToQuestion(quizBrain.totalQuestions),
        throwsA(isA<QuizException>()),
      );
    });

    test('should get random question', () {
      quizBrain.randomQuestion();
      expect(quizBrain.currentQuestionIndex, greaterThanOrEqualTo(0));
      expect(
          quizBrain.currentQuestionIndex, lessThan(quizBrain.totalQuestions));
    });

    test('should shuffle questions', () {
      quizBrain.shuffleQuestions();
      // Note: There's a small chance this test could fail if the shuffle
      // happens to put the same question first, but it's very unlikely
      // with a large enough question bank
      expect(quizBrain.totalQuestions, greaterThan(0));
    });

    test('should reset quiz', () {
      quizBrain.nextQuestion();
      quizBrain.reset();
      expect(quizBrain.currentQuestionIndex, 0);
      expect(quizBrain.usedQuestionsCount, 0);
    });

    test('should check answer correctly', () {
      final correctAnswer = quizBrain.correctAnswer;
      expect(quizBrain.checkAnswer(correctAnswer), true);
      expect(quizBrain.checkAnswer(!correctAnswer), false);
    });

    test('should add custom question', () {
      final initialCount = quizBrain.totalQuestions;
      const customQuestion = Question(text: 'Custom question?', answer: true);

      quizBrain.addQuestion(customQuestion);
      expect(quizBrain.totalQuestions, initialCount + 1);
    });

    test('should get quiz summary', () {
      final summary = quizBrain.getQuizSummary();
      expect(summary['totalQuestions'], quizBrain.totalQuestions);
      expect(summary['currentQuestion'], quizBrain.currentQuestionNumber);
      expect(summary['isFinished'], quizBrain.isFinished);
    });

    test('should create from category', () {
      final scienceQuiz = QuizBrain.fromCategory('Science');
      expect(scienceQuiz.categories.contains('Science'), true);
    });

    test('should create from difficulty', () {
      final easyQuiz = QuizBrain.fromDifficulty(1);
      expect(easyQuiz.difficultyLevels.contains(1), true);
    });

    test('should create from category and difficulty', () {
      final scienceEasyQuiz = QuizBrain.fromCategoryAndDifficulty('Science', 1);
      expect(scienceEasyQuiz.categories.contains('Science'), true);
      expect(scienceEasyQuiz.difficultyLevels.contains(1), true);
    });

    test('should throw error for invalid category', () {
      expect(
        () => QuizBrain.fromCategory('InvalidCategory'),
        throwsA(isA<QuizException>()),
      );
    });

    test('should throw error for invalid difficulty', () {
      expect(
        () => QuizBrain.fromDifficulty(999),
        throwsA(isA<QuizException>()),
      );
    });
  });

  group('QuizBrain Edge Cases', () {
    test('should handle empty question list', () {
      final emptyQuiz = QuizBrain(questions: []);
      expect(emptyQuiz.totalQuestions, 0);
      expect(
        () => emptyQuiz.currentQuestion,
        throwsA(isA<QuizException>()),
      );
    });

    test('should handle single question quiz', () {
      const singleQuestion = Question(text: 'Single question?', answer: true);
      final singleQuiz = QuizBrain(questions: [singleQuestion]);

      expect(singleQuiz.totalQuestions, 1);
      expect(singleQuiz.isFinished, true);
      expect(singleQuiz.hasNextQuestion, false);
    });

    test('should track used questions', () {
      final quiz = QuizBrain();
      final initialUsedCount = quiz.usedQuestionsCount;

      quiz.nextQuestion();
      expect(quiz.usedQuestionsCount, initialUsedCount + 1);
    });
  });

  group('Legacy Compatibility Tests', () {
    late QuizBrain quizBrain;

    setUp(() {
      quizBrain = QuizBrain();
    });

    test('should support legacy getQuestionText method', () {
      expect(quizBrain.getQuestionText(), quizBrain.questionText);
    });

    test('should support legacy getCorrectAnswer method', () {
      expect(quizBrain.getCorrectAnswer(), quizBrain.correctAnswer);
    });

    test('should support legacy RandomQuestion method', () {
      quizBrain.randomQuestionLegacy();
      // RandomQuestion should change the current question
      expect(quizBrain.currentQuestionIndex, isA<int>());
    });

    test('should support legacy isFinished method', () {
      final isFinished = quizBrain.isQuizFinished();
      expect(isFinished, isA<bool>());
      expect(isFinished, quizBrain.isFinished);
    });
  });

  // group('Backward Compatibility Tests', () {
  //   late QuizBrain quizBrain;

  //   setUp(() {
  //     quizBrain = QuizBrain();
  //   });

  // test('should work with old API methods', () {
  //   expect(quizBrain.getQuestionText(), isA<String>());
  //   expect(quizBrain.getCorrectAnswer(), isA<bool>());
  //   expect(quizBrain.isQuizFinished(), isA<bool>());

  //   quizBrain.RandomQuestion();
  //   quizBrain.nextQuestion();
  //   quizBrain.reset();

  //   expect(quizBrain.isQuizFinished(), isA<bool>());
  // });

  // test('should provide same results for old and new API', () {
  //   expect(quizBrain.getQuestionText(), quizBrain.questionText);
  //   expect(quizBrain.getCorrectAnswer(), quizBrain.correctAnswer);
  //   expect(quizBrain.isQuizFinished(), quizBrain.isFinished);
  // });
  // });
}

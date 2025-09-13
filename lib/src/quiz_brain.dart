import 'dart:math';
import 'models/question.dart';
import 'data/question_bank.dart';

/// Exception thrown when quiz operations fail.
class QuizException implements Exception {
  const QuizException(this.message);
  final String message;

  @override
  String toString() => 'QuizException: $message';
}

/// A comprehensive quiz management system with advanced features.
///
/// This class manages the state of a quiz, including the list of questions,
/// the current question index, and user progress. It provides methods for
/// navigating through the quiz, checking answers, and getting quiz information.
class QuizBrain {
  /// Creates a new [QuizBrain] instance.
  ///
  /// [questions] - Optional list of custom questions. If not provided, uses the default question bank.
  /// [shuffle] - Whether to shuffle the questions initially.
  QuizBrain({
    List<Question>? questions,
    bool shuffle = false,
  }) : _questions =
            List<Question>.from(questions ?? QuestionBank.allQuestions) {
    if (shuffle) {
      shuffleQuestions();
    }
  }

  /// Creates a [QuizBrain] with questions from a specific category.
  factory QuizBrain.fromCategory(String category, {bool shuffle = false}) {
    final questions = QuestionBank.getQuestionsByCategory(category);
    if (questions.isEmpty) {
      throw QuizException('No questions found for category: $category');
    }
    return QuizBrain(
        questions: List<Question>.from(questions), shuffle: shuffle);
  }

  /// Creates a [QuizBrain] with questions of a specific difficulty.
  factory QuizBrain.fromDifficulty(int difficulty, {bool shuffle = false}) {
    final questions = QuestionBank.getQuestionsByDifficulty(difficulty);
    if (questions.isEmpty) {
      throw QuizException('No questions found for difficulty: $difficulty');
    }
    return QuizBrain(
        questions: List<Question>.from(questions), shuffle: shuffle);
  }

  /// Creates a [QuizBrain] with questions from a category and difficulty.
  factory QuizBrain.fromCategoryAndDifficulty(
    String category,
    int difficulty, {
    bool shuffle = false,
  }) {
    final questions =
        QuestionBank.getQuestionsByCategoryAndDifficulty(category, difficulty);
    if (questions.isEmpty) {
      throw QuizException(
          'No questions found for category: $category and difficulty: $difficulty');
    }
    return QuizBrain(
        questions: List<Question>.from(questions), shuffle: shuffle);
  }

  final List<Question> _questions;
  final Random _random = Random();

  int _currentQuestionIndex = 0;
  bool _isShuffled = false;
  final Set<int> _usedQuestions = <int>{};

  /// The total number of questions in the quiz.
  int get totalQuestions => _questions.length;

  /// The current question index (0-based).
  int get currentQuestionIndex => _currentQuestionIndex;

  /// The current question number (1-based).
  int get currentQuestionNumber => _currentQuestionIndex + 1;

  /// Whether the quiz has more questions.
  bool get hasNextQuestion => _currentQuestionIndex < _questions.length - 1;

  /// Whether the quiz has previous questions.
  bool get hasPreviousQuestion => _currentQuestionIndex > 0;

  /// Whether the quiz is finished (no more questions).
  bool get isFinished => _currentQuestionIndex >= _questions.length - 1;

  /// The current question.
  Question get currentQuestion {
    if (_questions.isEmpty) {
      throw const QuizException('No questions available');
    }
    if (_currentQuestionIndex >= _questions.length) {
      throw const QuizException('No more questions available');
    }
    return _questions[_currentQuestionIndex];
  }

  /// The text of the current question.
  String get questionText => currentQuestion.text;

  /// The correct answer for the current question.
  bool get correctAnswer => currentQuestion.answer;

  /// The category of the current question.
  String? get currentCategory => currentQuestion.category;

  /// The difficulty of the current question.
  int? get currentDifficulty => currentQuestion.difficulty;

  /// The explanation for the current question.
  String? get currentExplanation => currentQuestion.explanation;

  /// The source of the current question.
  String? get currentSource => currentQuestion.source;

  /// Whether the current question has been used before.
  bool get isCurrentQuestionUsed =>
      _usedQuestions.contains(_currentQuestionIndex);

  /// The number of questions that have been used.
  int get usedQuestionsCount => _usedQuestions.length;

  /// The number of questions remaining.
  int get remainingQuestions => _questions.length - _usedQuestions.length;

  /// Moves to the next question.
  ///
  /// Returns `true` if successfully moved to next question, `false` if already at the end.
  bool nextQuestion() {
    if (hasNextQuestion) {
      _currentQuestionIndex++;
      _usedQuestions.add(_currentQuestionIndex);
      return true;
    }
    return false;
  }

  /// Moves to the previous question.
  ///
  /// Returns `true` if successfully moved to previous question, `false` if already at the beginning.
  bool previousQuestion() {
    if (hasPreviousQuestion) {
      _currentQuestionIndex--;
      return true;
    }
    return false;
  }

  /// Moves to a specific question by index.
  ///
  /// Throws [QuizException] if the index is out of bounds.
  void goToQuestion(int index) {
    if (index < 0 || index >= _questions.length) {
      throw QuizException(
          'Question index $index is out of bounds (0-${_questions.length - 1})');
    }
    _currentQuestionIndex = index;
    _usedQuestions.add(index);
  }

  /// Gets a random question from the available questions.
  ///
  /// [avoidUsed] - Whether to avoid questions that have already been used.
  void randomQuestion({bool avoidUsed = false}) {
    if (_questions.isEmpty) {
      throw const QuizException('No questions available');
    }

    if (avoidUsed && _usedQuestions.length >= _questions.length) {
      throw const QuizException('All questions have been used');
    }

    int randomIndex;
    if (avoidUsed) {
      final availableIndices = List.generate(_questions.length, (i) => i)
          .where((i) => !_usedQuestions.contains(i))
          .toList();
      randomIndex = availableIndices[_random.nextInt(availableIndices.length)];
    } else {
      randomIndex = _random.nextInt(_questions.length);
    }

    _currentQuestionIndex = randomIndex;
    _usedQuestions.add(randomIndex);
  }

  /// Shuffles all questions in the quiz.
  void shuffleQuestions() {
    // Create a new list to avoid modifying the unmodifiable list
    final shuffledQuestions = List<Question>.from(_questions);
    shuffledQuestions.shuffle(_random);
    _questions.clear();
    _questions.addAll(shuffledQuestions);
    _isShuffled = true;
    _usedQuestions.clear();
  }

  /// Resets the quiz to the beginning.
  void reset() {
    _currentQuestionIndex = 0;
    _usedQuestions.clear();
  }

  /// Resets the quiz and shuffles the questions.
  void resetAndShuffle() {
    reset();
    shuffleQuestions();
  }

  /// Adds a custom question to the quiz.
  void addQuestion(Question question) {
    _questions.add(question);
  }

  /// Adds multiple custom questions to the quiz.
  void addQuestions(List<Question> questions) {
    _questions.addAll(questions);
  }

  /// Removes a question at the specified index.
  ///
  /// Throws [QuizException] if the index is out of bounds.
  void removeQuestion(int index) {
    if (index < 0 || index >= _questions.length) {
      throw QuizException('Question index $index is out of bounds');
    }
    _questions.removeAt(index);

    // Adjust current index if necessary
    if (_currentQuestionIndex >= _questions.length) {
      _currentQuestionIndex = _questions.length - 1;
    }

    // Remove from used questions if it was there
    _usedQuestions.remove(index);
  }

  /// Gets all questions in the quiz.
  List<Question> get allQuestions => List.unmodifiable(_questions);

  /// Gets all used question indices.
  List<int> get usedQuestionIndices => List.unmodifiable(_usedQuestions);

  /// Gets all unused question indices.
  List<int> get unusedQuestionIndices {
    return List.generate(_questions.length, (i) => i)
        .where((i) => !_usedQuestions.contains(i))
        .toList();
  }

  /// Gets questions by category from the current quiz.
  List<Question> getQuestionsByCategory(String category) {
    return _questions.where((q) => q.category == category).toList();
  }

  /// Gets questions by difficulty from the current quiz.
  List<Question> getQuestionsByDifficulty(int difficulty) {
    return _questions.where((q) => q.difficulty == difficulty).toList();
  }

  /// Gets all categories present in the current quiz.
  List<String> get categories {
    return _questions
        .map((q) => q.category)
        .where((category) => category != null)
        .cast<String>()
        .toSet()
        .toList()
      ..sort();
  }

  /// Gets all difficulty levels present in the current quiz.
  List<int> get difficultyLevels {
    return _questions
        .map((q) => q.difficulty)
        .where((difficulty) => difficulty != null)
        .cast<int>()
        .toSet()
        .toList()
      ..sort();
  }

  /// Checks if a given answer is correct for the current question.
  bool checkAnswer(bool answer) {
    return answer == correctAnswer;
  }

  /// Gets a summary of the quiz.
  Map<String, dynamic> getQuizSummary() {
    return {
      'totalQuestions': totalQuestions,
      'currentQuestion': currentQuestionNumber,
      'usedQuestions': usedQuestionsCount,
      'remainingQuestions': remainingQuestions,
      'isFinished': isFinished,
      'isShuffled': _isShuffled,
      'categories': categories,
      'difficultyLevels': difficultyLevels,
    };
  }

  // Legacy compatibility methods - will be removed in version 2.0.0

  /// Gets the current question text.
  ///
  /// **Deprecated:** Use `questionText` getter instead.
  @Deprecated(
      'Use questionText getter instead. This will be removed in version 2.0.0')
  String getQuestionText() {
    return questionText;
  }

  /// Gets the correct answer for the current question.
  ///
  /// **Deprecated:** Use `correctAnswer` getter instead.
  @Deprecated(
      'Use correctAnswer getter instead. This will be removed in version 2.0.0')
  bool getCorrectAnswer() {
    return correctAnswer;
  }

  /// Gets a random question.
  ///
  /// **Deprecated:** Use `randomQuestion()` instead.
  @Deprecated(
      'Use randomQuestion() instead. This will be removed in version 2.0.0')
  void randomQuestionLegacy() {
    randomQuestion();
  }

  /// Checks if the quiz is finished.
  ///
  /// **Deprecated:** Use `isFinished` getter instead.
  @Deprecated(
      'Use isFinished getter instead. This will be removed in version 2.0.0')
  bool isQuizFinished() {
    return isFinished;
  }

  @override
  String toString() {
    return 'QuizBrain(totalQuestions: $totalQuestions, currentQuestion: $currentQuestionNumber, isFinished: $isFinished)';
  }
}

import '../models/question.dart';

part 'questions/general_questions.dart';
part 'questions/technology_questions.dart';
part 'questions/geography_questions.dart';
part 'questions/history_questions.dart';
part 'questions/nature_questions.dart';
part 'questions/sports_questions.dart';
part 'questions/entertainment_questions.dart';
part 'questions/food_questions.dart';
part 'questions/health_questions.dart';
part 'questions/science_questions.dart';

/// Predefined question categories.
enum QuestionCategory {
  general,
  science,
  geography,
  history,
  technology,
  nature,
  sports,
  entertainment,
  food,
  health,
}

/// A comprehensive question bank with categorized questions.
///
/// This class provides access to a large collection of true/false questions
/// organized by category and difficulty. It offers methods to retrieve all
/// questions, filter them by specific criteria, and get random questions.
class QuestionBank {
  static final Map<String, List<Question>> _questionsByCategory = {
    'General': _generalQuestions,
    'Technology': _technologyQuestions,
    'Geography': _geographyQuestions,
    'History': _historyQuestions,
    'Nature': _natureQuestions,
    'Sports': _sportsQuestions,
    'Entertainment': _entertainmentQuestions,
    'Food': _foodQuestions,
    'Health': _healthQuestions,
    'Science': _scienceQuestions,
  };

  static List<Question> get _allQuestions =>
      _questionsByCategory.values.expand((questions) => questions).toList();

  /// A list of all questions in the bank.
  static List<Question> get allQuestions => List.unmodifiable(_allQuestions);

  /// Returns a list of questions for a given [category].
  ///
  /// If the category is not found, an empty list is returned.
  static List<Question> getQuestionsByCategory(String category) {
    return _questionsByCategory[category] ?? [];
  }

  /// Returns a list of questions with a specific [difficulty] level.
  static List<Question> getQuestionsByDifficulty(int difficulty) {
    return _allQuestions.where((q) => q.difficulty == difficulty).toList();
  }

  /// Returns a list of questions within a given difficulty range (inclusive).
  static List<Question> getQuestionsByDifficultyRange(int min, int max) {
    return _allQuestions
        .where((q) =>
            q.difficulty != null &&
            q.difficulty! >= min &&
            q.difficulty! <= max)
        .toList();
  }

  /// Returns a list of questions for a given [category] and [difficulty].
  static List<Question> getQuestionsByCategoryAndDifficulty(
      String category, int difficulty) {
    final categoryQuestions = getQuestionsByCategory(category);
    return categoryQuestions.where((q) => q.difficulty == difficulty).toList();
  }

  /// A sorted list of all available categories.
  static List<String> get categories =>
      _questionsByCategory.keys.toList()..sort();

  /// A sorted list of all available difficulty levels.
  static List<int> get difficultyLevels {
    return _allQuestions
        .map((q) => q.difficulty)
        .where((difficulty) => difficulty != null)
        .cast<int>()
        .toSet()
        .toList()
      ..sort();
  }

  /// Returns a random question from the entire bank.
  static Question getRandomQuestion() {
    final random = DateTime.now().millisecondsSinceEpoch % _allQuestions.length;
    return _allQuestions[random];
  }

  /// Returns a random question from a specific [category].
  ///
  /// Throws an [ArgumentError] if the category is not found or has no questions.
  static Question getRandomQuestionByCategory(String category) {
    final categoryQuestions = getQuestionsByCategory(category);
    if (categoryQuestions.isEmpty) {
      throw ArgumentError('No questions found for category: $category');
    }
    final random =
        DateTime.now().millisecondsSinceEpoch % categoryQuestions.length;
    return categoryQuestions[random];
  }

  /// Returns a random question with a specific [difficulty] level.
  ///
  /// Throws an [ArgumentError] if no questions are found for the given difficulty.
  static Question getRandomQuestionByDifficulty(int difficulty) {
    final difficultyQuestions = getQuestionsByDifficulty(difficulty);
    if (difficultyQuestions.isEmpty) {
      throw ArgumentError('No questions found for difficulty: $difficulty');
    }
    final random =
        DateTime.now().millisecondsSinceEpoch % difficultyQuestions.length;
    return difficultyQuestions[random];
  }
}

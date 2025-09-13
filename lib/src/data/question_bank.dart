import '../models/question.dart';

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
class QuestionBank {
  static const List<Question> _questions = [
    // General Knowledge
    Question(
      text: 'Some cats are actually allergic to humans',
      answer: true,
      category: 'General',
      difficulty: 2,
      explanation: 'Yes, some cats can develop allergies to human dander, similar to how humans can be allergic to cats.',
    ),
    Question(
      text: 'India drives on the right side of the road',
      answer: false,
      category: 'General',
      difficulty: 1,
      explanation: 'India drives on the left side of the road, a legacy from British colonial rule.',
    ),
    Question(
      text: 'Most Indians are vegetarians',
      answer: true,
      category: 'General',
      difficulty: 2,
      explanation: 'While not all Indians are vegetarian, a significant portion of the population follows vegetarian diets due to cultural and religious reasons.',
    ),
    Question(
      text: 'Google was originally called "Backrub"',
      answer: true,
      category: 'Technology',
      difficulty: 3,
      explanation: 'Google was indeed originally called "Backrub" before being renamed to Google.',
    ),
    Question(
      text: 'Squid Game was made in India',
      answer: false,
      category: 'Entertainment',
      difficulty: 1,
      explanation: 'Squid Game is a South Korean television series created by Hwang Dong-hyuk.',
    ),

    // Science
    Question(
      text: 'As a human body grows larger, its number of bones gets smaller',
      answer: true,
      category: 'Science',
      difficulty: 3,
      explanation: 'Babies are born with around 270 bones, but many fuse together as they grow, resulting in 206 bones in adults.',
    ),
    Question(
      text: 'The total surface area of two human lungs is approximately 70 square metres',
      answer: true,
      category: 'Science',
      difficulty: 4,
      explanation: 'The lungs have a massive surface area due to the millions of tiny air sacs (alveoli) for gas exchange.',
    ),
    Question(
      text: 'Water boils at 100 degrees Celsius at sea level',
      answer: true,
      category: 'Science',
      difficulty: 1,
      explanation: 'Water boils at 100°C (212°F) at standard atmospheric pressure (sea level).',
    ),
    Question(
      text: 'The Earth is flat',
      answer: false,
      category: 'Science',
      difficulty: 1,
      explanation: 'The Earth is approximately spherical, not flat.',
    ),
    Question(
      text: 'Lightning never strikes the same place twice',
      answer: false,
      category: 'Science',
      difficulty: 2,
      explanation: 'Lightning can and does strike the same place multiple times. Tall buildings and structures are often hit repeatedly.',
    ),
    Question(
      text: 'A bolt of lightning contains enough energy to toast 100,000 slices of bread',
      answer: true,
      category: 'Science',
      difficulty: 4,
      explanation: 'A single lightning bolt can contain up to 1 billion volts of electricity, which is indeed enough energy to toast that many slices.',
    ),
    Question(
      text: 'Hot and cold water sound the same when you pour them',
      answer: false,
      category: 'Science',
      difficulty: 3,
      explanation: 'Hot water has a higher pitch when poured due to lower viscosity and faster molecular movement.',
    ),

    // Geography
    Question(
      text: 'Bangalore is the "Silicon Valley of India"',
      answer: true,
      category: 'Geography',
      difficulty: 2,
      explanation: 'Bangalore (now Bengaluru) is indeed known as the Silicon Valley of India due to its thriving IT industry.',
    ),
    Question(
      text: 'You can hear a blue whale\'s heartbeat from two miles away',
      answer: true,
      category: 'Nature',
      difficulty: 3,
      explanation: 'Blue whales have extremely powerful hearts that can be detected from great distances underwater.',
    ),

    // History
    Question(
      text: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place',
      answer: true,
      category: 'History',
      difficulty: 4,
      explanation: 'This is an old British law that technically still exists, though it\'s rarely invoked in modern times.',
    ),

    // Nature
    Question(
      text: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant',
      answer: false,
      category: 'Nature',
      difficulty: 3,
      explanation: 'The loudest animal is actually the sperm whale, which can produce sounds up to 230 decibels. The African elephant produces sounds around 117 decibels.',
    ),
    Question(
      text: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog',
      answer: true,
      category: 'Health',
      difficulty: 2,
      explanation: 'Chocolate contains theobromine, which is toxic to dogs and can cause serious health problems or death.',
    ),

    // Technology
    Question(
      text: 'The first computer bug was an actual insect',
      answer: true,
      category: 'Technology',
      difficulty: 3,
      explanation: 'The term "bug" in computing comes from Grace Hopper finding an actual moth stuck in a computer in 1947.',
    ),
    Question(
      text: 'WiFi stands for "Wireless Fidelity"',
      answer: false,
      category: 'Technology',
      difficulty: 2,
      explanation: 'WiFi doesn\'t actually stand for anything. It\'s just a trademarked term that sounds like "Hi-Fi" (High Fidelity).',
    ),

    // Sports
    Question(
      text: 'A soccer ball has 32 panels',
      answer: true,
      category: 'Sports',
      difficulty: 3,
      explanation: 'Traditional soccer balls have 32 panels - 12 pentagons and 20 hexagons.',
    ),
    Question(
      text: 'The Olympics were held every year until 1992',
      answer: false,
      category: 'Sports',
      difficulty: 2,
      explanation: 'The Olympics have been held every four years since 1896, with some exceptions for world wars.',
    ),

    // Food
    Question(
      text: 'Honey never spoils',
      answer: true,
      category: 'Food',
      difficulty: 2,
      explanation: 'Honey has natural preservatives and low moisture content, making it virtually impossible to spoil.',
    ),
    Question(
      text: 'Carrots improve your eyesight',
      answer: false,
      category: 'Food',
      difficulty: 2,
      explanation: 'While carrots contain vitamin A which is good for eye health, they don\'t actually improve eyesight beyond normal levels.',
    ),
  ];

  /// Gets all questions in the bank.
  static List<Question> get allQuestions => List.unmodifiable(_questions);

  /// Gets questions by category.
  static List<Question> getQuestionsByCategory(String category) {
    return _questions.where((q) => q.category == category).toList();
  }

  /// Gets questions by difficulty level.
  static List<Question> getQuestionsByDifficulty(int difficulty) {
    return _questions.where((q) => q.difficulty == difficulty).toList();
  }

  /// Gets questions within a difficulty range.
  static List<Question> getQuestionsByDifficultyRange(int min, int max) {
    return _questions
        .where((q) => q.difficulty != null && q.difficulty! >= min && q.difficulty! <= max)
        .toList();
  }

  /// Gets questions by category and difficulty.
  static List<Question> getQuestionsByCategoryAndDifficulty(String category, int difficulty) {
    return _questions
        .where((q) => q.category == category && q.difficulty == difficulty)
        .toList();
  }

  /// Gets all available categories.
  static List<String> get categories {
    return _questions
        .map((q) => q.category)
        .where((category) => category != null)
        .cast<String>()
        .toSet()
        .toList()
      ..sort();
  }

  /// Gets all available difficulty levels.
  static List<int> get difficultyLevels {
    return _questions
        .map((q) => q.difficulty)
        .where((difficulty) => difficulty != null)
        .cast<int>()
        .toSet()
        .toList()
      ..sort();
  }

  /// Gets a random question from the bank.
  static Question getRandomQuestion() {
    final random = DateTime.now().millisecondsSinceEpoch % _questions.length;
    return _questions[random];
  }

  /// Gets a random question from a specific category.
  static Question getRandomQuestionByCategory(String category) {
    final categoryQuestions = getQuestionsByCategory(category);
    if (categoryQuestions.isEmpty) {
      throw ArgumentError('No questions found for category: $category');
    }
    final random = DateTime.now().millisecondsSinceEpoch % categoryQuestions.length;
    return categoryQuestions[random];
  }

  /// Gets a random question with specific difficulty.
  static Question getRandomQuestionByDifficulty(int difficulty) {
    final difficultyQuestions = getQuestionsByDifficulty(difficulty);
    if (difficultyQuestions.isEmpty) {
      throw ArgumentError('No questions found for difficulty: $difficulty');
    }
    final random = DateTime.now().millisecondsSinceEpoch % difficultyQuestions.length;
    return difficultyQuestions[random];
  }
}

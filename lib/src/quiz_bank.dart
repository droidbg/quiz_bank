/// A comprehensive Flutter package providing true/false quiz questions with categories, difficulty levels, and easy customization.
/// 
/// This package is perfect for educational apps, trivia games, and learning platforms.
/// 
/// ## Features
/// 
/// - **Rich Question Model**: Questions with text, answers, categories, difficulty levels, explanations, and sources
/// - **Categorized Questions**: Pre-organized questions across multiple categories (Science, Technology, Geography, etc.)
/// - **Difficulty Levels**: Questions ranging from easy (1) to hard (5)
/// - **Flexible Quiz Management**: Create quizzes from specific categories, difficulties, or custom question sets
/// - **Advanced Navigation**: Move forward/backward, jump to specific questions, or get random questions
/// - **Question Tracking**: Keep track of used and unused questions
/// - **Shuffling**: Randomize question order for varied experiences
/// - **Custom Questions**: Add your own questions to the quiz
/// - **Comprehensive API**: Intuitive methods and getters for all quiz operations
/// 
/// ## Quick Start
/// 
/// ```dart
/// import 'package:quiz_bank/quiz_bank.dart';
/// 
/// void main() {
///   // Create a basic quiz
///   final quiz = QuizBrain();
///   
///   // Get current question
///   print(quiz.questionText);
///   print(quiz.correctAnswer);
///   
///   // Move to next question
///   quiz.nextQuestion();
///   
///   // Check if answer is correct
///   bool userAnswer = true;
///   bool isCorrect = quiz.checkAnswer(userAnswer);
/// }
/// ```
/// 
/// ## Advanced Usage
/// 
/// ```dart
/// // Create quiz from specific category
/// final scienceQuiz = QuizBrain.fromCategory('Science');
/// 
/// // Create quiz with specific difficulty
/// final easyQuiz = QuizBrain.fromDifficulty(1);
/// 
/// // Create quiz with custom questions
/// final customQuiz = QuizBrain(questions: [
///   Question(text: 'Custom question?', answer: true),
/// ]);
/// 
/// // Shuffle questions
/// quiz.shuffleQuestions();
/// 
/// // Get random question
/// quiz.randomQuestion();
/// 
/// // Add custom questions
/// quiz.addQuestion(Question(text: 'New question?', answer: false));
/// ```
/// 
/// ## Question Categories
/// 
/// The package includes questions in the following categories:
/// - General Knowledge
/// - Science
/// - Technology
/// - Geography
/// - History
/// - Nature
/// - Sports
/// - Entertainment
/// - Food
/// - Health
/// 
/// ## Difficulty Levels
/// 
/// Questions are rated from 1 (easiest) to 5 (hardest):
/// - **Level 1**: Basic knowledge questions
/// - **Level 2**: Intermediate questions
/// - **Level 3**: Advanced questions
/// - **Level 4**: Expert-level questions
/// - **Level 5**: Master-level questions
/// 
/// ## API Reference
/// 
/// ### QuizBrain Class
/// 
/// The main class for managing quiz functionality.
/// 
/// **Constructors:**
/// - `QuizBrain({List<Question>? questions, bool shuffle = false})` - Create with custom questions
/// - `QuizBrain.fromCategory(String category, {bool shuffle = false})` - Create from category
/// - `QuizBrain.fromDifficulty(int difficulty, {bool shuffle = false})` - Create from difficulty
/// - `QuizBrain.fromCategoryAndDifficulty(String category, int difficulty, {bool shuffle = false})` - Create from both
/// 
/// **Navigation Methods:**
/// - `bool nextQuestion()` - Move to next question
/// - `bool previousQuestion()` - Move to previous question
/// - `void goToQuestion(int index)` - Jump to specific question
/// - `void randomQuestion({bool avoidUsed = false})` - Get random question
/// 
/// **Quiz Management:**
/// - `void shuffleQuestions()` - Shuffle all questions
/// - `void reset()` - Reset to beginning
/// - `void resetAndShuffle()` - Reset and shuffle
/// - `void addQuestion(Question question)` - Add custom question
/// - `void addQuestions(List<Question> questions)` - Add multiple questions
/// 
/// **Getters:**
/// - `int get totalQuestions` - Total number of questions
/// - `int get currentQuestionIndex` - Current question index (0-based)
/// - `int get currentQuestionNumber` - Current question number (1-based)
/// - `bool get hasNextQuestion` - Whether there are more questions
/// - `bool get isFinished` - Whether quiz is complete
/// - `Question get currentQuestion` - Current question object
/// - `String get questionText` - Current question text
/// - `bool get correctAnswer` - Current question's correct answer
/// 
/// **Answer Checking:**
/// - `bool checkAnswer(bool answer)` - Check if answer is correct
/// 
/// ### Question Class
/// 
/// Represents a quiz question with metadata.
/// 
/// **Properties:**
/// - `String text` - Question text
/// - `bool answer` - Correct answer (true/false)
/// - `String? category` - Question category
/// - `int? difficulty` - Difficulty level (1-5)
/// - `String? explanation` - Answer explanation
/// - `String? source` - Question source
/// 
/// **Methods:**
/// - `Question.fromMap(Map<String, dynamic> map)` - Create from map
/// - `Map<String, dynamic> toMap()` - Convert to map
/// - `Question copyWith(...)` - Create copy with modified fields
/// 
/// ### QuestionBank Class
/// 
/// Static class providing access to predefined questions.
/// 
/// **Methods:**
/// - `List<Question> get allQuestions` - All available questions
/// - `List<Question> getQuestionsByCategory(String category)` - Questions by category
/// - `List<Question> getQuestionsByDifficulty(int difficulty)` - Questions by difficulty
/// - `List<Question> getQuestionsByDifficultyRange(int min, int max)` - Questions in difficulty range
/// - `Question getRandomQuestion()` - Random question
/// - `Question getRandomQuestionByCategory(String category)` - Random question from category
/// - `Question getRandomQuestionByDifficulty(int difficulty)` - Random question with difficulty
/// - `List<String> get categories` - Available categories
/// - `List<int> get difficultyLevels` - Available difficulty levels
/// 
/// ## Error Handling
/// 
/// The package includes comprehensive error handling with custom exceptions:
/// 
/// ```dart
/// try {
///   final quiz = QuizBrain.fromCategory('InvalidCategory');
/// } on QuizException catch (e) {
///   print('Quiz error: ${e.message}');
/// }
/// ```
/// 
/// ## Examples
/// 
/// See the `example/` directory for a complete Flutter app demonstrating all features.
/// 
/// ## Contributing
/// 
/// Contributions are welcome! Please feel free to submit issues and pull requests.
/// 
/// ## License
/// 
/// This package is licensed under the MIT License.
library quiz_bank;

// Core classes
export 'quiz_brain.dart';
export 'models/question.dart';
export 'data/question_bank.dart';
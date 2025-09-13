# Migration Guide: 0.0.2 → 1.0.0

This guide helps you migrate your code from quiz_bank 0.0.2 to 1.0.0. The new version includes significant improvements but introduces breaking changes.

## 🚨 Breaking Changes

### 1. Class Name Changes

**Old (0.0.2):**
```dart
QuizBrain quiz_brain = QuizBrain();
```

**New (1.0.0):**
```dart
QuizBrain quizBrain = QuizBrain();
// or use the legacy compatibility layer
LegacyQuizBrain quiz_brain = LegacyQuizBrain();
```

### 2. Method Name Changes

| Old Method (0.0.2) | New Method (1.0.0) | Type Change |
|-------------------|-------------------|-------------|
| `getQuestionText()` | `questionText` | Method → Getter |
| `getCorrectAnswer()` | `correctAnswer` | Method → Getter |
| `RandomQuestion()` | `randomQuestion()` | Capitalization |
| `isFinished()` | `isFinished` | Method → Getter |
| `nextQuestion()` | `nextQuestion()` | ✅ Unchanged |
| `reset()` | `reset()` | ✅ Unchanged |

### 3. API Improvements

**Old (0.0.2):**
```dart
QuizBrain quiz_brain = QuizBrain();
quiz_brain.RandomQuestion();
quiz_brain.nextQuestion();

String questionText = quiz_brain.getQuestionText();
bool correctAnswer = quiz_brain.getCorrectAnswer();
bool finished = quiz_brain.isFinished();
```

**New (1.0.0):**
```dart
QuizBrain quizBrain = QuizBrain();
quizBrain.randomQuestion();
quizBrain.nextQuestion();

String questionText = quizBrain.questionText;
bool correctAnswer = quizBrain.correctAnswer;
bool finished = quizBrain.isFinished;
```

## 🔄 Migration Options

### Option 1: Keep Using QuizBrain (Recommended for Quick Migration)

Your existing code will work with minimal changes! The new `QuizBrain` class includes all the old methods with deprecation warnings:

```dart
// Your existing code works with deprecation warnings
QuizBrain quiz_brain = QuizBrain();  // Same as before!

quiz_brain.RandomQuestion();         // Works, but shows deprecation warning
quiz_brain.nextQuestion();           // Works unchanged
String questionText = quiz_brain.getQuestionText();  // Works, but shows deprecation warning
bool correctAnswer = quiz_brain.getCorrectAnswer();  // Works, but shows deprecation warning
bool finished = quiz_brain.isFinished();             // Works, but shows deprecation warning
```

**Benefits:**
- ✅ **Zero code changes required** - your existing code works as-is!
- ✅ Existing code continues to work
- ⚠️ Deprecation warnings will guide you to new API
- ✅ Access to all new features when you're ready

### Option 2: Gradual Migration (Recommended for Long-term)

Update your code to use the new API gradually:

```dart
import 'package:quiz_bank/quiz_bank.dart';

// Use the new QuizBrain class (same as before)
QuizBrain quizBrain = QuizBrain();

// Update method calls one by one
quizBrain.randomQuestion();        // was RandomQuestion()
quizBrain.nextQuestion();          // unchanged
String questionText = quizBrain.questionText;      // was getQuestionText()
bool correctAnswer = quizBrain.correctAnswer;      // was getCorrectAnswer()
bool finished = quizBrain.isFinished;              // was isFinished()
```

**Benefits:**
- ✅ Access to all new features
- ✅ Better performance
- ✅ Future-proof code
- ✅ No deprecation warnings
- ✅ Migrate at your own pace

## 🆕 New Features Available After Migration

### 1. Rich Question Model
```dart
// Access question metadata
String? category = quizBrain.currentCategory;
int? difficulty = quizBrain.currentDifficulty;
String? explanation = quizBrain.currentExplanation;
```

### 2. Advanced Navigation
```dart
// Navigate in both directions
quizBrain.previousQuestion();
quizBrain.goToQuestion(5);

// Get random questions
quizBrain.randomQuestion(avoidUsed: true);
```

### 3. Question Management
```dart
// Add custom questions
quizBrain.addQuestion(Question(
  text: 'Custom question?',
  answer: true,
  category: 'Custom',
  difficulty: 2,
));

// Shuffle questions
quizBrain.shuffleQuestions();
```

### 4. Quiz Statistics
```dart
// Track progress
print('Total questions: ${quizBrain.totalQuestions}');
print('Current question: ${quizBrain.currentQuestionNumber}');
print('Used questions: ${quizBrain.usedQuestionsCount}');
print('Remaining: ${quizBrain.remainingQuestions}');
```

### 5. Categorized Quizzes
```dart
// Create quizzes by category
final scienceQuiz = QuizBrain.fromCategory('Science');
final easyQuiz = QuizBrain.fromDifficulty(1);
final customQuiz = QuizBrain.fromCategoryAndDifficulty('Science', 1);
```

## 📝 Step-by-Step Migration

### Step 1: Update Dependencies
```yaml
dependencies:
  quiz_bank: ^1.0.0  # was ^0.0.2
```

### Step 2: Choose Migration Path

**For Quick Migration:**
1. Replace `QuizBrain` with `LegacyQuizBrain`
2. Keep existing method calls
3. Address deprecation warnings gradually

**For Full Migration:**
1. Update method calls according to the table above
2. Consider using new features
3. Remove any custom question handling (now built-in)

### Step 3: Test Your Code
```bash
flutter test
```

### Step 4: Address Deprecation Warnings
The compiler will show deprecation warnings for old methods. Update them one by one:

```dart
// Before (deprecated)
String text = quiz_brain.getQuestionText();

// After (modern)
String text = quiz_brain.questionText;
```

## 🆘 Common Issues and Solutions

### Issue: "Method not found"
**Solution:** You're using the old API. Either use `LegacyQuizBrain` or update to the new API.

### Issue: "Deprecation warnings"
**Solution:** These are helpful! Follow the suggestions in the warnings to update your code.

### Issue: "No questions available"
**Solution:** The new API has better error handling. Check if you're creating the quiz correctly.

## 📚 Additional Resources

- [Full API Documentation](https://pub.dev/documentation/quiz_bank/latest/)
- [Example App](example/) - Complete Flutter app showing all features
- [GitHub Issues](https://github.com/droidbg/quiz_bank/issues) - Report problems or ask questions

## 🗓️ Timeline

- **Version 1.0.0**: Current version with legacy compatibility
- **Version 1.5.0**: Enhanced features, legacy compatibility maintained
- **Version 2.0.0**: Legacy compatibility removed, new features only

## 💡 Tips for Migration

1. **Start with LegacyQuizBrain** for immediate compatibility
2. **Migrate gradually** - update one method at a time
3. **Use the new features** - they provide much more functionality
4. **Test thoroughly** - the new API is more robust
5. **Read the documentation** - many new features are available

## 🤝 Need Help?

If you encounter issues during migration:

1. Check this migration guide
2. Look at the example app
3. Read the API documentation
4. Open an issue on GitHub
5. Ask questions in the Flutter community

---

**Happy migrating! 🚀**

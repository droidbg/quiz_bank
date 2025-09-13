/// Represents a quiz question with its text, answer, and metadata.
class Question {
  /// The question text to display to the user.
  final String text;

  /// The correct answer (true or false).
  final bool answer;

  /// Optional category for organizing questions.
  final String? category;

  /// Optional difficulty level (1-5, where 5 is hardest).
  final int? difficulty;

  /// Optional explanation for the answer.
  final String? explanation;

  /// Optional source or reference for the question.
  final String? source;

  /// Creates a new [Question] instance.
  const Question({
    required this.text,
    required this.answer,
    this.category,
    this.difficulty,
    this.explanation,
    this.source,
  });

  /// Creates a [Question] from a map (useful for JSON deserialization).
  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      text: map['text'] as String,
      answer: map['answer'] as bool,
      category: map['category'] as String?,
      difficulty: map['difficulty'] as int?,
      explanation: map['explanation'] as String?,
      source: map['source'] as String?,
    );
  }

  /// Converts this [Question] to a map (useful for JSON serialization).
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'answer': answer,
      if (category != null) 'category': category,
      if (difficulty != null) 'difficulty': difficulty,
      if (explanation != null) 'explanation': explanation,
      if (source != null) 'source': source,
    };
  }

  /// Creates a copy of this [Question] with the given fields replaced.
  Question copyWith({
    String? text,
    bool? answer,
    String? category,
    int? difficulty,
    String? explanation,
    String? source,
  }) {
    return Question(
      text: text ?? this.text,
      answer: answer ?? this.answer,
      category: category ?? this.category,
      difficulty: difficulty ?? this.difficulty,
      explanation: explanation ?? this.explanation,
      source: source ?? this.source,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Question &&
        other.text == text &&
        other.answer == answer &&
        other.category == category &&
        other.difficulty == difficulty &&
        other.explanation == explanation &&
        other.source == source;
  }

  @override
  int get hashCode {
    return Object.hash(
      text,
      answer,
      category,
      difficulty,
      explanation,
      source,
    );
  }

  @override
  String toString() {
    return 'Question(text: $text, answer: $answer, category: $category, difficulty: $difficulty)';
  }
}

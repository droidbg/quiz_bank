import 'dart:math';

class Question {
  String questionText;
  bool questionAnswer;
  Question(this.questionText, this.questionAnswer);
}

class QuizBrain {
  int _questionNumber = 0;
//General Questions
  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('Lions are one of the oldest living species', false),
    Question('India drives on the right side of the road.', false),
    Question('Most Indians are Vegetarians', true),
    Question('Squid Game was made in India', false),
    Question('As a human body grows larger, its number of bones gets smaller.',
        true),
    Question('Bangalore is the "Silicon Valley of India.', true),
    Question('Lightning never strikes the same place twice', false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question('Hot and cold water sound the same when you pour them.', false),
    Question(
        'A bolt of lightning contains enough energy to toast 100,000 slices of bread.',
        true),
    Question(
        'You can hear a blue whale\'s heartbeat from two miles away', true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  void RandomQuestion() {
    Random random = new Random();
    int randomNumber = random.nextInt(_questionBank.length);
    _questionNumber = randomNumber;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print("At the End");
      return true;
    } else
      return false;
  }

  reset() {
    _questionNumber = 0;
  }
}

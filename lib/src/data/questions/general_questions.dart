part of '../question_bank.dart';

const List<Question> _generalQuestions = [
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
  Question(
    text: 'A standard basketball hoop is 10 feet high',
    answer: true,
    category: 'Sports',
    difficulty: 1,
    explanation: 'The rim of a standard basketball hoop is 10 feet (3.05 meters) above the ground.',
  ),
  Question(
    text: 'The game of baseball has 9 innings',
    answer: true,
    category: 'Sports',
    difficulty: 1,
    explanation: 'A professional baseball game consists of 9 innings.',
  ),
  Question(
    text: 'The Super Bowl is the championship game of the National Football League (NFL)',
    answer: true,
    category: 'Sports',
    difficulty: 1,
    explanation: 'The Super Bowl is the annual championship game of the NFL.',
  ),
  Question(
    text: 'The Tour de France is a famous cycling race',
    answer: true,
    category: 'Sports',
    difficulty: 1,
    explanation: 'The Tour de France is an annual men\'s multiple stage bicycle race primarily held in France.',
  ),
  Question(
    text: 'The Stanley Cup is the championship trophy of the National Hockey League (NHL)',
    answer: true,
    category: 'Sports',
    difficulty: 2,
    explanation: 'The Stanley Cup is the championship trophy awarded annually to the NHL playoff winner.',
  ),
  Question(
    text: 'The FIFA World Cup is held every 4 years',
    answer: true,
    category: 'Sports',
    difficulty: 1,
    explanation: 'The FIFA World Cup is an international association football competition contested by the senior men\'s national teams of the members of the Fédération Internationale de Football Association (FIFA), the sport\'s global governing body.',
  ),
  Question(
    text: 'The Masters Tournament is a major golf championship',
    answer: true,
    category: 'Sports',
    difficulty: 2,
    explanation: 'The Masters Tournament is one of the four major championships in professional golf.',
  ),
  Question(
    text: 'Wimbledon is a major tennis tournament',
    answer: true,
    category: 'Sports',
    difficulty: 2,
    explanation: 'The Championships, Wimbledon, commonly known simply as Wimbledon or The Championships, is the oldest tennis tournament in the world and is regarded by many as the most prestigious.',
  ),
  Question(
    text: 'The Kentucky Derby is a famous horse race',
    answer: true,
    category: 'Sports',
    difficulty: 2,
    explanation: 'The Kentucky Derby is a horse race held annually in Louisville, Kentucky, United States, on the first Saturday in May, capping the two-week-long Kentucky Derby Festival.',
  ),
  Question(
    text: 'The Daytona 500 is a famous car race',
    answer: true,
    category: 'Sports',
    difficulty: 2,
    explanation: 'The Daytona 500 is a 500-mile-long (805 km) NASCAR Cup Series motor race held annually at Daytona International Speedway in Daytona Beach, Florida.',
  ),
  Question(
    text: 'The Boston Marathon is the world\'s oldest annual marathon',
    answer: true,
    category: 'Sports',
    difficulty: 3,
    explanation: 'The Boston Marathon is an annual marathon race hosted by several cities in greater Boston in eastern Massachusetts, United States.',
  ),
  Question(
    text: 'The America\'s Cup is a famous sailing race',
    answer: true,
    category: 'Sports',
    difficulty: 3,
    explanation: 'The America\'s Cup, informally known as the Auld Mug, is a trophy awarded to the winner of the America\'s Cup match races between two sailing yachts.',
  ),
  Question(
    text: 'The Cricket World Cup is held every 4 years',
    answer: true,
    category: 'Sports',
    difficulty: 2,
    explanation: 'The ICC Cricket World Cup is the international championship of One Day International (ODI) cricket.',
  ),
];

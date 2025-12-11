class Quiz {
  final int id;
  final String question;
  final List<String> options;
  final List<String>? optionsImages;
  final int correctAnswer;

  static int score = 0;

  Quiz({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswer,
    this.optionsImages,
  });

  static List<Quiz> pokemonDataset = [
    Quiz(
      id: 1,
      question: 'What is the name of this Pokémon?',
      options: ['Bulbasaur', 'Charmander', 'Squirtle', 'Pikachu'],
      correctAnswer: 0,
    ),
    Quiz(
      id: 2,
      question: 'What type is this Pokémon?',
      options: ['Fire', 'Water', 'Grass', 'Electric'],
      correctAnswer: 1,
    ),
    Quiz(
      id: 3,
      question: 'Which move does this Pokémon learn at level 10?',
      options: ['Tackle', 'Ember', 'Water Gun', 'Vine Whip'],
      correctAnswer: 2,
    ),
    Quiz(
      id: 4,
      question: 'What is the evolution of this Pokémon?',
      options: ['Ivysaur', 'Charmeleon', 'Wartortle', 'Raichu'],
      correctAnswer: 3,
    ),
  ];

  void caculateScore(int selectedAnswer) {
    score = 0;
    // for (Quiz quiz in pokemonDataset) {
    //   if (quiz.correctAnswer == selectedAnswer) {
    //     score++;
    //   }
    // }

    if (correctAnswer == selectedAnswer) {
      score++;
    }
    print('Current Score: $score');
  }
}

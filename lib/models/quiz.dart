class Quiz {
  final String question;
  final List<String> options;
  final List<String> optionImages;
  final int correctAnswer;

  // counter for our score
  static int scores = 0;

  Quiz({
    required this.question,
    required this.options,
    required this.optionImages,
    required this.correctAnswer,
  });

  static List<Quiz> pokemonDataset = [
    Quiz(
      question: "Whose attacks have affinity of electricity?",
      options: ["Thunder", "Flamethrower", "Water Gun", "Vine Whip"],
      optionImages: [
        "assets/images/image 1.png",
        "assets/images/image 2.png",
        "assets/images/image 3.png",
        "assets/images/image 4.png",
      ],
      correctAnswer: 0,
    ),
    Quiz(
      question: "Whose attacks have affinity of fire?",
      options: ["Thunder", "Flamethrower", "Water Gun", "Vine Whip"],
      optionImages: [
        "assets/images/image 1.png",
        "assets/images/image 2.png",
        "assets/images/image 3.png",
        "assets/images/image 4.png",
      ],
      correctAnswer: 1,
    ),

    Quiz(
      question: "Whose attacks have affinity of water?",
      options: ["Thunder", "Flamethrower", "Water Gun", "Vine Whip"],
      optionImages: [
        "assets/images/image 1.png",
        "assets/images/image 2.png",
        "assets/images/image 3.png",
        "assets/images/image 4.png",
      ],
      correctAnswer: 2,
    ),

    Quiz(
      question: "Whose attacks have affinity of grass?",
      options: ["Thunder", "Flamethrower", "Water Gun", "Vine Whip"],
      optionImages: [
        "assets/images/image 1.png",
        "assets/images/image 2.png",
        "assets/images/image 3.png",
        "assets/images/image 4.png",
      ],
      correctAnswer: 3,
    ),

    Quiz(
      question: "Which Pokémon can naturally learn Vine Whip?",
      options: ["Pikachu", "Charmander", "Squirtle", "Bulbasaur"],
      optionImages: [
        "assets/images/image 1.png",
        "assets/images/image 2.png",
        "assets/images/image 3.png",
        "assets/images/image 4.png",
      ],
      correctAnswer: 3,
    ),

    Quiz(
      question: "Which Pokémon is known for using Water Gun?",
      options: ["Pikachu", "Charmander", "Squirtle", "Bulbasaur"],
      optionImages: [
        "assets/images/image 1.png",
        "assets/images/image 2.png",
        "assets/images/image 3.png",
        "assets/images/image 4.png",
      ],
      correctAnswer: 2,
    ),
  ];


  // to calculate socres
  static void calculateScores(Quiz quiz, int selectedAnswer) {
    if (selectedAnswer == quiz.correctAnswer) {
      scores += 1;
    }
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokemon_quiz/models/quiz.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var quizes = Quiz.pokemonDataset;
  int quizQuestionCounter = 0;
  int? selectedOptionIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple[100]!, Colors.grey[100]!],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Center(
                  child: Text(
                    "$quizQuestionCounter of 4",
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 6),
                LinearProgressIndicator(),

                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(4),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: .5, sigmaY: .5),
                    child: Text(
                      quizes[quizQuestionCounter].question,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 6),
                Text("Select One"),

                // One Option
                SizedBox(height: 20),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return SelectionOption(
                        quiz: quizes[quizQuestionCounter].options[index],
                        isSelected: selectedOptionIndex == index,
                        onSelected: (value) {
                          setState(() {
                            selectedOptionIndex = value ? index : null;
                            print(selectedOptionIndex);

                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 30),
                    itemCount: quizes[quizQuestionCounter].options.length,
                  ),
                ),

                //? Buttons
                SizedBox(height: 6),
                Divider(height: 1),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (quizQuestionCounter > 0) {
                            quizQuestionCounter--;
                          }
                        });

                        selectedOptionIndex = null;
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text("Previous"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (quizQuestionCounter < quizes.length - 1) {
                            quizQuestionCounter++;
                          }
                          selectedOptionIndex = null;

                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectionOption extends StatelessWidget {
  const SelectionOption({
    super.key,
    required this.quiz,
    required this.isSelected,
    required this.onSelected,
  });

  final String quiz;
  final bool isSelected;
  final Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Image.asset("assets/images/image 1.png"),
              ),
              Text(quiz),
            ],
          ),

          Checkbox(
            value: isSelected,
            onChanged: (value) {
              onSelected(value??false);
            },
            shape: CircleBorder(),
          ),
        ],
      ),
    );
  }
}

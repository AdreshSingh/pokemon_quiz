import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokemon_quiz/models/quiz.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Quiz> quizes = Quiz.pokemonDataset;
  int questionsCounter = 0;
  int? selectedOptionIndex;


  void messageBoard(){
    if(questionsCounter == quizes.length){
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Quiz Completed"),
            content: Text("Your score is ${Quiz.scores} out of ${quizes.length}"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple[100]!, Colors.grey[100]!],
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Center(child: Text("$questionsCounter of 6", textAlign: TextAlign.center)),

                SizedBox(height: 6),
                LinearProgressIndicator(),

                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(4),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: .5, sigmaY: .5),
                    child: Text(
                      quizes[questionsCounter].question,
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
                      Quiz quiz = quizes[questionsCounter];
                      return SelectionOption(
                        optionText: quiz.options[index],
                        optionImage: quiz.optionImages[index],
                       
                        isSelcted: selectedOptionIndex == index,
                        
                        onSelected: (bool value){
                          setState(() {
                            selectedOptionIndex = value ? index : null;
                            Quiz.calculateScores(quiz, selectedOptionIndex!);
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 30),
                    itemCount: 4,
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
                          if(questionsCounter > 0){
                            questionsCounter--;
                          }
                        });
                        selectedOptionIndex = null;
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8.0),
                        ),
                      ),
                      child: Text("Previous"),
                    ),
                    
                    // Next Button
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if(questionsCounter < quizes.length-1){
                            questionsCounter++;
                          }
                        });
                        selectedOptionIndex = null;

                        // popup the wining message
                        messageBoard();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8.0),
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
  final String optionText;
  final String optionImage;
  final bool isSelcted;
  final Function(bool) onSelected;

  const SelectionOption({super.key, required this.optionImage, required this.optionText, required this.isSelcted, required this.onSelected});

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
                child: Image.asset(optionImage),
              ),
              Text(optionText),
            ],
          ),

          Checkbox(
            value: isSelcted,
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

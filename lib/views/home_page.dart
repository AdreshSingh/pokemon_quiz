import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _slected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("2 of 6", textAlign: TextAlign.center),

            SizedBox(height: 6),
            LinearProgressIndicator(),

            SizedBox(height: 6),
            Container(
              padding: EdgeInsets.all(4),
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: .5, sigmaY: .5),
                child: Text("Pick a Pokemon that is of thunder type"),
              ),
            ),

            //
            SizedBox(height: 6),
            Text("Select One"),

            // One Option
            Container(
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
                      Text("Pikachu"),
                    ],
                  ),

                  Checkbox(
                    value: _slected,
                    onChanged: (value) {},
                    shape: CircleBorder(),
                  ),
                ],
              ),
            ),

            //? Buttons
            SizedBox(height: 6,),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Previous")),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple
                  ),
                  child: Text("Next",style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

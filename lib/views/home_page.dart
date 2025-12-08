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
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.purple[100]!,
              Colors.grey[100]!
            ],
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.bottomCenter)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Center(child: Text("2 of 6", textAlign: TextAlign.center)),
                
                SizedBox(height: 6),
                LinearProgressIndicator(),
                
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(4),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: .5, sigmaY: .5),
                    child: Text("Pick a Pokemon that is of thunder type",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    )),
                  ),
                ),
                
                
                SizedBox(height: 6),
                Text("Select One"),
                
                // One Option
                SizedBox(height: 20,),
                Expanded(
                  child: ListView.separated(itemBuilder: (context, index){
                    return SelectionOption(slected: _slected);
                  }, separatorBuilder: (context,index)=> SizedBox(height: 30,),
                      itemCount: 4
                  ),
                ),
                
                //? Buttons
                SizedBox(height: 6,),
                Divider(height: 1,),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: () {},style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(8.0)
                        )
                    ), child: Text("Previous")),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8.0)
                        )
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
        ),
      ),
    );
  }
}

class SelectionOption extends StatelessWidget {
  const SelectionOption({
    super.key,
    required bool slected,
  }) : _slected = slected;

  final bool _slected;

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
    );
  }
}

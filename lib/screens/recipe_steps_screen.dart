import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/done_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';

class RecipeStepsScreen extends StatefulWidget {
  CoffeeRecipe recipe;

  RecipeStepsScreen(this.recipe);

  @override
  _RecipeStepsScreenState createState() => _RecipeStepsScreenState();
}

class _RecipeStepsScreenState extends State<RecipeStepsScreen> {
  int currentStep;
  List<RecipeStep> remainingSteps;
  int stepTimeRemaining;
  Timer timer;

  @override
  void initState() {
    super.initState();

    int totalSteps = widget.recipe.steps.length;

    currentStep = 0;
    remainingSteps = widget.recipe.steps;

    //set the starting value of the timer
    stepTimeRemaining = widget.recipe.steps[currentStep].time;

    //make timer that ticks every one seconds
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // if timer reached zero
      if (stepTimeRemaining < 1) {
        //increase step
        currentStep++;

        //if we finished
        if (currentStep >= totalSteps) {
          //cancel timer
          timer.cancel();

          //navigate to done screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoneScreen()),
          );
        } else {
          //if we did not finish yet
          //adjust the timer
          //reduce the list of remaining steps
          stepTimeRemaining = widget.recipe.steps[currentStep].time;
          remainingSteps = widget.recipe.steps.sublist(currentStep);
          setState(() {});
        }
      } else {
        //adjust time remaining by one
        stepTimeRemaining = stepTimeRemaining - 1;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    RecipeStep currentRecipeStep = widget.recipe.steps[currentStep];

    return Scaffold(
      backgroundColor: Color(0xff4C748B),
      body: ListView(
        children: [
          SizedBox(height: 50),
          ListTile(
            title: Text("${stepTimeRemaining}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Kollektif",
                    fontSize: 96,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w400,
                    color: Colors.white)),
          ),
          ListTile(
            title: Text("${currentRecipeStep.text}",
                key: Key('recipe-steps'),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Kollektif",
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2,
                    color: Colors.white)),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              height: 45,
              child: ListTile(
                title: Text(
                  "Steps",
                  style: TextStyle(
                      fontFamily: "Kollektif",
                      fontSize: 14,
                      letterSpacing: 2,
                      color: Colors.white),
                ),
              )),
          for (RecipeStep step in remainingSteps)
            if (step == currentRecipeStep)
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                    step.text,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: "Kollektif",
                        fontSize: 12,
                        letterSpacing: 2,
                        color: Colors.white),
                  ),
                  trailing: Text(format(step.time),
                      style: TextStyle(
                          fontFamily: "Kollektif",
                          letterSpacing: 2,
                          fontSize: 12,
                          color: Colors.white)),
                ),
              )
            else
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                    step.text,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: "Kollektif",
                        fontSize: 12,
                        letterSpacing: 2,
                        color: Colors.white),
                  ),
                  trailing: Text(format(step.time),
                      style: TextStyle(
                          fontFamily: "Kollektif",
                          letterSpacing: 2,
                          fontSize: 12,
                          color: Colors.white)),
                ),
              ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

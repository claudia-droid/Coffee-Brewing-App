import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';
import 'package:homebrew_dripper/screens/recipe_steps_screen.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';

class RecipeDetailScreen extends StatelessWidget {
  CoffeeRecipe recipe;

  RecipeDetailScreen(this.recipe);
  List<RecipeStep> detailSteps;

  @override
  Widget build(BuildContext context) {
    detailSteps = recipe.steps;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        child: ListView(
          children: [
            IconButton(
                key: Key('recipe-details-back'),
                alignment: Alignment.topLeft,
                splashColor: Colors.transparent,
                iconSize: 20,
                icon: Icon(Icons.arrow_back_ios, color: Color(0xFF4C748B)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeSelectionScreen()),
                  );
                }),
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Color(0xff4C748B)),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Column(
                children: [
                  ListTile(
                    title: Text(recipe.name,
                        key: Key("recipe-details"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Kollektif",
                            fontSize: 18,
                            letterSpacing: 1.5,
                            color: Color(0xff4C748B))),
                    subtitle: Divider(thickness: 1, color: Color(0xff4C748B)),
                  ),
                  ListTile(
                    title: Text(
                        "${recipe.coffeeVolumeGrams}g - finely ground coffee" +
                            "\n" +
                            "${recipe.waterVolumeGrams}g - water",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Kollektif",
                            fontSize: 14,
                            letterSpacing: 1.5,
                            color: Color(0xff4C748B))),
                  ),
                  ListTile(
                    title: Text("The original recipe makes one delicious cup",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Monserrat",
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1.5,
                            color: Color(0xff4C748B))),
                  ),
                ],
              ),
            ),
            Container(
                height: 40,
                child: ListTile(
                    title: Text(
                      "Steps",
                      style: TextStyle(
                          fontFamily: "Kollektif",
                          fontSize: 14,
                          letterSpacing: 1.5,
                          color: Color(0xff4C748B)),
                    ),
                    trailing: Text("Total: " + totalTime(recipe),
                        style: TextStyle(
                            fontFamily: "Kollektif",
                            fontSize: 14,
                            letterSpacing: 1.5,
                            color: Color(0xff4C748B))))),
            for (RecipeStep step in detailSteps)
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0xff4C748B),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(5),
                child: ListTile(
                  title: Text(
                    step.text,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: "Kollektif",
                        fontSize: 12,
                        letterSpacing: 1.5,
                        color: Color(0xff4C748B)),
                  ),
                  trailing: Text(
                    format(step.time),
                    style: TextStyle(
                        fontFamily: "Kollektif",
                        fontSize: 12,
                        letterSpacing: 1.5,
                        color: Color(0xff4C748B)),
                  ),
                ),
              ),
            Container(
                padding: EdgeInsets.fromLTRB(50, 1, 50, 1),
                height: 55,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: new MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: Color(0xff4C748B),
                  key: Key('recipe-details-button'),
                  child: new Text(
                    "Start",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        letterSpacing: 1.5,
                        color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipeStepsScreen(recipe)),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}

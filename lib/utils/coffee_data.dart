import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';

CoffeeRecipe makeSweetMariasRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 30),
    RecipeStep("Cover and wait", 90),
    RecipeStep("Stir", 15),
    RecipeStep("Cover and wait", 75),
    RecipeStep("Stir", 15),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Sweet Maria's",
      22,
      360,
      "finely ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makePTsRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 50g water", 30),
    RecipeStep("Cover and wait", 30),
    RecipeStep("Add 400g water", 30),
    RecipeStep("Cover and wait", 30),
    RecipeStep("Drain Coffee", 240),
  ];
  CoffeeRecipe recipe = CoffeeRecipe("PT's", 25, 450,
      "medium-coarse ground coffee", "Perfect for experimentation", steps);
  return recipe;
}

CoffeeRecipe makeTexasCoffeeSchoolRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 100g water", 15),
    RecipeStep("Stir", 30),
    RecipeStep("Add 240g water", 15),
    RecipeStep("Stir", 30),
    RecipeStep("Cover and wait", 60),
    RecipeStep("Start draining ", 15),
    RecipeStep("Stir", 30),
    RecipeStep("Finish draining", 45)
  ];
  CoffeeRecipe recipe = CoffeeRecipe("Texas Coffee School", 24, 340,
      "Coarse ground coffee", "Pure precision", steps);
  return recipe;
}

CoffeeRecipe makeHomegroundsRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 50g water", 15),
    RecipeStep("Cover and wait", 30),
    RecipeStep("Add 290g water", 15),
    RecipeStep("Cover and wait", 60),
    RecipeStep("Stir", 15),
    RecipeStep("Drain coffee ", 80),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Homegrounds",
      23,
      345,
      "Medium-coarse ground coffee",
      "Full-bodied and with exceptional clarity",
      steps);
  return recipe;
}

CoffeeRecipe makeTestRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 5),
    RecipeStep("Cover and wait", 5),
    RecipeStep("Stir", 5),
    RecipeStep("Cover and wait", 5),
    RecipeStep("Stir", 5),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Test Recipe",
      22,
      360,
      "finely ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

// the order here matters for testing purposes, if you aren't mocking your tests
// the middle function will always be the one to be key'd for testing
List<CoffeeRecipe> getAllRecipes() {
  return [
    makeSweetMariasRecipe(),
    makePTsRecipe(),
    makeTexasCoffeeSchoolRecipe(),
    makeHomegroundsRecipe()
  ];
}

List<CoffeeRecipe> getTestRecipe() {
  return [
    makeTestRecipe(),
  ];
}

class CoffeeData {
  static List<CoffeeRecipe> loadRecipes(areWeInIntegrationTest) {
    if (areWeInIntegrationTest == false) {
      return getAllRecipes();
    } else {
      return getTestRecipe();
    }
  }

  static void recipeValCheck(int grams) {
    if (grams <= 0) {
      throw ArgumentError();
    }
  }

}

String format(int tseconds) {
  String newTime(String time) {
    if (time.length <= 1) return "0$time";
    return time;
  }

  int min = tseconds ~/ 60;
  int sec = tseconds % 60;

  String parsedTime = newTime(min.toString()) + " : " + newTime(sec.toString());

  return parsedTime;
}

String totalTime(CoffeeRecipe recstep) {
  int totalTime = 0;

  for (RecipeStep step in recstep.steps) totalTime += step.time;
  return format(totalTime);
}


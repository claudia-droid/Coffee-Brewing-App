import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  test('creates a valid recipe step', () {
    //make a recipe step
    RecipeStep steptest = RecipeStep("Test Recipe", 30);
    //check that it has the right data
    expect(steptest.text, ("Test Recipe"));
    expect(steptest.time, 30);
  });

  //how do we test rejecting invalid recipe steps?
  test('creates an invalid recipe step, with negative time', () {
    //make a recipe step

    //check that it has the right data

    expect(() => RecipeStep("Test Recipe", -1), throwsA(isA<Exception>()));
  });

  test('creates an invalid recipe step, with no text', () {
    //make a recipe step
    RecipeStep steptest = RecipeStep("", 30);
    //check that it has the right data
    expect(steptest.text, '');
    expect(steptest.time, 30);
  });
}

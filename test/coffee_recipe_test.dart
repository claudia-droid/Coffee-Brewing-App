import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
import 'package:test/test.dart';

void main() {
  test('creates a valid coffee recipe', () {
    List<CoffeeRecipe> recipe = CoffeeData.loadRecipes(false);

    //make a coffee recipe
    recipe[0].name = "TestCoffeeRecipe";
    recipe[0].coffeeVolumeGrams = 20;
    recipe[0].waterVolumeGrams = 320;
    recipe[0].grindSize = "finely ground coffee";
    recipe[0].miscDetails = "For when you really gotta wake up...";

    //check that it has the right data
    expect(recipe[0].name, "TestCoffeeRecipe");
    expect(recipe[0].coffeeVolumeGrams, 20);
    expect(recipe[0].waterVolumeGrams, 320);
    expect(recipe[0].grindSize, "finely ground coffee");
    expect(recipe[0].miscDetails, "For when you really gotta wake up...");
  });

  //how do we test rejecting invalid coffee recipes?
  //I created a func in the CoffeeData class
  //that throws an argument error if the given
  //recipe data is invalid
  test('creates an invalid coffee recipe with negative coffeeVolumeGrams', () {
    List<CoffeeRecipe> recipe = CoffeeData.loadRecipes(false);

    //make a coffee recipe
    recipe[0].name = "TestCoffeeRecipeInvalid";
    recipe[0].coffeeVolumeGrams = -20;
    recipe[0].waterVolumeGrams = 320;
    recipe[0].grindSize = "finely ground coffee";
    recipe[0].miscDetails = "For when you really gotta wake up...";

    //check that it has the right data
    expect(recipe[0].name, "TestCoffeeRecipeInvalid");

    //This checks if the recipe data grams is valid or not
    expect(() => CoffeeData.recipeValCheck(recipe[0].coffeeVolumeGrams),
        throwsArgumentError);

    expect(recipe[0].waterVolumeGrams, 320);
    expect(recipe[0].grindSize, "finely ground coffee");
    expect(recipe[0].miscDetails, "For when you really gotta wake up...");
  });

  test('creates an invalid coffee recipe with negative waterVolumeGrams', () {
    List<CoffeeRecipe> recipe = CoffeeData.loadRecipes(false);

    //make a coffee recipe
    recipe[0].name = "TestCoffeeRecipeInvalid";
    recipe[0].coffeeVolumeGrams = 20;
    recipe[0].waterVolumeGrams = -320;
    recipe[0].grindSize = "finely ground coffee";
    recipe[0].miscDetails = "For when you really gotta wake up...";

    //check that it has the right data
    expect(recipe[0].name, "TestCoffeeRecipeInvalid");
    expect(recipe[0].coffeeVolumeGrams, 20);

    //This checks if the recipe data grams is valid or not
    expect(() => CoffeeData.recipeValCheck(recipe[0].waterVolumeGrams),
        throwsArgumentError);

    expect(recipe[0].grindSize, "finely ground coffee");
    expect(recipe[0].miscDetails, "For when you really gotta wake up...");
  });
}

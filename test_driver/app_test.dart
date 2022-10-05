// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:homebrew_dripper/models/globals.dart';
import 'package:test/test.dart';

void main() {
  group('Homebrew Dripper App: ', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.

    //Things on Coffee Recipes screen
    final coffeeRecipesTextFinder = find.byValueKey(
        'coffee-recipes'); //"Coffee Recipes" text on recipe selection screen
    final coffeeRecipeButton = find
        .byValueKey('coffee-recipe-button'); //Button on coffee recipes screen
    final resourceTextFinder = find.byValueKey('coffee-resources'); // Resource Button
    final resourceButton = find.byValueKey('resource-button');

    //Things on Coffee Details screen
    final coffeeDetailsTextFinder = find
        .byValueKey('recipe-details'); //Text on coffee recipe details screen
    final coffeeDetailsButton = find
        .byValueKey('recipe-details-button'); //Button on recipe details screen
    final coffeeDetailsBackButton = find.byValueKey(
        'recipe-details-back'); //Back button on recipe details screen

    //Things on Recipe Steps screen
    final recipeStepsTextFinder =
        find.byValueKey('recipe-steps'); //*Current Step on recipe steps screen

    //Things on Done screen
    final doneTextFinder =
        find.byValueKey('done-screen'); //"" Text on done screen
    final doneButton =
        find.byValueKey('done-screen-button'); //Done button on done screen

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    //test('', () async {});
    group('Happy Paths: ', () {
      test(
          'If I am on the Coffee Recipes Screen I should be able to select a recipe and see its details',
          () async {
        //When the app starts we expect to be on the Coffee Recipes screen
        await new Future.delayed(new Duration(milliseconds: 500));
        expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
        //If we press on a recipe on the Coffee Selection screen
        await driver.tap(coffeeRecipeButton);
        //We expect to be taken to the Recipe Details Screen and see the recipe's details
        await new Future.delayed(new Duration(milliseconds: 500));
        expect(await driver.getText(coffeeDetailsTextFinder), "Test Recipe");
      });

      test(
          'If I am on the Coffee Details screen and we click start we expect to see all the steps of the recipe',
          () async {
        //We expect to be on the Coffee Details screen
        expect(await driver.getText(coffeeDetailsTextFinder), "Test Recipe");
        //If we press the start button
        await driver.tap(coffeeDetailsButton);
        //We expect to get taken to the Recipe Steps screen and see all the steps of the recipe in order
        expect(await driver.getText(recipeStepsTextFinder), "Add 360g water");
        await new Future.delayed(new Duration(milliseconds: 6000));
        expect(await driver.getText(recipeStepsTextFinder), "Cover and wait");
        await new Future.delayed(new Duration(milliseconds: 6000));
        expect(await driver.getText(recipeStepsTextFinder), "Stir");
        await new Future.delayed(new Duration(milliseconds: 6000));
        expect(await driver.getText(recipeStepsTextFinder), "Cover and wait");
        await new Future.delayed(new Duration(milliseconds: 6000));
        expect(await driver.getText(recipeStepsTextFinder), "Stir");
        await new Future.delayed(new Duration(milliseconds: 2000));
      });

      test(
          'If I was on the Recipe Steps screen I expect to be taken to the Done screen when all the steps have been shown',
          () async {
        //We expect to end up on the Done screen after the Coffee Details screen
        expect(await driver.getText(doneTextFinder),
            "enjoy your amazing \n handmade coffee");
      });

      test(
          'If I am on the Done screen I should be able to return to the Coffee Recipes screen with the done button',
          () async {
        //We expect to be on the Done screen
        expect(await driver.getText(doneTextFinder),
            "enjoy your amazing \n handmade coffee");
        //If we press the done button
        await driver.tap(doneButton);
        //We expect to get taken to the Coffee Recipes screen
        await new Future.delayed(new Duration(milliseconds: 500));
        expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
      });

      test(
          'If I am on the Coffee Recipes Screen I should be able to see a resource button',
          () async {

        //We expect to see the Coffee Recipe Text
        expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");

        //... and we expect to see the resource button text
        expect(await driver.getText(resourceTextFinder), "Resources");
      });
    });

    group('Back Button Test: ', () {
      test(
          'If I am on the Coffee Recipes Screen I should be able to select a recipe and see its details then return to the Coffee Recipes Screen wih the back button',
          () async {
        //When we are on the Coffee Recipes screen
        expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
        //When we press on a recipe on the Coffee Selection screen
        await driver.tap(coffeeRecipeButton);
        //When we get to the Recipe Details Screen and see the recipe's details
        await new Future.delayed(new Duration(milliseconds: 500));
        expect(await driver.getText(coffeeDetailsTextFinder), "Test Recipe");
        //If we press the back button on the Recipe Details screen
        await driver.tap(coffeeDetailsBackButton);
        //We expect to be taken back to the Coffe Recipe screen
        expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
      });
    });

    group('Sad Paths: ', () {
      // Given: I am on the Test Recipe steps screen
      // When I tap start, then I should see "5" on the timer and "360g" on the "Add" x "water"
      // While "5" seconds have not passed, I should still see add "Add 360g water"
      test('The Test Recipe should not jump the timer', () async {
        // We expect to start at the recipe selection screen
        expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");

        // Navigate to the Test Recipe steps screen
        await driver.tap(coffeeRecipeButton);
        expect(await driver.getText(coffeeDetailsTextFinder), "Test Recipe");
        await driver.tap(coffeeDetailsButton);

        //make sure the test recipe still reads "Add 360g water" after 4 seconds
        expect(await driver.getText(recipeStepsTextFinder), "Add 360g water");
        await new Future.delayed(new Duration(milliseconds: 4000));
        expect(await driver.getText(recipeStepsTextFinder), "Add 360g water");
        await new Future.delayed(new Duration(milliseconds: 2000));

        //make sure the test recipe reads "Cover and wait" after 4 seconds
        expect(await driver.getText(recipeStepsTextFinder), "Cover and wait");
        await new Future.delayed(new Duration(milliseconds: 4000));
        expect(await driver.getText(recipeStepsTextFinder), "Cover and wait");
        await new Future.delayed(new Duration(milliseconds: 2000));

        //make sure the test recipe reads "Stir" after 4 seconds
        expect(await driver.getText(recipeStepsTextFinder), "Stir");
        await new Future.delayed(new Duration(milliseconds: 4000));
        expect(await driver.getText(recipeStepsTextFinder), "Stir");
        await new Future.delayed(new Duration(milliseconds: 2000));

        //make sure the test recipe reads "Cover and wait" after 4 seconds
        expect(await driver.getText(recipeStepsTextFinder), "Cover and wait");
        await new Future.delayed(new Duration(milliseconds: 4000));
        expect(await driver.getText(recipeStepsTextFinder), "Cover and wait");
        await new Future.delayed(new Duration(milliseconds: 2000));

        //make sure the test recipe reads "Stir" after 4 seconds
        expect(await driver.getText(recipeStepsTextFinder), "Stir");
        await new Future.delayed(new Duration(milliseconds: 4000));
        expect(await driver.getText(recipeStepsTextFinder), "Stir");

      });

      test('The resource buttons should work', () async {

        // navigate back to start
        await driver.tap(doneButton);

        //When we are on the Coffee Recipes screen
        expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");

        //We should be able to press a resource button
        await driver.tap(resourceButton);
      });
    });
  });

  areWeInIntegrationTest = false;
}

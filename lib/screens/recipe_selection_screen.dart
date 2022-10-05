import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/resource.dart';
import 'package:homebrew_dripper/models/globals.dart';
import 'package:homebrew_dripper/screens/recipe_detail_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
import 'package:homebrew_dripper/utils/resource_data.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: ListView(
        children: [
          Column(
            children: [
              Text(
                "Coffee Recipes",
                key: Key("coffee-recipes"),
                style: TextStyle(
                    fontFamily: 'Kollektif',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    color: Color(0xff4C748B),
                    letterSpacing: 3),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(19, 16, 19, 30),
                child: RecipeList(),
              ),
              Text(
                "Resources",
                key: Key("coffee-resources"),
                style: TextStyle(
                    fontFamily: 'Kollektif',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    color: Color(0xff4C748B),
                    letterSpacing: 3),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(19, 16, 19, 30),
                child: ResourceList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  final List<CoffeeRecipe> recipes =
      CoffeeData.loadRecipes(areWeInIntegrationTest);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Color(0xff4C748B)),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        key: Key('coffee-recipe-button'),
        children: [
          for (CoffeeRecipe recipe in recipes)
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: (recipe != recipes.last)
                            ? Color(0xff4C748B)
                            : Color(0x00000000))),
              ),
              child: ListTile(
                  title: Text(
                    recipe.name,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff4C748B),
                        letterSpacing: 2),
                  ),
                  trailing: Icon(Icons.chevron_right, color: Color(0xff4C748B)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipeDetailScreen(recipe)),
                    );
                  }),
            ),
        ],
      ),
    );
  }
}

class ResourceList extends StatelessWidget {
  final List<ResourceData> resources = Resources.loadResources();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Color(0xff4C748B)),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        key: Key('resource-button'),
        children: [
          for (ResourceData resource in resources)
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: (resource != resources.last)
                            ? Color(0xff4C748B)
                            : Color(0x00000000))),
              ),
              child: ListTile(
                title: Text(
                  resource.title,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff4C748B),
                      letterSpacing: 2),
                ),
                trailing: Icon(Icons.chevron_right, color: Color(0xff4C748B)),
                // it's possible that the launch function below is throwing you an "undefinied" error in the IDE. It is lying.
                onTap: () => launch(resource.url),
              ),
            )
        ],
      ),
    );
  }
}

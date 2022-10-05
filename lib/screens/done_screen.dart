import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      body: Center(
        child: Column(children: [
          Container(
              padding: EdgeInsets.fromLTRB(0, 300, 0, 0),
              child: Text("enjoy your amazing \n handmade coffee",
                  key: Key('done-screen'),
                  style: GoogleFonts.montserrat(
                      letterSpacing: 2,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff4C748B)))),
          Container(
              padding: EdgeInsets.fromLTRB(0, 280, 0, 0),
              child: TextButton(
                  style: TextButton.styleFrom(primary: Color(0xffF3F3F3)),
                  key: Key('done-screen-button'),
                  child: Text("done",
                      style: GoogleFonts.montserrat(
                          letterSpacing: 2,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff4C748B))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipeSelectionScreen()),
                    );
                  })),
        ]),
      ),
    );
  }
}

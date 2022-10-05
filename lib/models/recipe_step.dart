class RecipeStep {
  String text;
  int time;

  RecipeStep(text, time) {
    //add any rules to reject invalid values
    //for example, reject negative gram amounts
    if (time == null || time < 1)
      throw Exception("No null or negatives allowed");
    else
      this.time = time;

    if (text == null || time == "")
      throw ArgumentError("Invalid text");
    else
      this.text = text;
  }
}

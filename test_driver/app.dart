import 'package:flutter_driver/driver_extension.dart';
import 'package:homebrew_dripper/main.dart' as app;
import 'package:homebrew_dripper/models/globals.dart';

void main() {
  // This line enables the extension.
  enableFlutterDriverExtension();
  areWeInIntegrationTest = true;

  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  app.main();
}

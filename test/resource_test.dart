import 'package:homebrew_dripper/models/resource.dart';
import 'package:homebrew_dripper/utils/resource_data.dart';
import 'package:test/test.dart';

void main() {
  test('creates a valid resource', () {
    List<ResourceData> recipe = Resources.loadResources();

    //make a resource
    recipe[0].title = "TestResource";
    recipe[0].url = "google.com";

    //check that it has the right data
    expect(recipe[0].title, "TestResource");
    expect(recipe[0].url, "google.com");
  });

  test('tests an invalid coffee Resource with a null string', () {
    
    //check passing a null title results in an argument error
    expect(() => ResourceData(null, "google.com"), throwsArgumentError);
  });

  test('tests an invalid coffee Resource with a null string', () {

    //check passing a null title results in an argument error
    expect(() => ResourceData("", "google.com"), throwsArgumentError);
  });

  test('creates an invalid resource with a bad url', () {
    
    //check passing a bad url results in an argument error
    expect(() => ResourceData("TestResource", "goog"), throwsArgumentError);
  });
}

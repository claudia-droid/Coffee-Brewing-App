//Test that the load resources gives you the data you expect
//this should be dependent on the resources that you actually want to have in the app
import 'package:homebrew_dripper/models/resource.dart';
import 'package:homebrew_dripper/utils/resource_data.dart';
import 'package:test/test.dart';

void main() {
  test('loadResources should give back valid resource', () {
    List<ResourceData> resources = Resources.loadResources();

    // add whatever tests help give you confidence
    for(int i = 0; i < resources.length; ++i){

      expect(resources[i], isA<ResourceData>());
      expect(resources[i].url, isA<String>());
      expect(resources[i].url, isA<String>());
    }
  });
}

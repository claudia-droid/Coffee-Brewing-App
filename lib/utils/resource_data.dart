import 'package:homebrew_dripper/models/resource.dart';

ResourceData makeCoffeeResource(){

  ResourceData resource = ResourceData(
    "Coffee",
    "https://www.sweetmarias.com/green-coffee.html");

  return resource;
}

ResourceData makeGrinderResource(){

  ResourceData resource = ResourceData(
    "Grinders",
    "https://www.sweetmarias.com/brewing/grinders.html");

  return resource;
}

ResourceData makeKettlesResource(){

  ResourceData resource = ResourceData(
    "Kettles",
    "https://www.sweetmarias.com/brewing/accessories/kettles.html");

  return resource;
}

ResourceData makeDripperResource(){

  ResourceData resource = ResourceData(
    "Homebrew Dripper",
    "https://www.figma.com/file/4a1j5P0UR0FBAwAuNPBhjh/Homebrew-Dripper?node-id=0%3A1");

  return resource;
}

List<ResourceData> getAllResources(){

  return [

    makeCoffeeResource(),
    makeGrinderResource(),
    makeKettlesResource(),
    makeDripperResource()
  ];
}

class Resources{

  static List<ResourceData> loadResources(){

    return getAllResources();
  }
}
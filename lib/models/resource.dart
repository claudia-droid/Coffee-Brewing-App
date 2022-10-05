class ResourceData {
  String title;
  String url; 

  //Should blank strings and bad urls 
  ResourceData(String title, String url) {

    if (title == null || title == "")
      throw ArgumentError("Invalid text");
    else
      this.title = title;
    
    if (!Uri.parse(url).isAbsolute)
      throw ArgumentError("Invalid URL");
    else
      this.url = url;
  }
}

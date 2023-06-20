///Resource class for drawing data out of json and making it useable in resources.dart.
class Resource {
  final String title;
  final String description;
  final String link;
  final String imagePath;

  const Resource(
      {required this.title,
      required this.description,
      required this.link,
      required this.imagePath});

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      title: json['title'],
      description: json['description'],
      link: json['link'],
      imagePath: json['imagePath'],
    );
  }
}

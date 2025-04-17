class News {
  final String title;
  final String description;
  final String urlToImage;
  News({
    required this.title,
    required this.description,
    required this.urlToImage,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'] ?? '',
      //image nabhako case ma null handle garcha
    );
  }
}

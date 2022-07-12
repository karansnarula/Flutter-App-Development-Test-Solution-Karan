class NewsInformation {
  final String title;
  final String link;
  final String publishDate;
  NewsInformation({
    required this.title,
    required this.link,
    required this.publishDate,
  });
  factory NewsInformation.fromJson(Map<String, dynamic> json) {
    return NewsInformation(
      title: json['title'],
      link: json['link'],
      publishDate: json['published_date'],
    );
  }
}

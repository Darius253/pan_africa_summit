class SpeakerModel {
  String? name;
  String? imageUrl;
  String? title;
  String? description;
  String? company;
  String? link;

  SpeakerModel({
    this.name,
    this.imageUrl,
    this.description,
    this.title,
    this.company,
    this.link,
  });

  factory SpeakerModel.fromJson(Map<String, dynamic> json) {
    return SpeakerModel(
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      description: json['description'] as String?,
      title: json['title'] as String?,
      company: json['company'] as String?,
      link: json['link'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'title': title,
      'company': company,
      'link': link,
    };
  }
}

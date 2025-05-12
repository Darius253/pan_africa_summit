class AgendaModel {
  String? headline;
  String? startTime;
  String? endTime;
  String? subtitle;

  AgendaModel({this.headline, this.startTime, this.endTime, this.subtitle});

  factory AgendaModel.fromJson(Map<String, dynamic> json) {
    return AgendaModel(
      headline: json['headline'] as String?,
      startTime: json['start_date'] as String?,
      endTime: json['end_date'] as String?,
      subtitle: json['subtitle'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'headline': headline,
      'start_date': startTime,
      'end_date': endTime,
      'subtitle': subtitle,
    };
  }
}

import 'package:pan_african_ai_summit/data/models/agenda_model.dart';

class EventModel {
  String? headline;
  String? description;
  String? location;
  String? startDate;
  String? endDate;
  String? subtitle;
  List<AgendaModel>? agenda;

  EventModel({
    this.headline,
    this.description,
    this.location,
    this.startDate,
    this.endDate,
    this.subtitle,
  
    this.agenda,
  });
  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      headline: json['headline'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      subtitle: json['subtitle'] as String?,
      
      agenda:
          (json['agenda'] as List<dynamic>?)
              ?.map((e) => AgendaModel.fromJson(e))
              .toList(),
    );
  }
}

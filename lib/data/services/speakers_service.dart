import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html_parser;
import '../models/speaker_model.dart';

class SpeakersService {
  Future<List<SpeakerModel>> fetchSpeakers() async {
    final response = await http.get(
      Uri.parse(
        'https://panafricanaisummit.com/wp-json/wp/v2/pages?slug=speakers',
      ),
    );

    if (response.statusCode != 200) throw Exception('Failed to load data');

    final data = jsonDecode(response.body);
    if (data is! List || data.isEmpty) {
      throw Exception('Unexpected data format');
    }

    final renderedHtml = data.first['content']['rendered'] as String;
    final document = html_parser.parse(renderedHtml);

    final List<SpeakerModel> speakers = [];
    final Set<String> addedSpeakerKeys = {};

    final speakerContainers = document.querySelectorAll(
      'div.e-con-full.e-flex.e-con.e-child',
    );

    for (final container in speakerContainers) {
      final nameElement = container.querySelector(
        'h2.bdt-ep-advanced-heading-title',
      );
      final imageElement = container.querySelector('img.attachment-large');

      final bioElement = container.querySelector(
        '.elementor-widget-text-editor',
      );

      if (nameElement == null || imageElement == null) {
        continue;
      }

      String name = nameElement.text.trim();
      final imageUrl = imageElement.attributes['src'] ?? '';
      final bio = bioElement?.text.trim().replaceAll(RegExp(r'\s+'), ' ') ?? '';

      name = _toTitleCase(name);

      final speakerKey = '$name|$imageUrl';

      if (name.isNotEmpty &&
          imageUrl.isNotEmpty &&
          !addedSpeakerKeys.contains(speakerKey)) {
        speakers.add(SpeakerModel(name: name, imageUrl: imageUrl, bio: bio));
        addedSpeakerKeys.add(speakerKey);
      }
    }
    return speakers;
  }

  String _toTitleCase(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text
        .split(' ')
        .map((word) {
          if (word.isEmpty) {
            return '';
          }

          return word.toUpperCase();
        })
        .join(' ');
  }
}

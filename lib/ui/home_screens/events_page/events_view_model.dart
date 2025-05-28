import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/data/models/speaker_model.dart';
import 'package:pan_african_ai_summit/data/repositories/speakers_repository.dart';

class EventsViewModel extends ChangeNotifier {
  final SpeakersRepository speakersRepository = SpeakersRepository();

  bool _isLoading = false;
  String? _errorMessage;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<List<SpeakerModel>> fetchSpeakers() async {
    try {
      _setLoading(true);
      return await speakersRepository.fetchSpeakers();
    } catch (e) {
      _errorMessage = e.toString();
      _setLoading(false);
      return [];
    } finally {
      _setLoading(false);
      notifyListeners();
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}

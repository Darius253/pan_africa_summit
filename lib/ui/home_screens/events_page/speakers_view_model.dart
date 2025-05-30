import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/data/models/speaker_model.dart';
import 'package:pan_african_ai_summit/data/repositories/speakers_repository.dart';

class SpeakersViewModel extends ChangeNotifier {
  final SpeakersRepository speakersRepository = SpeakersRepository();

  bool _isLoading = false;
  String? _errorMessage;

  List<SpeakerModel> _allSpeakers = [];
  List<SpeakerModel> _filteredSpeakers = [];

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  List<SpeakerModel> get speakers => _allSpeakers;
  List<SpeakerModel> get filteredSpeakers => _filteredSpeakers;

  Future<void> fetchSpeakers() async {
    try {
      _setLoading(true);
      final fetched = await speakersRepository.fetchSpeakers();
      _allSpeakers = fetched;
      _filteredSpeakers = fetched; 
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
      _allSpeakers = [];
      _filteredSpeakers = []; 
    } finally {
      _setLoading(false);
      notifyListeners(); 
    }
  }

  void searchSpeakers(String query) {
    if (query.isEmpty) {
      _filteredSpeakers = _allSpeakers;
      _errorMessage = null;
    } else {
      _filteredSpeakers =
          _allSpeakers.where((speaker) {
            final name = speaker.name.toLowerCase();
            return name.contains(query.toLowerCase());
          }).toList();

      _errorMessage =
          _filteredSpeakers.isEmpty ? "No speakers found for '$query'" : null;
    }
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
  }
}

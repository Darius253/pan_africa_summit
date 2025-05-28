import 'package:pan_african_ai_summit/data/models/speaker_model.dart';
import 'package:pan_african_ai_summit/data/services/speakers_service.dart';

class SpeakersRepository {
  SpeakersService speakersService = SpeakersService();

  Future<List<SpeakerModel>> fetchSpeakers() async {
  try {
    return await speakersService.fetchSpeakers();
  } catch (e) {
    return [];
  }
}

}

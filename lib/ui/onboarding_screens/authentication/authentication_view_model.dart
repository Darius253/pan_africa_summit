import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/data/repositories/authentication_repository.dart';

class AuthenticationViewModel extends ChangeNotifier {
  final AuthenticationRepository _authRepo = AuthenticationRepository();

  bool _isLoading = false;
  bool _isSignedIn = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  bool get isSignedIn => _isSignedIn;
  String? get errorMessage => _errorMessage;

  Future<void> signInWithGoogle() async {
    _setLoading(true);
    try {
      await _authRepo.signInWithGoogle();
      _errorMessage = null;
      _isSignedIn = true;
    } catch (e) {
      _errorMessage = e.toString();
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

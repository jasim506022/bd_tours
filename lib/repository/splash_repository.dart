import 'package:firebase_auth/firebase_auth.dart';

import '../data/network/data_firebase_service.dart';

class SplashRepository{
  final _dataFirebaseService = DataFirebaseService();

  User? currentUser() => _dataFirebaseService.currentUser();
}
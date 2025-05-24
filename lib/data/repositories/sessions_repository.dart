import '../models/sessions.dart';
import '../services/sessions_services.dart';

class SessionsRepository {
  Future<List<Sessions>> getSessions() async {
    var sessionsList = await SessionServices().getSessions();
    return sessionsList
        .map((e) => Sessions.fromJson(e))
        .toList();
  }
}

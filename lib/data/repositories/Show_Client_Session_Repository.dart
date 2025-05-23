import 'package:graduation/data/models/client_session_model.dart';
import 'package:graduation/data/services/client_session_services.dart';

class ShowClientSessionRepository {
  Future<List<ClientSessionModel>> getAllClientSession() async {
    var clientSession = await ClientSessionServices().showAll();
    return clientSession
        .map(
          (e) => ClientSessionModel.fromJson(e),
        )
        .toList();
  }
}

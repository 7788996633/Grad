
import '../models/profile_model.dart';
import '../services/profile.dart';

class  UserProfileRepo {
  Future<ProfileModel> showProfiles() async {
    var profiles = await ProfileService().showProfile();
    return profiles
        .map(
          (e) => ProfileModel.fromJson(e),
    );
  }
}

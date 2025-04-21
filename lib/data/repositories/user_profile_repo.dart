
import '../models/profile.dart';
import '../services/profile.dart';

class  UserProfileRepo {
  Future<Profile> showProfiles() async {
    var profiles = await ProfileService().showProfile();
    return profiles
        .map(
          (e) => Profile.fromJson(e),
    );
  }
  Future<dynamic> updateProfiles(String phone ,String address,String age ,String scientificLevel) async{
    var profiles = await ProfileService().updateProfile(phone, address, age, scientificLevel);
    return profiles
        .map(
          (e) => Profile.fromJson(e),
    );
  }
  Future<dynamic> createProfiles(String phone ,String address,String age ,String scientificLevel)async{
    var profiles = await ProfileService().createProfile(phone, address, age, scientificLevel);
    return profiles
        .map(
          (e) => Profile.fromJson(e),
    );

  }
  Future<dynamic>deleteProfiles()async{

    var profiles = await ProfileService().deleteProfile();
    return profiles
        .map(
          (e) => Profile.fromJson(e),
    );


  }
}

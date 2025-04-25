import 'package:bloc/bloc.dart';
import 'package:graduation/data/models/user_profile_model.dart';
import 'package:graduation/data/services/user_profile_services.dart';
import 'package:meta/meta.dart';


part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(UserProfileInitial()) {
    on<UserProfileEvent>((event, emit) async {
      if (event is CreateUserProfileEvent) {
        emit(
          UserProfileLoading(),
        );
        try {
          String value = await UserProfileServices().createProfile(
              event.phone, event.address, event.age, event.scientificLevel,event.imagePath);

          emit(UserProfileSuccess(successmsg: value));
        } catch (e) {
          emit(
            UserProfileFail(
              errmsg: e.toString(),
            ),
          );
        }
      } else if (event is ShowUserProfileEvent) {
        emit(
          UserProfileLoading(),
        );
        try {
          UserProfileModel value = await UserProfileServices().showProfile();

          emit(
            UserProfileLoadedSuccessfully(userProfileModel: value),
          );
        } catch (e) {
          emit(
            UserProfileFail(
              errmsg: e.toString(),
            ),
          );
        }
      } else if (event is UpdateUserProfileEvent) {
        emit(
          UserProfileLoading(),
        );
        try {
          String value = await UserProfileServices().updateProfile(
              event.phone, event.address, event.age, event.scientificLevel);
          emit(UserProfileSuccess(successmsg: value));
        } catch (e) {
          emit(
            UserProfileFail(
              errmsg: e.toString(),
            ),
          );
        }
      } else if (event is DeleteUserProfileEvent) {
        emit(
          UserProfileLoading(),
        );
        try {
          String value = await UserProfileServices().deleteProfile();
          emit(UserProfileSuccess(successmsg: value));
        } catch (e) {
          emit(
            UserProfileFail(
              errmsg: e.toString(),
            ),
          );
        }
      }
    });
  }
}

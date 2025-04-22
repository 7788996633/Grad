import 'package:bloc/bloc.dart';
import 'package:graduation/data/services/profile.dart';
import 'package:meta/meta.dart';

import '../../data/models/profile_model.dart';

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
          String value = await ProfileService().createProfile(
              event.phone, event.address, event.age, event.scientificLevel);

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
          ProfileModel value = await ProfileService().showProfile();

          emit(
            UserProfileLoadedSuccessfully(profileModel: value),
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
          String value = await ProfileService().updateProfile(
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
          String value = await ProfileService().deleteProfile();
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

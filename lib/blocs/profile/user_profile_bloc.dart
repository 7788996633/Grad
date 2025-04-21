import 'package:bloc/bloc.dart';
import 'package:graduated/data/services/profile.dart';
import 'package:meta/meta.dart';

import '../../data/models/profile.dart';


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
          Profile value =
          await ProfileService().createProfile(
              event.phone, event.address, event.age, event.scientificLevel);
         
emit(UserProfileSuccess(profile: value));
     
        } on Exception catch (e) {
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
          Profile value = await ProfileService()
              .showProfile();
         
            emit(UserProfileSuccess(profile: value));
        
        } on Exception catch (e) {
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
          Profile value =
          await ProfileService().updateProfile(
              event.phone, event.address, event.age, event.scientificLevel);
     emit(UserProfileSuccess(profile: value));
        } on Exception catch (e) {
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
          Profile value =
          await ProfileService().deleteProfile();
         emit(UserProfileSuccess(profile: value));
        } on Exception catch (e) {
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

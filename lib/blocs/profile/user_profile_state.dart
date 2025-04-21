part of 'user_profile_bloc.dart';

@immutable
sealed class UserProfileState {}

final class UserProfileInitial extends UserProfileState {}
class UserProfileSuccess extends UserProfileState {
final Profile  profile;
UserProfileSuccess({required this.profile});
}

final class UserProfileLoading extends UserProfileState {}

final class UserProfileFail extends UserProfileState {
  final String errmsg;

  UserProfileFail({required this.errmsg});
}

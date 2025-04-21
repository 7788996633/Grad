part of 'user_profile_bloc.dart';

@immutable
sealed class UserProfileEvent {}

class DeleteUserProfileEvent extends UserProfileEvent {
  DeleteUserProfileEvent();
}
class CreateUserProfileEvent extends UserProfileEvent {
  late String phone ;
  late String address;
  late String age ;
  late String scientificLevel;

  CreateUserProfileEvent({required this.phone, required this.address, required this.age, required this.scientificLevel});
}
class UpdateUserProfileEvent extends UserProfileEvent {
  late String phone ;
  late String address;
  late String age ;
  late String scientificLevel;

  UpdateUserProfileEvent({required this.phone, required this.address, required this.age, required this.scientificLevel});

}
class ShowUserProfileEvent extends UserProfileEvent {
  ShowUserProfileEvent();
}
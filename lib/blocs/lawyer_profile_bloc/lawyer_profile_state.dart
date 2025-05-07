part of 'lawyer_profiel_bloc.dart';

@immutable
sealed class LawyerProfileState {}

final class LawyerProfileInitial extends LawyerProfileState {}

final class LawyerProfileLoading extends LawyerProfileState {}

final class LawyerProfileSuccess extends LawyerProfileState {
  final String successmsg;

  LawyerProfileSuccess({required this.successmsg});
}

final class LawyerProfileLoadedSuccessfully extends LawyerProfileState {
  final LawyerModel lawyerModel;
  final UserProfileModel userProfileModel;

  LawyerProfileLoadedSuccessfully({
    required this.lawyerModel,
    required this.userProfileModel,
  });
}

final class LawyerProfileFail extends LawyerProfileState {
  final String errmsg;

  LawyerProfileFail({required this.errmsg});
}

part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  final String token;

  AuthSuccess({required this.token});
}

final class AuthFail extends AuthState {
  final String errmsg;

  AuthFail({required this.errmsg});
}

<<<<<<< HEAD
final class AuthLoading extends AuthState {}
=======
final class AuthLoading extends AuthState {}
>>>>>>> origin/Fareza

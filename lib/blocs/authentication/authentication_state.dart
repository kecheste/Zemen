part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitialState extends AuthenticationState {}

final class AuthenticationLoadingState extends AuthenticationState {}

final class AuthenticationOtpState extends AuthenticationState {}

final class UnAuthenticatedState extends AuthenticationState {}

final class AuthenticationFailureState extends AuthenticationState {
  final String errorMessage;

  const AuthenticationFailureState({required this.errorMessage});
}

final class AuthenticationSuccessState extends AuthenticationState {
  final MyUser user;

  const AuthenticationSuccessState({required this.user});
}

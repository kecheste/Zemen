part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => "AppStarted";
}

class CheckAuth extends AuthenticationEvent {
  const CheckAuth();
}

class SendOtp extends AuthenticationEvent {
  final String phone;
  final Function errorStep;
  final Function nextStep;

  const SendOtp(this.phone, this.errorStep, this.nextStep);
}

class SignInUser extends AuthenticationEvent {
  final String otp;
  final String phone;

  const SignInUser(this.otp, this.phone);
}

class GetMyUser extends AuthenticationEvent {
  final String myUserId;

  const GetMyUser(this.myUserId);
}

class SignOutUser extends AuthenticationEvent {
  const SignOutUser();
}

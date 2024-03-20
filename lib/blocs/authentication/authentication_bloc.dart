import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/models/user_model.dart';
import 'package:shop_app/repository/auth.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;

  AuthenticationBloc({required this.authRepository})
      : super(AuthenticationInitialState()) {
    on<AppStarted>((event, emit) async {
      emit(AuthenticationLoadingState());
      try {
        final isSignedIn = FirebaseAuth.instance.currentUser;
        if (isSignedIn != null) {
          MyUser user = await authRepository.getMyUser(isSignedIn.uid);
          emit(AuthenticationSuccessState(user: user));
        } else {
          emit(UnAuthenticatedState());
        }
      } catch (e) {
        emit(AuthenticationFailureState(errorMessage: e.toString()));
        print(e.toString());
      }
    });

    on<CheckAuth>((event, emit) async {
      emit(AuthenticationLoadingState());
      try {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          MyUser myUser = await authRepository.getMyUser(user.uid);
          emit(AuthenticationSuccessState(user: myUser));
        } else {
          emit(UnAuthenticatedState());
        }
      } catch (e) {
        AuthenticationFailureState(errorMessage: e.toString());
      }
    });

    on<SendOtp>((event, emit) async {
      emit(AuthenticationLoadingState());
      try {
        await authRepository.sendOtp(
            phone: event.phone,
            errorStep: event.errorStep,
            nextStep: event.nextStep);
        emit(AuthenticationOtpState());
      } catch (e) {
        emit(AuthenticationFailureState(errorMessage: e.toString()));
      }
    });

    on<SignInUser>(
      (event, emit) async {
        emit(AuthenticationLoadingState());
        try {
          final MyUser user = await authRepository.loginWithOtp(
              otp: event.otp, phone: event.phone);
          emit(AuthenticationSuccessState(user: user));
        } catch (e) {
          emit(AuthenticationFailureState(errorMessage: e.toString()));
        }
      },
    );
  }
}

// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/entities/user_entity.dart';
import 'package:shop_app/models/user_model.dart';

class AuthRepository {
  final usersCollection = FirebaseFirestore.instance.collection("Users");
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser;
      return user;
    });
  }

  static String verifyId = "";

  Future sendOtp(
      {required String phone,
      required Function errorStep,
      required Function nextStep}) async {
    await _firebaseAuth
        .verifyPhoneNumber(
      timeout: const Duration(seconds: 120),
      phoneNumber: "+251$phone",
      verificationCompleted: (phoneAuthCredential) async {
        return;
      },
      verificationFailed: (error) async {
        return;
      },
      codeSent: (verificationId, forceResendingToken) async {
        verifyId = verificationId;
        nextStep();
      },
      codeAutoRetrievalTimeout: (verificationId) async {
        return;
      },
    )
        .onError((error, stackTrace) {
      errorStep();
    });
  }

  Future loginWithOtp({required String otp, required String phone}) async {
    final credential =
        PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp);
    try {
      final user = await _firebaseAuth.signInWithCredential(credential);
      if (user.user != null) {
        final checkUserFound = usersCollection.doc(user.user!.uid).get();
        if (checkUserFound == null) {
          return usersCollection.doc(user.user!.uid).get().then((value) =>
              MyUser.fromEntity(MyUserEntity.fromDocument(value.data()!)));
        }
        MyUser myUser = MyUser(
            id: user.user!.uid, name: "No name", phone: phone, photo: "");
        await usersCollection
            .doc(myUser.id)
            .set(myUser.toEntity().toDocument());
        return myUser;
      } else {
        return "Error in OTP login";
      }
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  Future<MyUser> getMyUser(String myUserId) async {
    try {
      return usersCollection.doc(myUserId).get().then((value) =>
          MyUser.fromEntity(MyUserEntity.fromDocument(value.data()!)));
    } catch (e) {
      rethrow;
    }
  }

  Future logOut() async {
    try {
      await _firebaseAuth.signOut();
      return "Logged Out!";
    } catch (e) {
      return e.toString();
    }
  }

  Future<bool> isLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    return user != null;
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:otp_app/screen/success_page.dart';

class AuthService {
  static final auth = FirebaseAuth.instance;

  static Future<void> authWithPhoneNumber(
      {String? phoneNumber,
      required void Function(PhoneAuthCredential) verificationCompleted,
      required void Function(FirebaseAuthException) verificationFailed,
      required void Function(String, int?) codeSent,
      required void Function(String) codeAutoRetrievalTimeout}) async {
    print("Start");
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
    print("end");
  }

  static Future<void> verificationOtp(String verificationId, String smsCode,
      {required void Function() onFailed}) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    try {
      await auth.signInWithCredential(credential);
      Get.to(() => const SuccessPage(), popGesture: false);
    } on Exception catch (e) {
      onFailed();
    }
  }
}

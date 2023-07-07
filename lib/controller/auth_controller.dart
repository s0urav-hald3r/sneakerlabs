import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../util/loader.dart';
import '../util/snackbar.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String _verificationId = '';

  final RxBool _otpSend = false.obs;

  bool get otpSend => _otpSend.value;
  set otpSend(status) => _otpSend.value = status;

  sendOtpAction(String mobile) async {
    Loader.show();

    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '+91$mobile',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          _otpSend.value = true;
          Loader.hide();
          CustomSnackBar.show('Success',
              message: 'OTP successfully sent to +91 $mobile');
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-phone-number') {
        Loader.hide();
        CustomSnackBar.show('Error',
            message: 'The provided phone number is not valid.', type: 2);
      }
    }
  }

  verifyOtpAction(String otp) async {
    Loader.show();

    try {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: otp);

      // Sign the user in (or link) with the credential
      await _firebaseAuth.signInWithCredential(credential);

      Loader.hide();
      CustomSnackBar.show('Success', message: 'Successfully logged in.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        Loader.hide();
        CustomSnackBar.show('Error', message: 'Invalid OTP.', type: 2);
      }
    }
  }
}

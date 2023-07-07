import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneakerlabs/controller/auth_controller.dart';
import 'package:sneakerlabs/util/extension.dart';
import 'package:sneakerlabs/util/snackbar.dart';
import 'package:sneakerlabs/widgets/widget_util.dart';

class LoginPage extends StatelessWidget with WidgetUtil {
  LoginPage({super.key});

  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
            padding: EdgeInsets.only(top: padding.top, left: 32, right: 32),
            child: SingleChildScrollView(
              child: Obx(
                () => Column(
                  children: [
                    const Gap(50),
                    titleText('Sign In'),
                    const Gap(100),
                    customTextField(_mobileController,
                        hintText: 'Enter mobile number',
                        formatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textInputType: TextInputType.number,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                          child: Column(
                            children: [
                              const Spacer(),
                              Text(
                                '+91',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ), onChanged: (value) {
                      _authController.otpSend = false;
                    }),
                    const Gap(16),
                    customTextField(
                      _otpController,
                      hintText: 'Enter OTP',
                      readOnly: !_authController.otpSend,
                      formatters: [
                        LengthLimitingTextInputFormatter(6),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textInputType: TextInputType.number,
                    ),
                    const Gap(32),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_mobileController.isEmpty()) {
                            CustomSnackBar.show('Warning',
                                message: 'Mobile number can\'t be empty',
                                type: 1);
                            return;
                          }
                          if (_mobileController.len() < 10) {
                            CustomSnackBar.show('Warning',
                                message: 'Enter a valid mobile number',
                                type: 1);
                            return;
                          }
                          if (_authController.otpSend) {
                            if (_otpController.len() < 6) {
                              CustomSnackBar.show('Warning',
                                  message: 'OTP must be in 6 digit.', type: 1);
                              return;
                            }
                          }
                          _authController.otpSend
                              ? _authController
                                  .verifyOtpAction(_otpController.getValue())
                              : _authController
                                  .sendOtpAction(_mobileController.getValue());
                        },
                        child: Text(_authController.otpSend
                            ? 'Verify OTP'
                            : 'Send OTP'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

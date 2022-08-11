import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:simplechat/Constants/app_color.dart';
import 'package:simplechat/features/dashboard/dashboard.dart';

import '../../../Constants/image_constants.dart';

class OtpInputScreen extends StatefulWidget {
  const OtpInputScreen({Key? key}) : super(key: key);
  static const String routeName = '/Otp_Input_Screen';

  @override
  State<OtpInputScreen> createState() => _OtpInputScreenState();
}

class _OtpInputScreenState extends State<OtpInputScreen> {
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20, color: AppColor.darkGreen, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.darkGreen,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColor.darkGreen, width: 2),
      // borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: AppColor.darkGreen.withOpacity(0.2),
      ),
    );
    @override
    final focus = FocusNode();
    final args = ModalRoute.of(context)!.settings.arguments;

    print(args);
    var outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: AppColor.darkGreen,
      ),
      borderRadius: BorderRadius.circular(10),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImage.otpFemale),
                const Text(
                  'Verification Code',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "+$args",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.edit,
                        color: AppColor.darkGreen,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'OTP has been sent to your mobile number. Please verify',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                Pinput(
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  // validator: (s) {
                  //   return s == '2222' ? null : 'Pin is incorrect';
                  // },

                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  // height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, DashboardScreen.routeName, (route) => false);
                      // Navigator.pushAndRemoveUntil(context, HomeScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        primary: AppColor.darkGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

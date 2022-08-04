import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simplechat/Constants/app_color.dart';
import 'package:simplechat/Constants/image_constants.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/Phone_Login_Screen';

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  String _countryCode = '91';
  @override
  Widget build(BuildContext context) {
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
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImage.otpMale),
                  const Text(
                    'Enter Your Mobile Number',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    child: Text(
                      'You\'ll receive a 6 digit code to verify next.',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _phoneNumberController,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Please enter your phone number';
                      } else if (value.length < 10) {
                        return 'Please enter valid phone number';
                      }
                      return null;
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      errorStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColor.darkGreen),
                      labelStyle: const TextStyle(fontSize: 20),
                      prefixIcon: InkWell(
                        onTap: () {
                          print('Country Code');
                          showCountryPicker(
                            context: context,
                            showPhoneCode: true,
                            favorite: ['IN', 'US'],
                            countryListTheme: CountryListThemeData(
                              flagSize: 25,
                              backgroundColor: Colors.white,
                              textStyle: const TextStyle(
                                  fontSize: 16, color: Colors.blueGrey),
                              bottomSheetHeight: 500,

                              // Optional. Country list modal height
                              //Optional. Sets the border radius for the bottomsheet.
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              //Optional. Styles the search field.
                              inputDecoration: InputDecoration(
                                labelText: 'Search',
                                hintText: 'Start typing to search',
                                prefixIcon: const Icon(Icons.search),
                                border: outlineInputBorder,
                                enabledBorder: outlineInputBorder,
                                focusedBorder: outlineInputBorder,
                                disabledBorder: outlineInputBorder,
                                errorBorder: outlineInputBorder,
                                focusedErrorBorder: outlineInputBorder,
                              ),
                            ),
                            onSelect: (Country country) {
                              print('Select country: ${country.displayName}');
                              setState(() {
                                _countryCode = country.phoneCode;
                              });
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 3, 10, 0),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("+" + _countryCode,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(width: 5),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                      border: outlineInputBorder,
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      disabledBorder: outlineInputBorder,
                      errorBorder: outlineInputBorder,
                      focusedErrorBorder: outlineInputBorder,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    // height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Navigator.of(context).pushNamed(OTPScreen.routeName,arguments: _phoneNumberController.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          // shadowColor: AppColor.darkGreen.withOpacity(0.5),
                          primary: AppColor.darkGreen,
                          // textStyle: ,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../const/const.dart';
import '../../const/gobalcolor.dart';
import '../../model/profilemodel.dart';
import '../../res/routes/routes_name.dart';
import '../../service/database/firebase_database_provider.dart';
import '../../view_model/controller/loading_controller.dart';
import '../../widget/loadingwidget.dart';
import '../../widget/textfieldformwidget.dart';
import '../../widget/textform_title_widget.dart';
import 'widget/app_icon_widget.dart';

/// The registration Page  where users can signup for a new account.
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final loadingController = Get.put(LoadingController());

  // Text Editing Controller
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  // google Form Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String genderToString(Gender gender) {
    switch (gender) {
      case Gender.male:
        return "Male";

      case Gender.female:
        return "Female";
      case Gender.other:
        return "Other";
    }
  }

  Gender _selectGender = Gender.male;

  UserCredential? userCredential;

  @override
  void dispose() {
    _phoneController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Material(
        color: AppColors.white,
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mq.width * .0444, vertical: mq.height * .024),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const AppIconWidget(title: 'Registration'),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormTitleWidget(
                          textFieldWidget: TextFieldFormWidget(
                            hintText: 'Your Name',
                            controller: _nameController,
                            validator: (value) => value!.isEmpty
                                ? 'Please enter your name'
                                : null,
                          ),
                          title: 'Name',
                        ),
                        TextFormTitleWidget(
                            title: "Email",
                            textFieldWidget: TextFieldFormWidget(
                              hintText: 'Email Address',
                              controller: _emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your Email Address';
                                } else if (globalMethod.isValidEmail(value) ==
                                    false) {
                                  return 'Please Enter a Valid Email Address';
                                }
                                return null;
                              },
                              textInputType: TextInputType.emailAddress,
                            )),
                        TextFormTitleWidget(
                          title: "Phone",
                          textFieldWidget: TextFieldFormWidget(
                            hintText: 'Phone Number',
                            controller: _phoneController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Email Address';
                              } else if (!(value.length == 11)) {
                                return 'Phone Number Must Be 11 Digit';
                              }
                              return null;
                            },
                            textInputType: TextInputType.phone,
                          ),
                        ),
                        TextFormTitleWidget(
                            title: "Password",
                            textFieldWidget: TextFieldFormWidget(
                              obscureText: true,
                              isShowPassword: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your Password';
                                } else if (value.length < 6) {
                                  return "Password Must be 6 Character";
                                }
                                return null;
                              },
                              hintText: "Password",
                              controller: _passwordController,
                            )),
                        TextFormTitleWidget(
                          title: "Confirm Password",
                          textFieldWidget: TextFieldFormWidget(
                            obscureText: true,
                            isShowPassword: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Confirm Password';
                              } else if (value.length < 6) {
                                return "Password Must be 6 Character";
                              }
                              return null;
                            },
                            hintText: "Confirm Password",
                            controller: _confirmpasswordController,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Gender",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            // understand this code
                            ...Gender.values.map((gender) => Row(
                                  children: [
                                    Radio<Gender>(
                                      value: gender,
                                      groupValue: _selectGender,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectGender = value!;
                                        });
                                      },
                                    ),
                                    Text(
                                      genderToString(gender),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mq.height * .018,
                  ),
                  Obx(
                    () {
                      return _buildSignUpButton(loadingController);
                    },
                  ),
                  SizedBox(
                    height: mq.height * .03,
                  ),
                  globalMethod.buldRichText(
                      context: context,
                      simpleText: "Already Create An Account? ",
                      colorText: "Sign In",
                      function: () {
                        // Navigator.pushReplacementNamed(
                        //     context, AppRouters.loginPage);

                        Get.offNamed(RoutesName.loginPage);
                      }),
                  SizedBox(
                    height: mq.height * .12,
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget _buildSignUpButton(
    LoadingController loadingProvider,
  ) {
    return SizedBox(
      width: mq.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.greenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * 0.022, vertical: mq.height * 0.018),
        ),
        onPressed: () async {
          if (!_formKey.currentState!.validate()) return;

          if (_passwordController.text.trim() !=
              _confirmpasswordController.text.trim()) {
            globalMethod.showErrorDialog(
                context,
                "The password and confirm password fields do not match. Please ensure both fields contain the same password.",
                "Password Mismatch");
            return;
          }

          showDialog(
            context: context,
            builder: (context) {
              return const LoadingWidget(message: "Registration......");
            },
          );

          loadingProvider.setLoading( true);

          // Check Internet Connection
          var connectivityResult = await (Connectivity().checkConnectivity());
          if (connectivityResult == ConnectivityResult.none) {
            globalMethod.flutterToast(msg: "No Internet Connection");
            loadingProvider.setLoading( false);
            if (mounted) {
              Navigator.pop(context);
            }
          }

          try {
            // Create A new user on Firebase
            await FirebaseServiceProvider.createUserWithEmilandPasswordSnaphsot(
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim())
                .then((userCredential) {
              loadingProvider.setLoading( false);

              ProfileModel profileModel = ProfileModel(
                name: _nameController.text,
                gender: _selectGender.name,
                status: "not_approved",
                email: _emailController.text,
                phone: _phoneController.text,
                uid: userCredential.user!.uid,
              );

              // Upload new user data on Firebase firestore
              FirebaseServiceProvider.uploadUserInformationFirebaseDatabase(
                  profileModel: profileModel);

              globalMethod.flutterToast(msg: "Successfully Register");

              // Navigator.pushReplacementNamed(
              //     context, AppRouters.userVerifyPage,
              //     arguments: userCredential);

              Get.offNamed(RoutesName.userVerifyPage);
            });
          } on FirebaseAuthException catch (e) {
            if (mounted) {
              print(e.toString());
              globalMethod.handleError(context, e, loadingProvider);
            }
          } catch (e) {
            if (mounted) {
              Navigator.pop(context);
              globalMethod.showErrorDialog(
                  context, e.toString(), 'Error Occurred');
            }

            loadingProvider.setLoading( false);
          } finally {
            loadingProvider.setLoading( false);
          }
        },
        child: loadingProvider.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColors.white,
                ),
              )
            : Text(
                "Sign Up",
                style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
      ),
    );
  }
}

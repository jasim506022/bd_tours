// Import Necessary Package and Files
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// Import Constant and Configuration and Widget

import '../../const/const.dart';
import '../../../res/app_colors.dart';
import '../../res/apps_function.dart';
import '../../res/routes/routes_name.dart';
import '../../service/database/firebase_database_provider.dart';
import '../../controller/loading_controller.dart';
import '../../widget/show_error_dialog_widget.dart';
import '../../widget/textfieldformwidget.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  // Text Edit Controller
  final TextEditingController _emailController = TextEditingController();

  // Global Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final loadingController = Get.put(LoadingController());

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Forgot Password",
            style: GoogleFonts.poppins(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "Enter Email Address",
                      style: GoogleFonts.poppins(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFieldFormWidget(
                      autofocus: false,
                      hintText: 'Email Address',
                      controller: _emailController,
                      validator: (emailText) {
                        if (emailText!.isEmpty) {
                          return 'Please enter your Email Address';
                        } else if (!AppsFunction.isValidEmail(emailText)) {
                          return 'Please Enter a Valid Email Address';
                        }
                        return null;
                      },
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Back to Login",
                        style: GoogleFonts.poppins(
                            color: AppColors.hintLightColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildLoginButton(),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              AppsFunction.buildRichText(
                colorText: "Create Account",
                context: context,
                function: () {
                  // Navigator.pushNamed(context, AppRouters.registrationPage);
                  Get.offNamed(RoutesName.registrationPage);
                },
                simpleText: "Don't Have An Account? ",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoginButton() {
    return SizedBox(
      width: mq.width,
      child:
          Obx(() {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.greenColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          ),
          onPressed: () async {
            FocusScope.of(context).unfocus();
            if (!_formKey.currentState!.validate()) return;

            // Check Internet Connection
            bool isCheckInternet = await AppsFunction.internetChecking();
            if (isCheckInternet) {
              AppsFunction.flutterToast(msg: "No Internet Connection");
            } else {
              try {
                loadingController.setLoading(true);
                bool emailExist = await FirebaseServiceProvider.isEmailExist(
                    email: _emailController.text);
                if (emailExist) {
                  FirebaseServiceProvider.sendPasswordResetEmail(
                          email: _emailController.text)
                      .then((value) {
                    loadingController.setLoading( false);
                    AppsFunction.flutterToast(
                        msg:
                            "Password reset email sent to ${_emailController.text}");
                  });
                } else {
                  loadingController.setLoading( false);
                  AppsFunction.flutterToast(
                      msg: "Email Does Not Exist in the database");
                }
              } on FirebaseAuthException catch (e) {
                if (!context.mounted) return;
                AppsFunction.handleError(context, e, loadingController);
              } catch (e) {
                if (!context.mounted) return;
                showDialog(
                  context: context,
                  builder: (context) {
                    return ShowErrorDialogWidget(
                      message: e.toString(),
                      title: 'Error Occurred',
                    );
                  },
                );

                loadingController.setLoading(false);
              }
            }
          },
          child: loadingController.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: AppColors.white,
                  ),
                )
              : Text("Forget Password",
                  style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14)),
        );
      }),
    );
  }
}

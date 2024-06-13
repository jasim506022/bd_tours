// Import Necessary Package and Files
import 'package:bd_tour_firebase/res/assets/animation_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../const/const.dart';
import '../../const/gobalcolor.dart';
import '../../res/routes/routes_name.dart';
import '../../view_model/controller/loading_controller.dart';
import '../../view_model/controller/login_view_model.dart';
import '../../widget/custom_button_widget.dart';
import '../../widget/textfieldformwidget.dart';
import '../../widget/textform_title_widget.dart';
import 'widget/app_icon_widget.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> with TickerProviderStateMixin {
  final loginViewModel = Get.put(LoginController());
  final loadingController = Get.put(LoadingController());

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.didChangeDependencies();
  }

  // Text Edit Controller
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();



  // Global Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();

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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              AppIconWidget(title: 'welcome_back'.tr),
              const SizedBox(
                height: 15,
              ),
              _buildLoginForm(),
              _buildForgetPasswordButton(),
              const SizedBox(height: 15),
              _buildLoginButton(),
              SizedBox(
                height: mq.height * .03,
              ),
              _buildOrDividerText(),
              SizedBox(
                height: mq.height * .024,
              ),
              _buildSocialLoginOptions(context),
              SizedBox(
                height: mq.height * .03,
              ),
              _buildCreateAccount(context),
              SizedBox(
                height: mq.height * .08,
              ),
              _buildSelectLanguage(),
              SizedBox(
                height: mq.height * .12,
              ),
            ],
          ),
        )),
      ),
    );
  }

  Form _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormTitleWidget(
            textFieldWidget: TextFieldFormWidget(
              autofocus: false,
              hintText: 'enter_email_address'.tr,
              controller: _emailController,
              validator: (emailText) {
                if (emailText!.isEmpty) {
                  return 'please_enter_your_email_address'.tr;
                } else if (!globalMethod.isValidEmail(emailText)) {
                  return 'please_enter_a_valid_email_address'.tr;
                }
                return null;
              },
              textInputType: TextInputType.emailAddress,
            ),
            title: 'email'.tr,
          ),
          TextFormTitleWidget(
            textFieldWidget: TextFieldFormWidget(
              icon: "asset/svg/password.svg",
              autofocus: false,
              isShowPassword: true,
              obscureText: true,
              validator: (passwordText) {
                if (passwordText!.isEmpty) {
                  return 'please_enter_your_password'.tr;
                } else if (passwordText.length < 6) {
                  return 'password_should_be_alphanumeric'.tr;
                }
                return null;
              },
              hintText: "enter_password".tr,
              controller: _passwordController,
            ),
            title: 'password'.tr,
          ),
        ],
      ),
    );
  }

  Align _buildForgetPasswordButton() {
    return Align(
        alignment: Alignment.topRight,
        child: TextButton(
          onPressed: () {
            Get.toNamed(RoutesName.forgetPasswordPage);
          },
          child: Text(
            "forget_password".tr,
            style: GoogleFonts.poppins(
                color: AppColors.hintLightColor, fontWeight: FontWeight.w700),
          ),
        ));
  }

  SizedBox _buildLoginButton() {
    return SizedBox(
      width: mq.width,
      child: CustomButtonWidget(
        onPressed: () async {
          if (!_formKey.currentState!.validate()) return;
          bool isCheckInternet = await globalMethod.internetChecking();

          if (isCheckInternet) {
            loadingController.setLoading(false);
            globalMethod.errorDialog(
              animationAssets: AnimationAssets.noInternetAnimation,
              title: "no_internet".tr,
              content: "no_internet_message".tr,
              buttonText: "try_again".tr,
            );
          } else {
            loginViewModel.performLoginAction(
                _emailController.text, _passwordController.text);
          }
        }, buttonText: 'Log In',
      ),
    );
  }

  Row _buildOrDividerText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: mq.height * .003,
          width: mq.width * .156,
          color: AppColors.grey,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: mq.width * .033),
          child: Text(
            "with_or".tr,
            style: TextStyle(color: AppColors.grey),
          ),
        ),
        Container(
          height: mq.height * .003,
          width: mq.width * .156,
          color: AppColors.grey,
        ),
      ],
    );
  }

  Row _buildSocialLoginOptions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildSocialLoginButton(
              function: () async {},
              color: AppColors.facebookColor,
              image: "asset/icons/facebook.png",
              title: "Facebook"),
        ),
        SizedBox(
          width: mq.width * .0444,
        ),
        Expanded(
          child: _buildSocialLoginButton(
              function: () async {
                bool isCheckInternet = await globalMethod.internetChecking();
                if (isCheckInternet) {
                  globalMethod.errorDialog(
                    animationAssets: AnimationAssets.noInternetAnimation,
                    title: "no_internet".tr,
                    content: "no_internet_message".tr,
                    buttonText: "try_again".tr,
                  );
                } else {
                  loginViewModel.loginWithGmail();
                }
              },
              color: AppColors.red,
              image: "asset/icons/gmail.png",
              title: "Gmail"),
        ),
      ],
    );
  }

  InkWell _buildSocialLoginButton(
      {required Function function,
      required Color color,
      required String image,
      required String title}) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        alignment: Alignment.center,
        height: mq.height * 0.071,
        width: mq.width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: mq.height * .041,
                width: mq.height * .041,
                color: AppColors.white,
              ),
              SizedBox(
                width: mq.width * .033,
              ),
              Text(
                title,
                style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildCreateAccount(BuildContext context) {
    return SizedBox(
      child: globalMethod.buildRichText(
        colorText: "create_account".tr,
        context: context,
        function: () {
          Get.toNamed(RoutesName.registrationPage);
          _passwordController.clear();
          _emailController.clear();

        },
        simpleText: "do_have_account?".tr,
      ),
    );
  }
}

Row _buildSelectLanguage() {
  return Row(
    children: [
      Text(
        "Select Language: ",
        style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.lightBlack),
      ),
      TextButton(
          onPressed: () {
            Get.updateLocale(const Locale('en', 'US'));
          },
          child: Text(
            "English",
            style:
                GoogleFonts.poppins(fontSize: 14, color: AppColors.lightBlack),
          )),
      TextButton(
          onPressed: () {
            Get.updateLocale(const Locale('bn', 'BD'));
          },
          child: Text("বাংলা",
              style: GoogleFonts.poppins(
                  fontSize: 14, color: AppColors.lightBlack))),
    ],
  );
}

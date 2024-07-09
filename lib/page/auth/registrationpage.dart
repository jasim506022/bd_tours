import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/const.dart';
import '../../const/gobalcolor.dart';
import '../../model/profile_model.dart';
import '../../res/assets/animation_assets.dart';
import '../../res/routes/routes_name.dart';

import '../../view_model/controller/SelectGenderController.dart';
import '../../view_model/controller/loading_controller.dart';
import '../../view_model/controller/registration_controller.dart';
import '../../widget/custom_button_widget.dart';

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
  final selectGenderController = Get.put(SelectGenderController());
  final registrationController = Get.put(RegistrationController());

  // Text Editing Controller
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  // google Form Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  _buildRegistrationForm(),
                  SizedBox(
                    height: mq.height * .018,
                  ),
                  _buildRegistrationButton(),
                  SizedBox(
                    height: mq.height * .03,
                  ),
                  globalMethod.buildRichText(
                      context: context,
                      simpleText: "Already Create An Account? ",
                      colorText: "Sign In",
                      function: () {
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

  Form _buildRegistrationForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormTitleWidget(
            textFieldWidget: TextFieldFormWidget(
              icon: "asset/svg/person.svg",
              hintText: 'enter_your_full_name'.tr,
              controller: _nameController,
              validator: (value) =>
                  value!.isEmpty ? 'enter_your_full_name'.tr : null,
            ),
            title: 'name'.tr,
          ),
          TextFormTitleWidget(
              title: "email".tr,
              textFieldWidget: TextFieldFormWidget(
                icon: "asset/svg/person.svg",
                hintText: 'enter_email_address'.tr,
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please_enter_your_email_address'.tr;
                  } else if (globalMethod.isValidEmail(value) == false) {
                    return 'please_enter_a_valid_email_address'.tr;
                  }
                  return null;
                },
                textInputType: TextInputType.emailAddress,
              )),
          TextFormTitleWidget(
            title: "phone".tr,
            textFieldWidget: TextFieldFormWidget(
              hintText: 'enter_phone_number'.tr,
              controller: _phoneController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'enter_your_phone_number'.tr;
                } else if (!(value.length == 11)) {
                  return 'enter_your_digit_number'.tr;
                }
                return null;
              },
              textInputType: TextInputType.phone,
            ),
          ),
          TextFormTitleWidget(
              title: "password".tr,
              textFieldWidget: TextFieldFormWidget(
                obscureText: true,
                isShowPassword: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please_enter_your_password'.tr;
                  } else if (value.length < 6) {
                    return "password_should_be_alphanumeric".tr;
                  }
                  return null;
                },
                hintText: "enter_email_password".tr,
                controller: _passwordController,
              )),
          TextFormTitleWidget(
            title: "confirm_password".tr,
            textFieldWidget: TextFieldFormWidget(
              obscureText: true,
              isShowPassword: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please_enter_confirm_password'.tr;
                } else if (value.length < 6) {
                  return "password_should_be_alphanumeric".tr;
                }
                return null;
              },
              hintText: "enter_confirm_password".tr,
              controller: _confirmpasswordController,
            ),
          ),
          // Understand Row Mail
          Row(
            children: [
              Text(
                "gender".tr,
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
                      Obx(
                        () => Radio<Gender>(
                          value: gender,
                          groupValue: selectGenderController.selectGender.value,
                          onChanged: (genderValue) {
                            selectGenderController.setGender(genderValue!);
                          },
                        ),
                      ),
                      Text(
                        selectGenderController.genderToString(gender),
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
    );
  }

  Widget _buildRegistrationButton() {
    return SizedBox(
        width: mq.width,
        child: CustomButtonWidget(
          onPressed: () async {
            if (!_formKey.currentState!.validate()) return;
            if (_passwordController.text.trim() !=
                _confirmpasswordController.text.trim()) {
              globalMethod.errorDialog(
                animationAssets: AnimationAssets.noInternetAnimation,
                title: "Password Mismatch",
                content:
                    "The password and confirm password fields do not match. Please ensure both fields contain the same password.",
              );

              return;
            }
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
              ProfileModel profileModel = ProfileModel(
                name: _nameController.text,
                gender: selectGenderController.selectGender.value.name,
                status: "not_approved",
                email: _emailController.text,
                phone: _phoneController.text,
              );
              await registrationController
                  .createUserWithEmilandPasswordSnaphsot(
                      email: _emailController.text,
                      password: _emailController.text,
                      profileModel: profileModel);
            }
          },
          buttonText: 'Registration',
        ));
  }
}

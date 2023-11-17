// ignore_for_file: file_names

import 'package:ejara_assignment_project/constants/app_colors.dart';
import 'package:ejara_assignment_project/constants/app_icons.dart';
import 'package:ejara_assignment_project/constants/app_textSizes.dart';
import 'package:ejara_assignment_project/screens/choosePaymentMethodScreen.dart';
import 'package:ejara_assignment_project/widgets/buttons/primaryButton.dart';
import 'package:ejara_assignment_project/widgets/inputs/customTextfield.dart';
import 'package:ejara_assignment_project/widgets/inputs/inputLabel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obsecurePasswordText = true;
  bool isUsernameEmpty = true;
  bool isPasswordEmpty = true;
  bool isButtonLoading = false;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String? emailValidationLabel;
  String? passwordValidationLabel;

  @override
  void initState() {
    // implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    usernameController.addListener(() {
      setState(() {
        isUsernameEmpty = usernameController.text.trim().isEmpty;
      });
    });

    passwordController.addListener(() {
      setState(() {
        isPasswordEmpty = passwordController.text.trim().isEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: IgnorePointer(
          ignoring: isButtonLoading,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(top: 130, bottom: 30),
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  InputLabel(
                    label: 'Username',
                    labelStyle:
                        Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w100,
                              fontSize: AppTextSizes.buttonTextRegular,
                            ),
                  ),
                  const SizedBox(height: 7),
                  CustomTextFormField(
                    controller: usernameController,
                    textCaps: TextCapitalization.none,
                    textInputType: TextInputType.emailAddress,
                    validationLabel: emailValidationLabel,
                    hint: 'username',
                    autofillHints: const [AutofillHints.email],
                  ),
                  const SizedBox(height: 20),
                  InputLabel(
                    label: 'Password',
                    labelStyle:
                        Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w100,
                              fontSize: AppTextSizes.buttonTextRegular,
                            ),
                  ),
                  const SizedBox(height: 7),
                  CustomTextFormField(
                    controller: passwordController,
                    obscuringCharater: '•',
                    obscureText: obsecurePasswordText,
                    validationLabel: passwordValidationLabel,
                    hint: '************',
                    autofillHints: const [AutofillHints.password],
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          obsecurePasswordText = !obsecurePasswordText;
                        });
                      },
                      icon: SvgPicture.asset(
                        obsecurePasswordText
                            ? AppIcons.eyeOpened
                            : AppIcons.eyeClosed,
                        colorFilter: const ColorFilter.mode(
                          AppColor.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  PrimaryButton(
                    isLoading: isButtonLoading,
                    label: 'Sign in',
                    onPressed: isUsernameEmpty || isPasswordEmpty
                        ? null
                        : () {
                            Navigator.pushNamed(
                              context,
                              ChoosePaymentMethodScreen.routeName,
                            );
                          },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

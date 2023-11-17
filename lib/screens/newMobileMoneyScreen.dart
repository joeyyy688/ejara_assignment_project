// ignore_for_file: file_names

import 'package:ejara_assignment_project/constants/app_textSizes.dart';
import 'package:ejara_assignment_project/widgets/buttons/primaryButton.dart';
import 'package:ejara_assignment_project/widgets/customAppBar.dart';
import 'package:ejara_assignment_project/widgets/inputs/customDropDownFormField.dart';
import 'package:ejara_assignment_project/widgets/inputs/customTextfield.dart';
import 'package:ejara_assignment_project/widgets/inputs/inputLabel.dart';
import 'package:ejara_assignment_project/widgets/switchActionCard.dart';
import 'package:flutter/material.dart';

class NewMobileMoneyScreen extends StatefulWidget {
  static const routeName = '/newMobileMoneyScreen';

  const NewMobileMoneyScreen({super.key});

  @override
  State<NewMobileMoneyScreen> createState() => _NewMobileMoneyScreenState();
}

class _NewMobileMoneyScreenState extends State<NewMobileMoneyScreen> {
  final phoneNumberController = TextEditingController();
  final fullNameController = TextEditingController();

  List<String> demoList = ['Orange Money', 'Vodafone Cash'];
  bool saveAsPaymentMethod = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: CustomAppBar(
          iconData: Icons.close_rounded,
          pageBackButtonCallback: () {
            Navigator.maybePop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'New Mobile Money',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: AppTextSizes.title1Regular,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            InputLabel(
              label: 'Choose the mobile money operator',
              labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w100,
                    fontSize: AppTextSizes.buttonTextRegular,
                  ),
            ),
            const SizedBox(height: 7),
            CustomDropDownFormField<String>(
              items: demoList,
              buildItem: (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: AppTextSizes.labelText1,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            InputLabel(
              label: 'Phone number',
              labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w100,
                    fontSize: AppTextSizes.buttonTextRegular,
                  ),
            ),
            const SizedBox(height: 7),
            CustomTextFormField(
              textInputType: TextInputType.number,
              controller: phoneNumberController,
              hint: 'phone number',
            ),
            const SizedBox(height: 20),
            InputLabel(
              label: 'Full name',
              labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w100,
                    fontSize: AppTextSizes.buttonTextRegular,
                  ),
            ),
            const SizedBox(height: 7),
            CustomTextFormField(
              textInputType: TextInputType.name,
              controller: fullNameController,
              hint: 'full name',
            ),
            const SizedBox(
              height: 20,
            ),
            SwitchActionCard(
              title: 'Save as payment method',
              onChanged: (value) {
                setState(() {
                  saveAsPaymentMethod = value;
                });
              },
              switchValue: saveAsPaymentMethod,
            ),
            const Spacer(),
            PrimaryButton(
              label: 'Continue',
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

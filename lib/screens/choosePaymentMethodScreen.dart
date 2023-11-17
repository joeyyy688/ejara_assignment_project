// ignore_for_file: file_names

import 'package:ejara_assignment_project/constants/app_textSizes.dart';
import 'package:ejara_assignment_project/widgets/customAppBar.dart';
import 'package:ejara_assignment_project/widgets/ejaraFlexCard.dart';
import 'package:flutter/material.dart';

class ChoosePaymentMethodScreen extends StatelessWidget {
  static const routeName = '/choosePaymentMethodScreen';

  const ChoosePaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: CustomAppBar(
          pageBackButtonCallback: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose a payment method',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: AppTextSizes.title1Regular,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const EjaraFlexCard(),
              Container(
                margin: const EdgeInsets.only(top: 25),
                child: Text(
                  'Select a payment methods',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

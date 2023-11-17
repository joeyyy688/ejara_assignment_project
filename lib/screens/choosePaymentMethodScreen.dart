// ignore_for_file: file_names

import 'package:ejara_assignment_project/Utilities/selectMobileMoneyMethodModalSheet.dart';
import 'package:ejara_assignment_project/constants/app_textSizes.dart';
import 'package:ejara_assignment_project/constants/data.dart';
import 'package:ejara_assignment_project/widgets/customAppBar.dart';
import 'package:ejara_assignment_project/widgets/ejaraFlexCard.dart';
import 'package:ejara_assignment_project/widgets/selectPaymentMethodsItem.dart';
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
          iconData: Icons.arrow_back_ios_new_rounded,
          pageBackButtonCallback: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                'Choose a payment method',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: AppTextSizes.title1Regular,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            const SliverToBoxAdapter(child: EjaraFlexCard()),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 25, bottom: 10),
                child: Text(
                  'Select a payment methods',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    onTap: () {
                      SelectMobileMoneyBottomSheet().showSelectMobileMoneyModal(
                        context: context,
                      );
                    },
                    child: SelectPaymentMethodsItem(
                      title: selectPaymentMethodsData[index].title,
                      subtitle: selectPaymentMethodsData[index].subtitle,
                      icon: selectPaymentMethodsData[index].icon,
                    ),
                  );
                },
                childCount: selectPaymentMethodsData.length,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}

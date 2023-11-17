// ignore_for_file: file_names

import 'package:ejara_assignment_project/Utilities/selectMobileMoneyMethodModalSheet.dart';
import 'package:ejara_assignment_project/Utilities/userAuthSecureStorage.dart';
import 'package:ejara_assignment_project/Utilities/utils.dart';
import 'package:ejara_assignment_project/apis/models/paymentMethodsResponse.dart';
import 'package:ejara_assignment_project/apis/services/authApis.dart';
import 'package:ejara_assignment_project/apis/services/paymentMethodsApis.dart';
import 'package:ejara_assignment_project/constants/app_colors.dart';
import 'package:ejara_assignment_project/constants/app_textSizes.dart';
import 'package:ejara_assignment_project/constants/data.dart';
import 'package:ejara_assignment_project/providers/paymentMethodsProvider.dart';
import 'package:ejara_assignment_project/widgets/customAppBar.dart';
import 'package:ejara_assignment_project/widgets/ejaraFlexCard.dart';
import 'package:ejara_assignment_project/widgets/platformSpecificLoader.dart';
import 'package:ejara_assignment_project/widgets/selectPaymentMethodsItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoosePaymentMethodScreen extends StatefulWidget {
  static const routeName = '/';

  const ChoosePaymentMethodScreen({super.key});

  @override
  State<ChoosePaymentMethodScreen> createState() =>
      _ChoosePaymentMethodScreenState();
}

class _ChoosePaymentMethodScreenState extends State<ChoosePaymentMethodScreen> {
  PaymentMethodsResponse? paymentMethods;
  bool isScreenLoading = true;

  @override
  void initState() {
    // implement initState
    super.initState();

    AuthApis.login(username, password).then((value) async {
      if (value != null) {
        // store access token in local storage
        await UserAuthSecureStorage.setUserAuthToken(
          value.token,
        );

        PaymentMethodApis.getPaymentMethods().then((value) {
          setState(() {
            paymentMethods = value;
            isScreenLoading = false;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: CustomAppBar(
          iconData: Icons.arrow_back_ios_new_rounded,
          pageBackButtonCallback: () {
            Navigator.maybePop(context);
          },
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
            if (isScreenLoading) ...{
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: const PlatformSpecificLoader(
                    loaderColor: AppColor.primary,
                  ),
                ),
              )
            } else ...{
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
                        AuthApis.login(username, password).then((value) async {
                          if (value != null) {
                            // store access token in local storage
                            await UserAuthSecureStorage.setUserAuthToken(
                              value.token,
                            );

                            PaymentMethodApis.getPaymentSettingsPerMethod(
                              paymentMethods!.data[index].id.toString(),
                            ).then((value) {
                              Provider.of<PaymentMethodsProvider>(
                                context,
                                listen: false,
                              ).setPaymentSettingPerMethodResponse(value);
                            });
                          }
                        });

                        SelectMobileMoneyBottomSheet()
                            .showSelectMobileMoneyModal(
                          context: context,
                        );
                      },
                      child: SelectPaymentMethodsItem(
                        title: paymentMethods!.data[index].titleEn,
                        subtitle: paymentMethods!.data[index].descriptionEn,
                        icon: getListTileImage(
                          paymentMethods!.data[index].code,
                        ),
                      ),
                    );
                  },
                  childCount: paymentMethods!.data.length,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 50,
                ),
              )
            }
          ],
        ),
      ),
    );
  }
}

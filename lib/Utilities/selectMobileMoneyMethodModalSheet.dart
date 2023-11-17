// ignore_for_file: file_names, deprecated_member_use

import 'package:ejara_assignment_project/constants/app_colors.dart';
import 'package:ejara_assignment_project/constants/app_icons.dart';
import 'package:ejara_assignment_project/constants/app_textSizes.dart';
import 'package:ejara_assignment_project/constants/data.dart';
import 'package:ejara_assignment_project/screens/newMobileMoneyScreen.dart';
import 'package:ejara_assignment_project/widgets/buttons/iconButton.dart';
import 'package:ejara_assignment_project/widgets/buttons/primaryButton.dart';
import 'package:ejara_assignment_project/widgets/customDivider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectMobileMoneyBottomSheet {
  showSelectMobileMoneyModal({
    required BuildContext context,
  }) {
    String? defaultSelectedVariationName;
    //set up the Modal Sheet
    final modal = StatefulBuilder(
      builder: (context, setState) => Container(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'Select the mobile money method',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColor.primary,
                            fontWeight: FontWeight.w700,
                            fontSize: AppTextSizes.labelText1,
                          ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(
                    AppIcons.cross,
                    colorFilter: const ColorFilter.mode(
                      AppColor.primary,
                      BlendMode.srcIn,
                    ),
                    height: 30,
                    width: 30,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: const CustomDivider(),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: selectMobileMoneyMethod.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Card(
                      elevation: 1,
                      shadowColor: Colors.grey.withOpacity(0.2),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: RadioListTile<String>(
                        title: Text(
                          selectMobileMoneyMethod[index].title,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: AppTextSizes.labelText1,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        subtitle: Text(
                          selectMobileMoneyMethod[index].subtitle,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: AppTextSizes.labelText1,
                                    fontWeight: FontWeight.w100,
                                    color: AppColor.grey4,
                                  ),
                        ),
                        activeColor: AppColor.primary,
                        dense: true,
                        value: selectMobileMoneyMethod[index].subtitle,
                        groupValue: defaultSelectedVariationName,
                        onChanged: (value) {
                          setState(() {
                            defaultSelectedVariationName = value!;
                          });
                        },
                      ),
                    ),
                  );
                }),
            const SplitDivider(
              text: 'Or',
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              padding: const EdgeInsets.only(bottom: 30),
              child: CustomIconButton(
                label: 'Another mobile money method',
                color: const Color(0xfff3f3fe),
                icon: const Icon(
                  Icons.add,
                  color: Color(0xff7177ed),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    NewMobileMoneyScreen.routeName,
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: PrimaryButton(
                label: 'Continue',
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );

    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        //prevent Back button press
        return Wrap(
          children: [
            WillPopScope(
              onWillPop: () {
                return Future.value(false);
              },
              child: modal,
            )
          ],
        );
      },
    );
  }
}

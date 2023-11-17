// ignore_for_file: file_names

import 'package:ejara_assignment_project/constants/app_colors.dart';
import 'package:ejara_assignment_project/constants/app_textSizes.dart';
import 'package:flutter/material.dart';

class EjaraFlexCard extends StatelessWidget {
  const EjaraFlexCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              color: Color(0xffaeb4fe),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: const Icon(Icons.folder_outlined, color: AppColor.white),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              'Ejara Flex',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20, top: 10),
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: AppTextSizes.title1Regular,
                      fontWeight: FontWeight.w700,
                    ),
                children: const [
                  TextSpan(
                    text: '20,000',
                  ),
                  TextSpan(
                    text: 'CFA',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: AppColor.grey5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Text(
                  'Earnings per day',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: AppTextSizes.labelText1Medium,
                        fontWeight: FontWeight.w100,
                      ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Text(
                  '10,000CFA',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

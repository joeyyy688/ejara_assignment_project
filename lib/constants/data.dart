import 'package:ejara_assignment_project/models/selectMobileMoneyMethodItemModel.dart';
import 'package:ejara_assignment_project/models/selectPaymentMethodItemModel.dart';
import 'package:flutter/material.dart';

final selectPaymentMethodsData = [
  SelectPaymentMethodItem(
    icon: Icons.attach_money_rounded,
    subtitle: 'Fees: Offer',
    title: 'Cash payment',
  ),
  SelectPaymentMethodItem(
    icon: Icons.phone_iphone_outlined,
    subtitle: 'Fees: 200CFA',
    title: 'Mobile money',
  ),
  SelectPaymentMethodItem(
    icon: Icons.assured_workload_rounded,
    subtitle: 'Fees: Variable',
    title: 'Bank transfer',
  ),
  SelectPaymentMethodItem(
    icon: Icons.credit_card,
    subtitle: 'Fees: Variable',
    title: 'Credit card',
  ),
  SelectPaymentMethodItem(
    icon: Icons.wallet_rounded,
    subtitle: 'Fees',
    title: 'Crypto-currency',
  ),
];

final selectMobileMoneyMethod = [
  SelectMobileMoneyMethodItem(
    title: 'Orange Money',
    subtitle: '6 96 92, 09 08',
  ),
  SelectMobileMoneyMethodItem(
    title: 'MTN Mobile Money',
    subtitle: '6 78 89, 78 90',
  ),
  SelectMobileMoneyMethodItem(
    title: 'Orange Money',
    subtitle: '6 90 95, 04 90',
  ),
];

const String username = 'ejaraTests';
const String password = 'CmKVGexi%REJjn!u65BI7PlR5';

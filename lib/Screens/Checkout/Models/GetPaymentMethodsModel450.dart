import 'package:nopsuite/Models/CustomProperties.dart';
import 'dart:convert';

import 'package:nopsuite/Screens/Checkout/Models/GetPaymentMethodsModel.dart';

GetPaymentMethods getPaymentMethodsFromJson(String str) =>
    GetPaymentMethods.fromJson(json.decode(str));

String getPaymentMethodsToJson(GetPaymentMethods data) =>
    json.encode(data.toJson());

class GetPaymentMethods {
  GetPaymentMethods({
    required this.paymentMethods,
    required this.displayRewardPoints,
    required this.rewardPointsBalance,
    required this.rewardPointsToUse,
    required this.rewardPointsToUseAmount,
    required this.rewardPointsEnoughToPayForOrder,
    required this.useRewardPoints,
    required this.customProperties,
  });

  List<PaymentMethod> paymentMethods;
  bool displayRewardPoints;
  int rewardPointsBalance;
  int rewardPointsToUse;
  String rewardPointsToUseAmount;
  bool rewardPointsEnoughToPayForOrder;
  bool useRewardPoints;
  CustomProperties customProperties;

  factory GetPaymentMethods.fromJson(Map<String, dynamic> json) =>
      GetPaymentMethods(
        paymentMethods: List<PaymentMethod>.from(
            json["PaymentMethods"].map((x) => PaymentMethod.fromJson(x))),
        displayRewardPoints: json["DisplayRewardPoints"],
        rewardPointsBalance: json["RewardPointsBalance"],
        rewardPointsToUse: json["RewardPointsToUse"],
        rewardPointsToUseAmount: json["RewardPointsToUseAmount"],
        rewardPointsEnoughToPayForOrder:
            json["RewardPointsEnoughToPayForOrder"],
        useRewardPoints: json["UseRewardPoints"],
        customProperties: CustomProperties.fromJson(json["CustomProperties"]),
      );

  Map<String, dynamic> toJson() => {
        "PaymentMethods":
            List<dynamic>.from(paymentMethods.map((x) => x.toJson())),
        "DisplayRewardPoints": displayRewardPoints,
        "RewardPointsBalance": rewardPointsBalance,
        "RewardPointsToUse": rewardPointsToUse,
        "RewardPointsToUseAmount": rewardPointsToUseAmount,
        "RewardPointsEnoughToPayForOrder": rewardPointsEnoughToPayForOrder,
        "UseRewardPoints": useRewardPoints,
        "CustomProperties": customProperties.toJson(),
      };
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/DashboardScreens/attendance_screen.dart';

class DataFile {
  static List<LanguageModel> languageList = [
    LanguageModel(
      "English",
    ),
    LanguageModel(
      "Urdu",
    ),
  ];

  static List<GenderModel> genderList = [
    GenderModel(
      "Male",
    ),
    GenderModel(
      "Female",
    ),
    GenderModel(
      "Prefer not to say",
    ),
  ];

  static List<BankCardModel> backCardDataList = [
    BankCardModel("Mastercard", "xxxx xxxx xxxx 1234"),
    BankCardModel("Visa", "xxxx xxxx xxxx 9876"),
  ];

  static List<SchoolDetailsModel> schoolDetailsDataList = [
    SchoolDetailsModel("Horizon Public School", "Johar Town, Lahore"),
    SchoolDetailsModel("Kips School", "Wapda Town, Lahore"), SchoolDetailsModel("Horizon Public School", "Johar Town, Lahore"),
    SchoolDetailsModel("Kips School", "Wapda Town, Lahore"),
    SchoolDetailsModel("Horizon Public School", "Johar Town, Lahore"),
    SchoolDetailsModel("Kips School", "Wapda Town, Lahore"),
  ];

  static List<StudentDetailsModel> studentDetailsDataList = [
    StudentDetailsModel(
        "Muhammad Ali Nawaz",
        "VII",
        "Horizon Public School, Johar Twon, Lahore",
        "BMS1246574",
        "1 Aug, 2004"),
    StudentDetailsModel("Abdul Waheed", "V", "Kips School, Lahore",
        "BMS1246444", "2 June, 2000"),
  ];

  static List<FeesDetailsModel> feesDetailsModel = [
    FeesDetailsModel(
        "Muhammad Ali Nawaz",
        "VII",
        "Horizon Public School",
        "Monthly Fee",
        "1 Aug, 23",
        "Paid",
        "7,000 ${'Rs'.tr}",
        "${'Visa'.tr} **** **** **** 6743"),
    FeesDetailsModel("Abdul Waheed", "XII", "Kips School", "Monthly Fee",
        "2 June, 2000", "Paid", "12,000 ${'Rs'.tr}", "Meezan Bank"),
  ];

  static List<DuesDetailsModel> duesDetailsModel = [
    DuesDetailsModel("Abdul Waheed", "XII", "Kips School", "Monthly Dues",
        "2 June, 2000", "Paid", "12,000 ${'Rs'.tr}", "Meezan Bank"),
    DuesDetailsModel(
        "Muhammad Ali Nawaz",
        "VII",
        "Horizon Public School",
        "Monthly Dues",
        "1 Aug, 23",
        "Paid",
        "7,000 ${'Rs'.tr}",
        "${'Visa'.tr} **** **** **** 6743"),
  ];

  static List<MartItemDetailsModel> martItemDetailsModel = [
    MartItemDetailsModel(
        "Clip Pack",
        "https://cdn.shopify.com/s/files/1/0253/7911/0974/articles/online_stationery_f10b7ed2-4c78-4912-a7dd-1b1d0a44e8cb.jpg?v=1665638401",
        "Rs 500"),
    MartItemDetailsModel(
        "Multi color sticky notes very good quality",
        "https://www.tazaonline.com/wp-content/uploads/2020/04/Multi-Color-Sticky-Notes.jpg",
        "Rs 2,000"),
    MartItemDetailsModel(
        "Clip Pack",
        "https://cdn.shopify.com/s/files/1/0253/7911/0974/articles/online_stationery_f10b7ed2-4c78-4912-a7dd-1b1d0a44e8cb.jpg?v=1665638401",
        "Rs 500"),
    MartItemDetailsModel(
        "Multi color sticky notes very good quality",
        "https://www.tazaonline.com/wp-content/uploads/2020/04/Multi-Color-Sticky-Notes.jpg",
        "Rs 2,000"),
  ].obs;

  static List<BankMethodModel> bankMethodModel = [
    BankMethodModel("Meezan Bank"),
    BankMethodModel("Allied Bank"),
    BankMethodModel("EasyPaisa"),
    BankMethodModel("JazzCash"),
  ];
}

///// Models

class LanguageModel {
  String? name;

  LanguageModel(this.name);
}

/// Bank Card
class BankCardModel {
  String? name;
  String? numberOfCard;

  BankCardModel(this.name, this.numberOfCard);
}

/// Bank Method
class BankMethodModel {
  String? nameBank;

  BankMethodModel(this.nameBank);
}

/// School Details
class SchoolDetailsModel {
  String? name;
  String? address;

  SchoolDetailsModel(this.name, this.address);
}

/// Student Details
class StudentDetailsModel {
  String? name;
  String? grade;
  String? instituteName;
  String? studentID;
  String? dateOfBirth;

  StudentDetailsModel(this.name, this.grade, this.instituteName, this.studentID,
      this.dateOfBirth);
}

/// FeesDetailsModel
class FeesDetailsModel {
  String? studentName;
  String? grade;
  String? instituteName;
  String? feeTitle;
  String? dateOfPayment;
  String? statusOfPayment;
  String? amountOfPayment;
  String? paymentMethodDetail;

  FeesDetailsModel(
      this.studentName,
      this.grade,
      this.instituteName,
      this.feeTitle,
      this.dateOfPayment,
      this.statusOfPayment,
      this.amountOfPayment,
      this.paymentMethodDetail);
}

/// DuesDetailsModel
class DuesDetailsModel {
  String? studentName;
  String? grade;
  String? instituteName;
  String? feeTitle;
  String? dateOfPayment;
  String? statusOfPayment;
  String? amountOfPayment;
  String? paymentMethodDetail;

  DuesDetailsModel(
      this.studentName,
      this.grade,
      this.instituteName,
      this.feeTitle,
      this.dateOfPayment,
      this.statusOfPayment,
      this.amountOfPayment,
      this.paymentMethodDetail);
}

/// martItem Details
class MartItemDetailsModel {
  String? title;
  String? imageUrl;
  String? price;

  MartItemDetailsModel(this.title, this.imageUrl, this.price);
}

/// Gender
class GenderModel {
  String? name;

  GenderModel(this.name);
}

//// Images for Slider
final List<String> imgList = [
  'https://img.lovepik.com//back_pic/05/63/87/405b6056074ac17.jpg_wh300.jpg',
  'https://img.freepik.com/premium-vector/back-school-banner-design-illustration-background_131806-9.jpg',
  'https://img.lovepik.com/background/20211023/medium/lovepik-school-season-flat-cartoon-poster-banner-background-image_605820710.jpg'
];

List withDrawTitle = [
  "Send via crypto network",
  "Send via email/ Phone/ Pay ID",
];
List withDrawSubTitle = [
  "send to a known crypto address via\ncrypto network",
  "Recipient must be a PayFee user",
];

List withDrawTransferTitle = [
  "Meezan Bank",
  "Allied Bank",
];
List withDrawTransferSubTitle = [
  "xxx-xxxxx-xxxxxx",
  "xxx-xxxxx-xxxxxx",
];
List paymentMethodList = [
  "Credit/Debit Card",
  "Bank Account",
  "E-Wallet",
];
List<SalesData> monthsData = [
  SalesData('Jan'.tr, '97%', 100, Colors.green),
  SalesData('Feb'.tr, '95%', 95, Colors.lightGreen),
  SalesData('Mar'.tr, '90%', 90, Colors.orange),
  SalesData('Apr'.tr, '85%', 85, Colors.deepOrange),
  SalesData('May'.tr, '80%', 80, Colors.redAccent),
  SalesData('Jun'.tr, '75%', 75, Colors.red),
];
List<PercentageColors> percentageColors = [
  PercentageColors('100% -   96% ${'Attendance'.tr}', Colors.green),
  PercentageColors('95%   -   91%  ${'Attendance'.tr}', Colors.lightGreen),
  PercentageColors('90%   -   86% ${'Attendance'.tr}', Colors.orange),
  PercentageColors('85%   -   81%  ${'Attendance'.tr}', Colors.deepOrange),
  PercentageColors('80%   -   76% ${'Attendance'.tr}', Colors.redAccent),
  PercentageColors('75%    -   1%    ${'Attendance'.tr}', Colors.red),
];

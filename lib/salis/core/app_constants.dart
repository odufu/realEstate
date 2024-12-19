import 'package:flutter/material.dart';
import '/salis/core/theme/salis_mode.dart';

class AppConstants {
  static String companyHeaderName = salis.companyName;
  static String companySubTitleName = salis.companySubTitle;
  static String companyLogo = salis.logo;
  static ThemeData companyTheme = salisMode;
}

CompanyProfile salis = CompanyProfile(
  companyName: "Salis Homes",
  companySubTitle: "HOMES",
  logo: "assets/rounded logo.png",
  primaryColor: Colors.red,
  secondaryColor: Colors.orangeAccent,
  tertiaryColor: Colors.black,
);

CompanyProfile tpumpy = CompanyProfile(
  companyName: "Salis Homes",
  companySubTitle: "HOMES",
  logo: "logo",
  primaryColor: Colors.red,
  secondaryColor: Colors.orangeAccent,
  tertiaryColor: Colors.black,
);

CompanyProfile decolHomes = CompanyProfile(
  companyName: "Salis Homes",
  companySubTitle: "HOMES",
  logo: "logo",
  primaryColor: Colors.red,
  secondaryColor: Colors.orangeAccent,
  tertiaryColor: Colors.black,
);

class CompanyProfile {
  final String companyName;
  final String companySubTitle;
  final String logo;
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;

  CompanyProfile({
    required this.companyName,
    required this.companySubTitle,
    required this.logo,
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
  });
}

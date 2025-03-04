import 'package:flutter/material.dart';
import '/salis/core/theme/salis_mode.dart';

class AppConstants {
  static String companyHeaderName = salis.companyName;
  static String companySubTitleName = salis.companySubTitle;
  static String companyLogo = salis.logo;
  static ThemeData companyTheme = salisMode;
}

CompanyProfile salis = CompanyProfile(
  companyName: "MC DREAM",
  companySubTitle: "",
  logo: "assets/mcdreamslogo.png",
  primaryColor: Colors.red,
  secondaryColor: Colors.orangeAccent,
  tertiaryColor: Colors.black,
);

CompanyProfile tpumpy = CompanyProfile(
  companyName: "MC DREAM",
  companySubTitle: "HOMES",
  logo: "assets/mcdreamslogo.png",
  primaryColor: Colors.red,
  secondaryColor: Colors.orangeAccent,
  tertiaryColor: Colors.black,
);

CompanyProfile decolHomes = CompanyProfile(
  companyName: "MC DREAM",
  companySubTitle: "HOMES",
  logo: "assets/mcdreamslogo.png",
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

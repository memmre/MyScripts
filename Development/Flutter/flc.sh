#!/bin/bash

usage() {
  echo "Usage: fcreate [project_name]"
  exit 1
}

create_project() {
  local project_name=$1
  flutter create "$project_name"
  
  if [ $? -ne 0 ]; then
    echo "Error: Project could not be created."
    exit 1
  fi
}

create_directories() {
  local project_name=$1
  cd "$project_name/lib/" || exit 1
  mkdir -p core/constants core/extensions core/themes features
}

create_file() {
  local file_path=$1
  local content=$2
  echo "$content" > "$file_path"
}

create_application_colors_file() {
  create_file "core/constants/application_colors.dart" \
  "import 'package:flutter/material.dart';

class ApplicationColors {
  static const Color amber = Color(0xFFFFC107);
  static const Color black = Color(0xFF000000);
  static const Color blue = Color(0xFF2196F3);
  static const Color brown = Color(0xFF795548);
  static const Color cyan = Color(0xFF00BCD4);
  static const Color darkGrey = Color(0xFF404040);
  static const Color green = Color(0xFF4CAF50);
  static const Color grey = Color(0xFF808080);
  static const Color indigo = Color(0xFF3F51B5);
  static const Color lightGrey = Color(0xFFC0C0C0);
  static const Color lime = Color(0xFFCDDC39);
  static const Color offWhite = Color(0xFFF3F3F8);
  static const Color orange = Color(0xFFFF9800);
  static const Color pink = Color(0xFFE91E63);
  static const Color purple = Color(0xFF9C27B0);
  static const Color red = Color(0xFFF44336);
  static const Color teal = Color(0xFF009688);
  static const Color yellow = Color(0xFFFFEB3B);
  static const Color white = Color(0xFFFFFFFF);

  // Transparent Colors
  static const Color amberTransparent = Color(0x80FFC107);
  static const Color blackTransparent = Color(0x80000000);
  static const Color blueTransparent = Color(0x802196F3);
  static const Color brownTransparent = Color(0x80795548);
  static const Color cyanTransparent = Color(0x8000BCD4);
  static const Color darkGreyTransparent = Color(0x80404040);
  static const Color greenTransparent = Color(0x804CAF50);
  static const Color greyTransparent = Color(0x80808080);
  static const Color indigoTransparent = Color(0x803F51B5);
  static const Color lightGreyTransparent = Color(0x80C0C0C0);
  static const Color limeTransparent = Color(0x80CDDC39);
  static const Color offWhiteTransparent = Color(0x80F3F3F8);
  static const Color orangeTransparent = Color(0x80FF9800);
  static const Color pinkTransparent = Color(0x80E91E63);
  static const Color purpleTransparent = Color(0x809C27B0);
  static const Color redTransparent = Color(0x80F44336);
  static const Color tealTransparent = Color(0x80009688);
  static const Color yellowTransparent = Color(0x80FFEB3B);
  static const Color whiteTransparent = Color(0x80FFFFFF);
}
"
}

create_application_strings_file() {
  local project_name=$1
  create_file "core/constants/application_strings.dart" \
  "class ApplicationStrings {
  static const String applicationName = '$project_name';
}
"
}

create_media_query_extension_file() {
  create_file "core/extensions/media_query_extension.dart" \
  "import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get screenWidth => mediaQuery.size.width;
  double get halfScreenWidth => screenWidth / 2;
  double get thirdOfScreenWidth => screenWidth / 3;
  double get fourthOfScreenWidth => screenWidth / 4;
  double get fifthOfScreenWidth => screenWidth / 5;
  double get sixthOfScreenWidth => screenWidth / 6;
  double get seventhOfScreenWidth => screenWidth / 7;
  double get eighthOfScreenWidth => screenWidth / 8;
  double get ninthOfScreenWidth => screenWidth / 9;
  double get tenthOfScreenWidth => screenWidth / 10;

  double get screenHeight => mediaQuery.size.height;
  double get halfScreenHeight => screenHeight / 2;
  double get thirdOfScreenHeight => screenHeight / 3;
  double get fourthOfScreenHeight => screenHeight / 4;
  double get fifthOfScreenHeight => screenHeight / 5;
  double get sixthOfScreenHeight => screenHeight / 6;
  double get seventhOfScreenHeight => screenHeight / 7;
  double get eighthOfScreenHeight => screenHeight / 8;
  double get ninthOfScreenHeight => screenHeight / 9;
  double get tenthOfScreenHeight => screenHeight / 10;

  double get smallValue => screenWidth * 0.01;
  double get mediumValue => screenWidth * 0.02;
  double get largeValue => screenWidth * 0.04;
}
"
}

create_navigator_extension_file() {
  create_file "core/extensions/navigator_extension.dart" \
  "import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  void pop() {
    Navigator.of(this).pop();
  }

  void push(Widget page) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => page));
  }
}
"
}

create_padding_extension_file() {
  create_file "core/extensions/padding_extension.dart" \
  "import 'package:flutter/material.dart';
import 'package:$project_name/core/extensions/media_query_extension.dart';

extension PaddingExtension on BuildContext {
  // Paddings
  EdgeInsets get noPadding => const EdgeInsets.all(0);
  EdgeInsets get smallPadding => EdgeInsets.all(smallValue);
  EdgeInsets get mediumPadding => EdgeInsets.all(mediumValue);
  EdgeInsets get largePadding => EdgeInsets.all(largeValue);

  // Left Paddings
  EdgeInsets get leftSmallPadding => EdgeInsets.only(left: smallValue);
  EdgeInsets get leftMediumPadding => EdgeInsets.only(left: mediumValue);
  EdgeInsets get leftLargePadding => EdgeInsets.only(left: largeValue);

  // Top Paddings
  EdgeInsets get topSmallPadding => EdgeInsets.only(top: smallValue);
  EdgeInsets get topMediumPadding => EdgeInsets.only(top: mediumValue);
  EdgeInsets get topLargePadding => EdgeInsets.only(top: largeValue);

  // Right Paddings
  EdgeInsets get rightSmallPadding => EdgeInsets.only(right: smallValue);
  EdgeInsets get rightMediumPadding => EdgeInsets.only(right: mediumValue);
  EdgeInsets get rightLargePadding => EdgeInsets.only(right: largeValue);

  // Bottom Paddings
  EdgeInsets get bottomSmallPadding => EdgeInsets.only(bottom: smallValue);
  EdgeInsets get bottomMediumPadding => EdgeInsets.only(bottom: mediumValue);
  EdgeInsets get bottomLargePadding => EdgeInsets.only(bottom: largeValue);

  // Horizontal Paddings
  EdgeInsets get horizontalSmallPadding => EdgeInsets.symmetric(
        horizontal: smallValue,
      );
  EdgeInsets get horizontalMediumPadding => EdgeInsets.symmetric(
        horizontal: mediumValue,
      );
  EdgeInsets get horizontalLargePadding => EdgeInsets.symmetric(
        horizontal: largeValue,
      );

  // Vertical Paddings
  EdgeInsets get verticalSmallPadding => EdgeInsets.symmetric(
        vertical: smallValue,
      );
  EdgeInsets get verticalMediumPadding => EdgeInsets.symmetric(
        vertical: mediumValue,
      );
  EdgeInsets get verticalLargePadding => EdgeInsets.symmetric(
        vertical: largeValue,
      );
}
"
}

create_snackbar_extension_file() {
  create_file "core/extensions/snackbar_extension.dart" \
  "import 'package:flutter/material.dart';
import 'package:$project_name/core/constants/application_colors.dart';

extension SnackbarExtensions on BuildContext {
  void showSnackbar({
    required content,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: content,
      ),
    );
  }

  void showErrorSnackbar({required Widget content}) {
    showSnackbar(
      backgroundColor: ApplicationColors.red,
      content: content,
    );
  }

  void showInformationSnackbar({required Widget content}) {
    showSnackbar(
      backgroundColor: ApplicationColors.blue,
      content: content,
    );
  }

  void showSuccessSnackbar({required Widget content}) {
    showSnackbar(
      backgroundColor: ApplicationColors.green,
      content: content,
    );
  }
}
"
}

create_application_theme_file() {
  create_file "core/themes/application_theme.dart" \
  "import 'package:flutter/material.dart';

class ApplicationTheme {
  static final ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.deepPurple,
    ),
    useMaterial3: true,
  );

  static final ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.deepPurple,
    ),
    useMaterial3: true,
  );
}
"
}

create_main_file() {
  local project_name=$1
  create_file "main.dart" \
  "import 'package:flutter/material.dart';
import 'package:$project_name/core/constants/application_strings.dart';
import 'package:$project_name/core/themes/application_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ApplicationTheme.light,
      darkTheme: ApplicationTheme.dark,
      themeMode: ThemeMode.system,
      title: ApplicationStrings.applicationName,
      home: const Scaffold(),
    );
  }
}
"
}

main() {
  if [ -z "$1" ]; then
    usage
  fi

  local project_name=$1
  create_project "$project_name"
  create_directories "$project_name"
  
  create_application_colors_file
  create_application_strings_file "$project_name"
  create_media_query_extension_file
  create_navigator_extension_file
  create_padding_extension_file
  create_snackbar_extension_file
  create_application_theme_file
  create_main_file "$project_name"
}

main "$@"
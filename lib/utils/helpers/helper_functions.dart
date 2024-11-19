// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class THelperFunctions {
  static Color? getColor(String value) {
    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Yellow') {
      return Colors.yellow;
    } else if (value == 'Orange') {
      return Colors.deepOrange;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    } else if (value == 'Cyan') {
      return Colors.cyan;
    } else if (value == 'Amber') {
      return Colors.amber;
    } else if (value == 'Lime') {
      return Colors.lime;
    } else if (value == 'Light Blue') {
      return Colors.lightBlue;
    } else if (value == 'Light Green') {
      return Colors.lightGreen;
    } else if (value == 'Deep Orange') {
      return Colors.deepOrange;
    } else if (value == 'Deep Purple') {
      return Colors.deepPurple;
    } else if (value == 'Magenta') {
      return Color(0xFFFF00FF);
    } else if (value == 'Gold') {
      return Color(0xFFFFD700);
    } else if (value == 'Silver') {
      return Color(0xFFC0C0C0);
    } else if (value == 'Bronze') {
      return Color(0xFFCD7F32);
    } else if (value == 'Beige') {
      return Color(0xFFF5F5DC);
    } else if (value == 'Maroon') {
      return Color(0xFF800000);
    } else if (value == 'Navy') {
      return Color(0xFF000080);
    } else if (value == 'Lavender') {
      return Color(0xFFE6E6FA);
    } else if (value == 'Turquoise') {
      return Color(0xFF40E0D0);
    } else if (value == 'Coral') {
      return Color(0xFFFF7F50);
    } else if (value == 'Ivory') {
      return Color(0xFFFFFFF0);
    } else if (value == 'Mint') {
      return Color(0xFF98FF98);
    } else if (value == 'Rose') {
      return Color(0xFFFF007F);
    } else if (value == 'Peach') {
      return Color(0xFFFFE5B4);
    } else if (value == 'Charcoal') {
      return Color(0xFF36454F);
    } else if (value == 'Mint Green') {
      return Color(0xFF98FF98);
    } else if (value == 'Sky Blue') {
      return Color(0xFF87CEEB);
    } else if (value == 'Olive') {
      return Color(0xFF808000);
    } else if (value == 'Sand') {
      return Color(0xFFEDC9AF);
    } else if (value == 'Rust') {
      return Color(0xFFB7410E);
    } else if (value == 'Slate Blue') {
      return Color(0xFF6A5ACD);
    } else if (value == 'Forest Green') {
      return Color(0xFF228B22);
    } else if (value == 'Lemon') {
      return Color(0xFFFFF700);
    } else if (value == 'Mauve') {
      return Color(0xFFE0B0FF);
    } else if (value == 'Sea Green') {
      return Color(0xFF2E8B57);
    } else if (value == 'Ochre') {
      return Color(0xFFCC7722);
    } else if (value == 'Plum') {
      return Color(0xFFDDA0DD);
    } else if (value == 'Lilac') {
      return Color(0xFFC8A2C8);
    } else if (value == 'Tan') {
      return Color(0xFFD2B48C);
    } else if (value == 'Khaki') {
      return Color(0xFFF0E68C);
    } else if (value == 'Wine') {
      return Color(0xFF722F37);
    } else if (value == 'Sapphire') {
      return Color(0xFF0F52BA);
    } else if (value == 'Fuchsia') {
      return Color(0xFFFF00FF);
    } else if (value == 'Periwinkle') {
      return Color(0xFFCCCCFF);
    } else if (value == 'Honey') {
      return Color(0xFFFAD02E);
    } else if (value == 'Lemon Yellow') {
      return Color(0xFFFFFACD);
    } else if (value == 'Brass') {
      return Color(0xFFB5A642);
    } else if (value == 'Blush') {
      return Color(0xFFDE5D83);
    } else if (value == 'Seafoam') {
      return Color(0xFF93E9BE);
    } else if (value == 'Powder Blue') {
      return Color(0xFFB0E0E6);
    } else if (value == 'Camel') {
      return Color(0xFFC19A6B);
    } else if (value == 'Chestnut') {
      return Color(0xFFCD5C5C);
    } else if (value == 'Sepia') {
      return Color(0xFF704214);
    } else if (value == 'Pistachio') {
      return Color(0xFF93C572);
    } else if (value == 'Denim') {
      return Color(0xFF1560BD);
    } else if (value == 'Taupe') {
      return Color(0xFF483C32);
    } else if (value == 'Burgundy') {
      return Color(0xFF800020);
    } else if (value == 'Mustard') {
      return Color(0xFFFFDB58);
    } else if (value == 'Cobalt Blue') {
      return Color(0xFF0047AB);
    } else if (value == 'Ecru') {
      return Color(0xFFC2B280);
    } else if (value == 'Cerulean') {
      return Color(0xFF007BA7);
    } else if (value == 'Saffron') {
      return Color(0xFFF4C430);
    } else if (value == 'Amethyst') {
      return Color(0xFF9966CC);
    } else if (value == 'Coral Pink') {
      return Color(0xFFF88379);
    } else if (value == 'Vermilion') {
      return Color(0xFFE34234);
    } else if (value == 'Bistre') {
      return Color(0xFF3D2B1F);
    } else if (value == 'Ultramarine') {
      return Color(0xFF3F00FF);
    } else if (value == 'Viridian') {
      return Color(0xFF40826D);
    } else if (value == 'Raspberry') {
      return Color(0xFFE30B5D);
    } else if (value == 'Rosewood') {
      return Color(0xFF65000B);
    } else if (value == 'Mulberry') {
      return Color(0xFFC54B8C);
    } else if (value == 'Pine Green') {
      return Color(0xFF01796F);
    } else if (value == 'Electric Blue') {
      return Color(0xFF7DF9FF);
    } else if (value == 'Goldenrod') {
      return Color(0xFFDAA520);
    } else if (value == 'Azure') {
      return Color(0xFF007FFF);
    } else if (value == 'Sangria') {
      return Color(0xFF92000A);
    } else if (value == 'Almond') {
      return Color(0xFFEFDECD);
    } else if (value == 'Zaffre') {
      return Color(0xFF0014A8);
    } else if (value == 'Brandy') {
      return Color(0xFF87413F);
    } else if (value == 'Carnation Pink') {
      return Color(0xFFFFA6C9);
    } else if (value == 'Electric Lime') {
      return Color(0xFFCCFF00);
    } else if (value == 'Persimmon') {
      return Color(0xFFEC5800);
    } else {
      return null;
    }
}


  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}

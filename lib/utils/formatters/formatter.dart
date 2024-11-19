import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy')
        .format(date); // Customize the date format as needed
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$')
        .format(amount); // Customize the currency locale and symbol as needed
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Check if the phone number is 11 digits long
    if (phoneNumber.length == 11) {
      // Add the '+88' prefix without any spaces
      return '+88${phoneNumber.substring(0, 3)}${phoneNumber.substring(3, 6)}${phoneNumber.substring(6)}';
    }
    // Return the original number if it doesn't match the expected length
    return phoneNumber;
  }

  static String deformatPhoneNumber(String phoneNumber) {
    // Check if the phone number starts with '+88'
    if (phoneNumber.startsWith('+88') && phoneNumber.length == 14) {
      // Remove the '+88' prefix and return the remaining number
      return phoneNumber.substring(3);
    }
    // Return the original number if it doesn't match the expected format
    return phoneNumber;
  }

  // Not fully tested.
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Extract the country code from the digitsOnly
    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    // Add the remaining digits with proper formatting
    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode) ');

    int i = 0;
    while (i < digitsOnly.length) {
      int groupLength = 2;
      if (i == 0 && countryCode == '+1') {
        groupLength = 3;
      }

      int end = i + groupLength;
      formattedNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formattedNumber.write(' ');
      }
      i = end;
    }

    return formattedNumber.toString();
  }
}


/*
*
*
* */

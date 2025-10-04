import 'package:flutter/services.dart';

/// Avtomatik tarzda har 4 raqamdan keyin bo‘sh joy qo‘yadi.
class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String digitsOnly = newValue.text.replaceAll(' ', '');
    String newString = '';

    for (int i = 0; i < digitsOnly.length; i++) {
      newString += digitsOnly[i];
      if ((i + 1) % 4 == 0 && i + 1 != digitsOnly.length) {
        newString += ' ';
      }
    }

    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}

/// Avtomatik tarzda 3-raqamdan keyin / qo‘yadi.
class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    var text = newValue.text.replaceAll('/', '');
    if (text.length > 4) text = text.substring(0, 4);

    String newString = '';
    for (int i = 0; i < text.length; i++) {
      if (i == 2) newString += '/';
      newString += text[i];
    }

    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}

class CardValidators {
  static String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) return "Enter card number";
    if (value.replaceAll(' ', '').length != 16) {
      return "Card number must be 16 digits";
    }
    return null;
  }

  static String? validateExpiryDate(String? value) {
    if (value == null || value.isEmpty) return "Enter expiry date";
    final regex = RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$');
    if (!regex.hasMatch(value)) return "Format must be MM/YY";
    return null;
  }

  static String? validateCVC(String? value) {
    if (value == null || value.isEmpty) return "Enter CVC";
    if (value.length != 3) return "CVC must be 3 digits";
    return null;
  }
}

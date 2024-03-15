import 'package:flutter/services.dart';

class CustomFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;

    if (newText.length > 10) {
      return oldValue; // Limite le nombre de caractères à 10
    }

    var finalText = '';
    for (var i = 0; i < newText.length; i++) {
      finalText += newText[i];
      if (i % 2 != 0 && i != newText.length - 1) {
        finalText += ' '; // Ajoute un espace après chaque deux caractères
      }
    }

    return TextEditingValue(
      text: finalText,
      selection: TextSelection.collapsed(offset: finalText.length),
    );
  }
}

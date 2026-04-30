import 'package:flutter/services.dart';

class DobInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Allow deletion freely
    if (newValue.text.length < oldValue.text.length) {
      return newValue;
    }

    // Strip everything except digits
    String digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Max 8 raw digits: DD MM YYYY
    if (digits.length > 8) digits = digits.substring(0, 8);

    String formatted = _buildFormatted(digits);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  String _buildFormatted(String digits) {
    String result = '';
    int i = 0;

    // ── DAY ──────────────────────────────────────────────────────────────────
    // Rules:
    //   • digits[0] in {4..9}  → impossible tens for day (max 31) → auto-pad "0X-"
    //   • digits[0] in {0,1,2} → valid tens digit, always need second digit
    //   • digits[0] == 3       → valid only if second digit is 0 or 1 (30,31)
    //                            if second digit > 1 → clamp to "31-"
    //                            if no second digit yet → show "3" and wait

    if (i >= digits.length) return result;

    final int d1 = int.parse(digits[i]);

    if (d1 >= 4) {
      // Single digit 4-9 → instantly becomes "04-" .. "09-"
      result += '0${digits[i]}-';
      i++;
    } else {
      // d1 is 0, 1, 2, or 3 — need to see second digit
      if (i + 1 >= digits.length) {
        // Only one digit typed so far, just show it and wait
        result += digits[i];
        return result;
      }

      final int d2 = int.parse(digits[i + 1]);

      if (d1 == 0) {
        // 00 → invalid, clamp to 01
        result += d2 == 0 ? '01-' : '0${digits[i + 1]}-';
      } else if (d1 == 1 || d1 == 2) {
        // 10-19, 20-29 → all valid days
        result += '${digits[i]}${digits[i + 1]}-';
      } else {
        // d1 == 3: valid only 30, 31
        if (d2 > 1) {
          result += '31-'; // clamp 32-39 to 31
        } else {
          result += '${digits[i]}${digits[i + 1]}-';
        }
      }
      i += 2;
    }

    // ── MONTH ─────────────────────────────────────────────────────────────────
    // Rules:
    //   • digits[i] in {2..9}  → impossible tens for month (max 12) → auto-pad "0X-"
    //   • digits[i] == 0       → needs second digit (01-09)
    //   • digits[i] == 1       → valid only if second digit is 0,1,2 (10,11,12)
    //                            if second digit > 2 → clamp to "12-"
    //                            if no second digit yet → show "1" and wait

    if (i >= digits.length) return result;

    final int m1 = int.parse(digits[i]);

    if (m1 >= 2) {
      // Single digit 2-9 → instantly becomes "02-" .. "09-"
      result += '0${digits[i]}-';
      i++;
    } else {
      // m1 is 0 or 1 — need second digit
      if (i + 1 >= digits.length) {
        result += digits[i];
        return result;
      }

      final int m2 = int.parse(digits[i + 1]);

      if (m1 == 0) {
        // 00 → invalid, clamp to 01
        result += m2 == 0 ? '01-' : '0${digits[i + 1]}-';
      } else {
        // m1 == 1: valid 10, 11, 12
        if (m2 > 2) {
          result += '12-'; // clamp 13-19 to 12
        } else {
          result += '${digits[i]}${digits[i + 1]}-';
        }
      }
      i += 2;
    }

    // ── YEAR (up to 4 digits, no validation here) ─────────────────────────────
    while (i < digits.length) {
      result += digits[i];
      i++;
    }

    return result;
  }
}
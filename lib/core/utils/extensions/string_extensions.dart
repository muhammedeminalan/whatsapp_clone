extension StringExtensions on String {
  String toTurkishPhoneFormat() {
    // Sayıları temizle
    String digits = replaceAll(RegExp(r'\D'), '');

    // Türkiye cep telefonu 10 hane (0 ile başlayan kısmı)
    if (digits.length > 10) {
      digits = digits.substring(digits.length - 10); // son 10 hane al
    }
    if (digits.isEmpty) return '';

    String formatted = '';
    if (digits.length <= 3) {
      formatted = '0$digits';
    } else if (digits.length <= 6) {
      formatted = '0${digits.substring(0, 3)} ${digits.substring(3)}';
    } else {
      formatted =
          '0${digits.substring(0, 3)} ${digits.substring(3, 6)} ${digits.substring(6)}';
    }

    return '+90 $formatted';
  }

  String toUsername() {
    String trimmed = trim(); // boşlukları temizle
    if (trimmed.isEmpty) return '';
    if (trimmed.startsWith('@')) return trimmed;
    return '@$trimmed';
  }

  String toGmail() {
    String trimmed = trim();

    if (trimmed.isEmpty) return '';

    // Eğer zaten @gmail.com ile bitiyorsa ekleme
    if (trimmed.toLowerCase().endsWith('@gmail.com')) {
      return trimmed.toLowerCase();
    }

    return '${trimmed.toLowerCase()}@gmail.com';
  }
}

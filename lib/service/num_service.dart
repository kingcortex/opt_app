class NumService {
  static String getCompleteNumber(String code, String number) {
    return (code + number).replaceAll(RegExp(r'\s+'), '');
  }
}

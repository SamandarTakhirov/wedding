extension DateTimeExtension on DateTime {
  String toFormattedString() {
    final day = this.day.toString().padLeft(2, '0');
    final monthNames = [
      'Yanvar',
      'Fevral',
      'Mart',
      'Aprel',
      'May',
      'Iyun',
      'Iyul',
      'Avgust',
      'Sentyabr',
      'Oktyabr',
      'Noyabr',
      'Dekabr'
    ];
    final month = monthNames[this.month - 1];
    return '$day $month $year';
  }
}

String formatWeddingDate(DateTime date) {
  var months = <String>[
    'Yanvar',
    'Fevral',
    'Mart',
    'Aprel',
    'May',
    'Iyun',
    'Iyul',
    'Avgust',
    'Sentabr',
    'Oktabr',
    'Noyabr',
    'Dekabr'
  ];

  var day = date.day.toString().padLeft(2, '0');
  var month = months[date.month - 1];
  var year = date.year.toString();

  return '$day $month $year';
}

class Convert {
  static String convertDataFromJson(DateTime data) {
    final dataString = data.toIso8601String();
    final dataSplit = dataString.split("T");
    if (dataSplit.length == 2) {
      var result = '';
      var splitMesesEAno = dataSplit[0].split("-");
      if (splitMesesEAno.length == 3) {
        result =
            '${splitMesesEAno[2]}/${splitMesesEAno[1]}/${splitMesesEAno[0]}';
        return result;
      }
    }

    return '';
  }
}

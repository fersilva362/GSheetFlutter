import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  final String uri;

  ApiClient(
      {super.userAgent,
      super.timeout,
      super.followRedirects,
      super.maxRedirects,
      super.sendUserAgent,
      super.maxAuthRetries,
      super.allowAutoSignedCert,
      super.withCredentials,
      required this.uri});
  Future<String> getData(uri) async {
    //final response = await rootBundle.loadString('assets/fileTSV.tsv');
    final Response response = await get(uri);
    if (response.statusCode == 200) {
      return response.bodyString!;
    } else {
      return 'd';
    }
  }

  //FAILS IN DECODE DATA, using utf8.decode()
  /* static Future getMatchs() async {
    try {
      final http.Response response = await http.get(Uri.parse(
          'https://docs.google.com/spreadsheets/d/e/2PACX-1vRklhWozJdAqNjiint5ZUUlavPlf5lmZ3xhAwMYTUGw8i4XBVdYGv97emEHlCgm6blZc_A7nVcNt_Ij/pub?gid=0&single=true&output=tsv'));

      if (response.statusCode == 200) {
        List<String> decoded =
            utf8.decode(response.bodyBytes).split('\n').sublist(1);
        List result = [];
        for (var row in decoded) {
          final [date, players1, players2, goalsT1, goalsT2] = row.split('\t');
          result.add({date, players1, players2, goalsT1, goalsT2});
        }
      } else {
        print('error');
      }
    } catch (e) {
      print(e);
    }
  } */
// LOADING LOCAL FILE *.tsv
}

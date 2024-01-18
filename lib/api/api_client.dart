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
    final Response response = await get(uri);
    if (response.statusCode == 200) {
      return response.bodyString!;
    } else {
      return 'd';
    }
  }
}

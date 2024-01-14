import 'package:get/get.dart';
import 'package:match_flutter/api/api_client.dart';
import 'package:match_flutter/constants/constant.dart';

class TotalMatchRepo extends GetxService {
  final ApiClient apiClient;

  TotalMatchRepo({required this.apiClient});

  Future<String> getAllMatches() async {
    final response = await apiClient.getData(AppConstant.APP_URI_TSV);
    if (response.isNotEmpty) {
      return response;
    } else {
      print('error, is empty in repo');
      return response;
    }
  }
}

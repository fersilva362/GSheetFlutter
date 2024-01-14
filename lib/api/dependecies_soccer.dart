import 'package:get/get.dart';
import 'package:match_flutter/api/api_client.dart';
import 'package:match_flutter/constants/constant.dart';
import 'package:match_flutter/controllers/matches_soccer_controller.dart';
import 'package:match_flutter/repositories/matches_soccer_repo.dart';

Future<void> init() async {
  //Api
  Get.lazyPut(() => ApiClient(uri: AppConstant.APP_URI_TSV));

  //Repo
  Get.lazyPut(() => TotalMatchRepo(apiClient: Get.find()));

  //Controller
  Get.lazyPut(() => TotalMatchController(matchRepo: Get.find()));
}

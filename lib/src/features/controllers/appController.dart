import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:launch_buddy/src/global/services/barrel.dart';
import 'package:launch_buddy/src/src_barrel.dart';
import 'package:uuid/uuid.dart';

class AppController extends GetxController {
  RxList<String> eateries = <String>[].obs;

  final box = GetStorage();
  RxString user = "".obs;
  final dioService = Get.find<DioApiService>();
  RxInt uservotes = 0.obs;
  RxBool isLoading = false.obs;
  final String BASE_URL = "https://lunch-buddy-api.onrender.com";

  init() async {
    user.value = await getDeviceId();
    if (user.value.isEmpty) {
      const uuid = Uuid();
      if (box.read('user') == null) {
        user.value = uuid.v4();
        box.write("user", user.value);
      } else {
        user.value = box.read('user');
      }
    }
  }

  Future<String> getDeviceId() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (GetPlatform.isAndroid) {
        final androidInfo = await deviceInfoPlugin.androidInfo;
        return androidInfo.id;
      } else if (GetPlatform.isIOS) {
        final iosInfo = await deviceInfoPlugin.iosInfo;
        return iosInfo.identifierForVendor ?? "";
      }
    } catch (e) {
      // Handle any errors
      print('Error getting device ID: $e');
      return "";
    }
    return "";
  }

  Future getAllEateries() async {
    final vf = await dioService.get("$BASE_URL/eateries");
    final list = vf.data as List;

    eateries.value = list.map((e) => e["name"].toString()).toList();
  }

  Future submitResult(List<String> s) async {
    await dioService.post("$BASE_URL/votesessions", data: {
      "user": user.value,
      "votes": s.join(","),
    });
  }

  Future<Map<String, int>> viewResult({bool isOld = false}) async {
    dynamic res;

    if (isOld) {
      res = await dioService.get("$BASE_URL/votesessions/0");
    } else {
      res = await dioService.get("$BASE_URL/votesessions");
    }

    final l = res.data["votes"] as List<dynamic>;
    final mp = <String, int>{};
    for (var element in l) {
      final key = element.split(":")[0];
      final value = int.parse(element.split(":")[1]);
      mp[key] = value;
    }
    return mp;
  }

  Future<bool> checkIfUservoted() async {
    final res = await dioService.get("$BASE_URL/votesessions");

    final l = res.data["users"] as List<String>;
    uservotes.value = l.length;
    return (l.contains(user.value));
  }

  addNewEatery(List<String> s) async {
    await dioService.post("$BASE_URL/eateries/bulk", data: {"eateries": s});
    await getAllEateries();
  }

  removeEatery(List<String> s) async {
    await dioService.delete("$BASE_URL/eateries/bulk", data: {"eateries": s});
    await getAllEateries();
  }
}

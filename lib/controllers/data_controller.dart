import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataController extends GetxController {
  static DataController to = Get.find();

  @override
  void onInit() {
    getValues();
    super.onInit();
  }

  getValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String m = prefs.getString('meeting') ?? '';
    String p = prefs.getString('points') ?? '';
    String d = prefs.getString('date') ?? '';

    meeting.value = m;
    points.value = p;
    date.value = d;
  }

  var meeting = ''.obs;
  var points = ''.obs;
  var date = DateTime.now().toString().obs;
}

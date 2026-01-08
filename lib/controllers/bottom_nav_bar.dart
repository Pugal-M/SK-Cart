import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var index = 0.obs;

  void changeIndex(int i) {
    index.value = i;
  }
}

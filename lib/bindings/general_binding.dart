import 'package:get/get.dart';
import 'package:pfeprojectcar/common/widgets/connectionchecker/network_manager.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
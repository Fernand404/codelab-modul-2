import 'package:get/get.dart';
import 'package:tes/app/data/services/http_controler.dart';


class HttpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HttpController>(
          () => HttpController(),
    );
  }
}
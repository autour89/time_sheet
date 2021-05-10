import 'package:get/get.dart';
import 'package:time_sheet/blocs/HomeBloc.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeBloc>(() => HomeBloc());
  }
}

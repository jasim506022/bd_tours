
import 'package:get/get.dart';

class LoadingController extends GetxController{
    final RxBool _isLoading = false.obs;

    bool get isLoading  => _isLoading.value;

    void setLoading (bool loading){
      _isLoading.value= loading;
    }

}
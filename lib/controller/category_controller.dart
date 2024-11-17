import 'package:get/get.dart';

import '../const/const.dart';

class CategoryController extends GetxController {
  var currentCategory = travelCategories[0].obs;

  setCategory({required String category}) {
    currentCategory.value = category;
  }
}

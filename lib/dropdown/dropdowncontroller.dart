import 'package:get/get.dart';

class DropdownController extends GetxController {
  var selectedValue = RxnString(); // Observable String (nullable)
  List<String> dropDownList = ['us', 'ae', 'ar', 'br', 'ca', 'ch', 'ru'];

  void setSelected(String? value) {
    selectedValue.value = value; // Update the value
  }
}

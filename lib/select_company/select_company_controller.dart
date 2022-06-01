import 'package:get/get.dart';

import '../company.dart';

class SelectCompanyController extends GetxController {
  final List<Company> companies = [];
  RxList showCompanies = [
    Company(name: 'CTY ABC1', id: 1),
    Company(name: 'CTY ABC2', id: 2),
    Company(name: 'CTY ABC3', id: 3),
    Company(name: 'CTY ABC4', id: 4),
  ].obs;
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    // getData().then((value) => print(value.toString()));
    super.onInit();
  }

  Future getData() async {
    await Future.delayed(
      const Duration(seconds: 2,),
      () => {
        [
          Company(name: 'CTY ABC1', id: 1),
          Company(name: 'CTY ABC2', id: 2),
          Company(name: 'CTY ABC3', id: 3),
          Company(name: 'CTY ABC4', id: 4),
        ]
      },
    );
  }
}

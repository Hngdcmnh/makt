import 'package:demo_makt/select_company/select_company_controller.dart';
import 'package:get/get.dart';

class SelectCompanyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SelectCompanyController>(
      SelectCompanyController(),permanent: true
    );
  }
}

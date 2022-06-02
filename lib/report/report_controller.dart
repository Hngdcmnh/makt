import 'package:demo_makt/payable.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ReportController extends GetxController with StateMixin<List<Payable>> {
  RxList<Payable> listPayable = RxList();
  RxList<Payable> showListPayable = RxList();

  final textSearch =''.obs;
  final SearchController = TextEditingController();

  // @override
  // void onInit() {
  //   super.onInit();
  //   getPayables();
  // }

  @override
  void onReady() {
    super.onReady();
    getPayables();
  }

  void searchText(String s)
  {
    change(null, status: RxStatus.loading());
    showListPayable.value.clear();
    change(null, status: RxStatus.loading());
    var i=0;
  }


  void getPayables() async {
    try {
      change(null, status: RxStatus.loading());
      await getFakeData().then((value) => listPayable.value.addAll(value));
      showListPayable.value.clear();
      showListPayable.value.addAll(listPayable.value);
      change(null, status: RxStatus.loading());
    } catch (exeption) {
      change(null, status: RxStatus.error(exeption.toString()));
    }
  }

  Future<List<Payable>> getFakeData() async {
    await Future.delayed(Duration(seconds: 3));
    return [
      Payable(name: '1', debt: 1.0, remaining: true),
      Payable(name: '1', debt: 1.0, remaining: true),
      Payable(name: '1', debt: 1.0, remaining: true),
      Payable(name: '1', debt: 1.0, remaining: true),
      Payable(name: '1', debt: 1.0, remaining: true),
      Payable(name: '1', debt: 1.0, remaining: true),
      Payable(name: '1', debt: 1.0, remaining: true),
      Payable(name: '1', debt: 1.0, remaining: true),
      Payable(name: '1', debt: 1.0, remaining: true),
    ];
  }
}

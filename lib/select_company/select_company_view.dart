import 'package:demo_makt/select_company/select_company_binding.dart';
import 'package:demo_makt/select_company/select_company_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../company.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: SelectCompanyBinding(),
      getPages: [
        GetPage(page: () => Home(), name: '/Home'),
      ],
      home: Home(),
    );
  }
}

class Home extends GetView<SelectCompanyController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return CompanyItem(
                company: controller.showCompanies[index], index: index,);
          }),
    );
  }
}

class CompanyItem extends GetView<SelectCompanyController> {
  const CompanyItem({Key? key, required this.company, required this.index})
      : super(key: key);
  final Company company;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.selectedIndex.value = index;
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                          child: Obx(
                            () => Text(
                              company.name[0].toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: controller.selectedIndex == index
                                      ? Colors.green
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => Text(
                          company.name.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: controller.selectedIndex == index
                                  ? Colors.green
                                  : Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 4,
            color: Colors.black26,
          )
        ],
      ),
    );
  }
}

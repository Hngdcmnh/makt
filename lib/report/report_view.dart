import 'package:demo_makt/payable.dart';
import 'package:demo_makt/report/report_binding.dart';
import 'package:demo_makt/report/report_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ReportBinding(),
      getPages: [
        GetPage(page: () => Home(), name: '/Home'),
      ],
      home: Home(),
    );
  }
}

class Home extends GetView<ReportController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: TextStyle(fontSize: 20),
              controller: controller.SearchController,
              onChanged: (value) {
                controller.searchText(value);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none),
                fillColor: Colors.black12,
                filled: true,
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                // suffixIcon: controller.SearchController.text.isEmpty
                //     ? null
                //     : IconButton(
                //     onPressed:,
                //     icon: Icon(Icons.clear_rounded),
              ),
            ),
            Expanded(
              child: controller.obx(
                (state) => ListView.separated(
                  itemCount: controller.showListPayable.length,
                  itemBuilder: (BuildContext context, int index) {
                    print('jssjs');
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ItemPayable(
                            payable: controller.showListPayable[index],
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.black12,
                      height: 8,
                      width: double.infinity,
                    );
                  },
                ),
                onLoading: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemPayable extends StatelessWidget {
  const ItemPayable({Key? key, required this.payable}) : super(key: key);

  final Payable payable;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(1000),
                ),
                border: Border.all(
                  width: 1,
                  color: Colors.green,
                  style: BorderStyle.solid,
                ),
              ),
              child: Center(
                child: Text(
                  '1',
                ),
              ),
            ),
            Center(child: Text(payable.name)),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Row(
            children: [
              Icon(
                Icons.check,
                color: Colors.green,
              ),
              Text('Remaining payables:'),
              Text(payable.debt.toString()),
            ],
          ),
        ),
      ],
    );
  }
}

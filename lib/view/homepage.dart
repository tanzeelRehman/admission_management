import 'package:admission_management/constants/colors.dart';
import 'package:admission_management/view/add_record.dart';
import 'package:admission_management/view/search_record.dart';
import 'package:admission_management/widgets/custom_fill_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Column(
                  children: const [
                    Text(
                      textAlign: TextAlign.center,
                      "Admission Management",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "GHS RANGPUR SHUMALI",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: CustomFillButton(
                      height: 50,
                      width: 200,
                      txt: "Add record",
                      onPressed: () {
                        Get.to(AddRecord(
                          openEditRecord: false,
                        ));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: CustomFillButton(
                      height: 50,
                      width: 200,
                      txt: "Search record",
                      onPressed: () {
                        Get.to(() => SearchRecord());
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

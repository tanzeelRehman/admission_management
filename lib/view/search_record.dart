import 'package:admission_management/Services/utils/Sms.dart';
import 'package:admission_management/constants/colors.dart';
import 'package:admission_management/controllers/StudentController.dart';
import 'package:admission_management/view/homepage.dart';
import 'package:admission_management/view/record_details.dart';
import 'package:admission_management/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchRecord extends StatefulWidget {
  SearchRecord({Key? key}) : super(key: key);

  @override
  State<SearchRecord> createState() => _SearchRecordState();
}

class _SearchRecordState extends State<SearchRecord> {
  final TextEditingController _searchRecord = TextEditingController();
  final StudentController studentConteroller = Get.find<StudentController>();
  @override
  void initState() {
    studentConteroller.getAllStudents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.off(() => HomePage());
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black87,
                      )),
                  Expanded(
                    child: CustomTextfield(
                        textFieldIcon: Icon(Icons.search),
                        hinttext: "Search",
                        textAlign: TextAlign.left,
                        onChange: ((value) {
                          studentConteroller.searchStudents(value);
                        }),
                        validator: (val) {},
                        con: _searchRecord),
                  ),
                ],
              ),
              Obx(() => studentConteroller.isLoading.value
                  ? CircularProgressIndicator()
                  : Expanded(
                      child: ListView.builder(
                          itemCount: studentConteroller.studentList.length,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () => Get.to(() => RecordDetails(
                                  studentDetails:
                                      studentConteroller.studentList[index])),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          main_heading(
                                              studentConteroller
                                                  .studentList[index]
                                                  .admissionNo,
                                              "Admission No",
                                              false),
                                          primary_heading(
                                              studentConteroller
                                                  .studentList[index]
                                                  .admissionDate,
                                              "Date of Admission")
                                        ],
                                      ),
                                      line(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          main_heading(
                                              studentConteroller
                                                  .studentList[index]
                                                  .studentName,
                                              "Name",
                                              true),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: acentcolor),
                                              onPressed: () {
                                                Sms sms = Sms(
                                                    number: studentConteroller
                                                        .studentList[index]
                                                        .studentFatherMobileNo,
                                                    text:
                                                        "آپ کا بیٹا سکول سے غیر حاضر ھے۔پرنسپل گونمنٹ  ھائ سکول رنگ پور شمالی. ڈیرھ اسماعیل خان");
                                                sms.sendText();
                                              },
                                              child: Text("Inform Parents"))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }))))
            ],
          ),
        ),
      ),
    );
  }

  Widget main_heading(String admissionNo, String title, bool isName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: acentcolor,
          ),
        ),
        Text(
          overflow: TextOverflow.clip,
          admissionNo,
          style: TextStyle(
              fontSize: isName ? 20 : 30,
              color: acentcolor,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget primary_heading(String date, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black87,
          ),
        ),
        Text(
          date,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class line extends StatelessWidget {
  const line({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Line();
  }

  Padding Line() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
          width: double.infinity,
          color: Colors.grey[300],
          child: SizedBox(
            height: 2.0,
          )),
    );
  }
}

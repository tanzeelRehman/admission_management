import 'package:admission_management/view/add_record.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:admission_management/Model/StudentsModel.dart';
import 'package:admission_management/constants/colors.dart';
import 'package:admission_management/view/search_record.dart';
import 'package:admission_management/widgets/custom_fill_btn.dart';
import 'package:admission_management/widgets/custom_outline_btn.dart';
import 'package:admission_management/widgets/custom_textfield.dart';

import '../controllers/StudentController.dart';

class RecordDetails extends StatefulWidget {
  StudentsModel studentDetails;
  RecordDetails({
    Key? key,
    required this.studentDetails,
  }) : super(key: key);

  @override
  State<RecordDetails> createState() => _RecordDetailsState();
}

class _RecordDetailsState extends State<RecordDetails> {
  final StudentController studentConteroller = Get.find<StudentController>();
  @override
  void initState() {
    super.initState();
    studentConteroller.getAllStudents();
  }

  @override
  Widget build(BuildContext context) {
    final String name = widget.studentDetails.studentName;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Get.off(() => SearchRecord());
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black87,
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          overflow: TextOverflow.clip,
          "$name Record",
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Obx(
                () => studentConteroller.isLoading.value
                    ? CircularProgressIndicator()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          primary_heading(widget.studentDetails.admissionNo,
                              "Admission No"),
                          primary_heading(widget.studentDetails.admissionDate,
                              "Admission Date"),
                          widget.studentDetails.withdrawlDate == null
                              ? Container()
                              : withDrawl_heading(
                                  widget.studentDetails.withdrawlDate,
                                  "Withdrwal date"),
                          widget.studentDetails.reasonOfWithdrawl == null
                              ? Container()
                              : withDrawl_heading(
                                  widget.studentDetails.reasonOfWithdrawl,
                                  "Reason of Withdrwal"),
                          primary_heading(name, "Name"),
                          primary_heading(widget.studentDetails.studentCINIC,
                              "Student CINIC"),
                          primary_heading(
                              widget.studentDetails.studentclass.toString(),
                              "Student Class"),
                          primary_heading(
                              widget.studentDetails.studentGroup, "Group"),
                          primary_heading(widget.studentDetails.studentDOB,
                              "Date of Birth"),
                          primary_heading(
                              widget.studentDetails.studentFatherName,
                              "Father Name"),
                          primary_heading(
                              widget.studentDetails.studentFatherMobileNo,
                              "Father Mobile"),
                          primary_heading(
                              widget.studentDetails.studentFatherCINIC,
                              "Father CINIC"),
                          widget.studentDetails.studentAddress == null
                              ? Container()
                              : primary_heading(
                                  "Tareen Colony DIKHAN", "Address"),
                          line(),
                          Line(),
                          Column(
                            children: [
                              CustomFillButton(
                                  height: 50,
                                  width: 400,
                                  txt: "Edit Record",
                                  onPressed: () {
                                    Get.to(() => AddRecord(
                                          openEditRecord: true,
                                          studentdetails: widget.studentDetails,
                                        ));
                                  }),
                              SizedBox(
                                height: 15,
                              ),
                              CustomFillButton(
                                  height: 50,
                                  width: 400,
                                  txt: "Delete Record",
                                  onPressed: () {
                                    studentConteroller.deleteStudentRecord(
                                        widget.studentDetails.admissionNo);
                                    Get.to(() => SearchRecord());
                                  })
                            ],
                          )
                        ],
                      ),
              )),
        ),
      ),
    );
  }

  Widget primary_heading(String text, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
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
            text,
            style: const TextStyle(
                fontSize: 25, color: acentcolor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget withDrawl_heading(String? text, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.red,
            ),
          ),
          Text(
            text ?? "Not Specified",
            style: const TextStyle(
                fontSize: 25, color: acentcolor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget Line() {
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

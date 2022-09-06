import 'package:admission_management/Model/StudentsModel.dart';
import 'package:admission_management/view/homepage.dart';
import 'package:admission_management/view/search_record.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:admission_management/controllers/StudentController.dart';
import 'package:admission_management/widgets/custom_fill_btn.dart';
import 'package:admission_management/widgets/custom_textfield.dart';

import '../constants/colors.dart';

class AddRecord extends StatefulWidget {
  bool openEditRecord;
  StudentsModel? studentdetails;
  AddRecord({
    Key? key,
    required this.openEditRecord,
    this.studentdetails,
  }) : super(key: key);

  @override
  State<AddRecord> createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  final TextEditingController _admissionNo = TextEditingController();
  final TextEditingController _studentName = TextEditingController();
  final TextEditingController _studentCINIC = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _dateofwithdrawl = TextEditingController();
  final TextEditingController _class = TextEditingController();
  final TextEditingController _group = TextEditingController();
  final TextEditingController _fatherName = TextEditingController();
  final TextEditingController _fatherMobile = TextEditingController();
  final TextEditingController _fatherCINIC = TextEditingController();
  final TextEditingController _address = TextEditingController();

  DateTime selectedDate = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  final StudentController studentConteroller = Get.find<StudentController>();

  bool addwithdrawldetails = false;

  TextEditingController _reason = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Get.off(() => HomePage());
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black87,
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: widget.openEditRecord
            ? Text(
                "Update ${widget.studentdetails!.studentName} Record",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              )
            : const Text(
                "Add Student Record",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Obx(
                  () => studentConteroller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : Column(
                          children: [
                            //? ADMISSION NO
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: widget.openEditRecord
                                  ? Container()
                                  : CustomTextfield(
                                      hinttext: "Admission No",
                                      textAlign: TextAlign.left,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return 'Please enter admission no';
                                        }
                                      },
                                      con: _admissionNo),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomTextfield(
                                  textFieldIcon: Icon(Icons.calendar_today),
                                  hinttext: widget.openEditRecord
                                      ? "Date of admission: ${widget.studentdetails!.admissionDate}"
                                      : "Date of admission",
                                  textAlign: TextAlign.left,
                                  textInputType: TextInputType.text,
                                  ontap: () {
                                    _selectDate(context);
                                  },
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Please enter date of admission';
                                    }
                                  },
                                  con: _date),
                            ),
                            //? STUDENT NAME
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomTextfield(
                                  hinttext: widget.openEditRecord
                                      ? "Student Name: ${widget.studentdetails!.studentName}"
                                      : "Student name",
                                  textAlign: TextAlign.left,
                                  textInputType: TextInputType.text,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Please enter student name';
                                    }
                                  },
                                  con: _studentName),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomTextfield(
                                  hinttext: widget.openEditRecord
                                      ? "Student CINIC: ${widget.studentdetails!.studentCINIC}"
                                      : "Student CINIC",
                                  textAlign: TextAlign.left,
                                  textInputType: TextInputType.number,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Please enter student CINIC';
                                    }
                                  },
                                  con: _studentCINIC),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomTextfield(
                                  hinttext: widget.openEditRecord
                                      ? "Student Class: ${widget.studentdetails!.studentclass}"
                                      : "Student Class",
                                  textAlign: TextAlign.left,
                                  textInputType: TextInputType.number,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Please enter student class';
                                    }
                                  },
                                  con: _class),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomTextfield(
                                  hinttext: widget.openEditRecord
                                      ? "Student Group: ${widget.studentdetails!.studentGroup}"
                                      : "Student Group",
                                  textAlign: TextAlign.left,
                                  textInputType: TextInputType.text,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Please enter student group';
                                    }
                                  },
                                  con: _group),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: widget.openEditRecord
                                  ? Container()
                                  : CustomTextfield(
                                      textFieldIcon: Icon(Icons.calendar_today),
                                      hinttext: widget.openEditRecord
                                          ? "Date of birth: ${widget.studentdetails!.studentDOB}"
                                          : "Date of birth",
                                      textAlign: TextAlign.left,
                                      textInputType: TextInputType.text,
                                      ontap: () {
                                        _selectDob(context);
                                      },
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return 'Please enter date of birth';
                                        }
                                      },
                                      con: _dob),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomTextfield(
                                  hinttext: widget.openEditRecord
                                      ? "Father Name: ${widget.studentdetails!.studentFatherName}"
                                      : "Father Name",
                                  textAlign: TextAlign.left,
                                  textInputType: TextInputType.text,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Please enter father name';
                                    }
                                  },
                                  con: _fatherName),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomTextfield(
                                  hinttext: widget.openEditRecord
                                      ? "Father mobile: ${widget.studentdetails!.studentFatherMobileNo}"
                                      : "Father mobile",
                                  textAlign: TextAlign.left,
                                  textInputType: TextInputType.number,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Please enter father mobile: ${widget.studentdetails!.studentFatherMobileNo}';
                                    }
                                  },
                                  con: _fatherMobile),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomTextfield(
                                  hinttext: widget.openEditRecord
                                      ? "Father CINIC: ${widget.studentdetails!.studentFatherCINIC}"
                                      : "Father CINIC",
                                  textAlign: TextAlign.left,
                                  textInputType: TextInputType.text,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Please enter father cinic';
                                    }
                                  },
                                  con: _fatherCINIC),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomTextfield(
                                  hinttext: "Address",
                                  maxLine: 8,
                                  textAlign: TextAlign.left,
                                  textInputType: TextInputType.multiline,
                                  validator: (val) {},
                                  con: _address),
                            ),

                            widget.openEditRecord
                                ? Row(
                                    children: [
                                      Switch(
                                          activeColor: acentcolor,
                                          value: addwithdrawldetails,
                                          onChanged: (value) {
                                            setState(() {
                                              addwithdrawldetails =
                                                  !addwithdrawldetails;
                                            });
                                          }),
                                      const Text(
                                        "Add withdrawl details",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54),
                                      )
                                    ],
                                  )
                                : Container(),
                            addwithdrawldetails
                                ? Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: acentcolor),
                                              onPressed: () {
                                                _selectDateofwithDrawl(context);
                                              },
                                              child: Text(
                                                  "Select Date of Withdrawl")),
                                          Text(
                                            _dateofwithdrawl.text,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      CustomTextfield(
                                          hinttext: "Reason of withdrawl",
                                          textAlign: TextAlign.start,
                                          validator: (val) {},
                                          con: _reason)
                                    ],
                                  )
                                : Container(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: CustomFillButton(
                                height: 50,
                                width: 400,
                                txt: widget.openEditRecord
                                    ? "Update Record"
                                    : "Add Record",
                                onPressed: () {
                                  if (widget.openEditRecord == true) {
                                    updateStudent();
                                    Get.to(() => SearchRecord());
                                  } else {
                                    createNewUser();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                )),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1800, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _date.text = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }

  Future<void> _selectDob(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1800, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dob.text = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }

  Future<void> _selectDateofwithDrawl(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1800, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateofwithdrawl.text = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }

  //! CREATING NEW STUDENT RECORD ////////////////////////////////////////////
  //?===============================================================
  void createNewUser() async {
    if (_formKey.currentState!.validate()) {
      var result = studentConteroller.createNewStudent(
        admissionNo: _admissionNo.text,
        admissionDate: _date.text,
        studentName: _studentName.text,
        studentCINIC: _studentCINIC.text,
        studentclass: int.parse(_class.text),
        studentGroup: _group.text,
        studentDOB: _dob.text,
        studentFatherName: _fatherName.text,
        studentFatherMobileNo: _fatherMobile.text,
        studentFatherCINIC: _fatherCINIC.text,
        studentAddress: _address.text,
      );
      _admissionNo.clear();
      _date.clear();
      _studentName.clear();
      _studentCINIC.clear();
      _class.clear();
      _group.clear();
      _dob.clear();
      _fatherName.clear();
      _fatherMobile.clear();
      _fatherCINIC.clear();
      _address.clear();

      print(result);
      if (result == "Sucess") {
        print("Data Added Sucessfully");
      } else {
        print("Error 101");
      }
    }
  }

  //! UPDATE STUDENT RECORD ////////////////////////////////////////////
  //?===============================================================
  void updateStudent() async {
    if (_formKey.currentState!.validate()) {
      var result = studentConteroller.updateStudent(
          admissionNo: widget.studentdetails!.admissionNo,
          admissionDate: _date.text,
          studentName: _studentName.text,
          studentCINIC: _studentCINIC.text,
          studentclass: int.parse(_class.text),
          withdrawldate: _dateofwithdrawl.text,
          reasonOfwithdrawl: _reason.text,
          studentGroup: _group.text,
          studentDOB: widget.studentdetails!.studentDOB,
          studentFatherName: _fatherName.text,
          studentFatherMobileNo: _fatherMobile.text,
          studentFatherCINIC: _fatherCINIC.text,
          studentAddress: _address.text,
          oldAdmissionNo: widget.studentdetails!.admissionNo);
      _admissionNo.clear();
      _date.clear();
      _studentName.clear();
      _studentCINIC.clear();
      _class.clear();
      _group.clear();
      _dob.clear();
      _fatherName.clear();
      _fatherMobile.clear();
      _fatherCINIC.clear();
      _address.clear();

      print(result);
      if (result == "Sucess") {
        print("Data Added Sucessfully");
      } else {
        print("Error 101");
      }
    }
  }
}

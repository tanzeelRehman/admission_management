import 'package:admission_management/Model/StudentsModel.dart';
import 'package:admission_management/Services/firebase/firestoreService.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  var isLoading = true.obs;
  late final studentList = <StudentsModel>[].obs;

  @override
  void onInit() {
    getAllStudents();
    super.onInit();
  }

  //! CREATE NEW STUDENT RECORD
  Future<String> createNewStudent(
      {required String admissionNo,
      required String admissionDate,
      required String studentName,
      required String studentCINIC,
      required int studentclass,
      required String studentGroup,
      required String studentDOB,
      required String studentFatherName,
      required String studentFatherMobileNo,
      required String studentFatherCINIC,
      String? studentAddress}) async {
    isLoading.value = true;
    var result;
    result = await FireStoreService().addstudentRecord(StudentsModel(
        admissionNo: admissionNo,
        admissionDate: admissionDate,
        studentName: studentName,
        studentCINIC: studentCINIC,
        studentclass: studentclass,
        studentGroup: studentGroup,
        studentDOB: studentDOB,
        studentFatherName: studentFatherName,
        studentFatherMobileNo: studentFatherMobileNo,
        studentFatherCINIC: studentFatherCINIC));
    print(result);
    isLoading.value = false;

    if (result == "Sucess") {
      Get.defaultDialog(title: result, middleText: "Record Added Sucessfully");
    } else if (result == "existed") {
      Get.defaultDialog(title: "Error", middleText: "Record already exist");
    } else {
      Get.defaultDialog(title: "Error", middleText: result);
    }

    return result;
  }

  Future<String> deleteStudentRecord(String admissionNo) async {
    var result;
    try {
      result = await FireStoreService().deletestudentRecord(admissionNo);
      if (result == "Sucess") {
        Get.defaultDialog(
            title: "Sucess", middleText: "Record Deleted Sucessfully");
      }
    } catch (e) {
      Get.defaultDialog(title: "Error", middleText: result);
    }
    return result;
  }

  //! CREATE NEW STUDENT RECORD
  Future<String> updateStudent(
      {required String admissionNo,
      required String admissionDate,
      required String studentName,
      required String studentCINIC,
      required int studentclass,
      required String studentGroup,
      required String studentDOB,
      required String studentFatherName,
      required String studentFatherMobileNo,
      required String studentFatherCINIC,
      String? withdrawldate,
      String? reasonOfwithdrawl,
      required String oldAdmissionNo,
      String? studentAddress}) async {
    isLoading.value = true;
    var result;
    try {
      result = await FireStoreService().updatestudentRecord(
          StudentsModel(
              admissionNo: admissionNo,
              admissionDate: admissionDate,
              studentName: studentName,
              withdrawlDate: withdrawldate,
              reasonOfWithdrawl: reasonOfwithdrawl,
              studentCINIC: studentCINIC,
              studentclass: studentclass,
              studentGroup: studentGroup,
              studentAddress: studentAddress,
              studentDOB: studentDOB,
              studentFatherName: studentFatherName,
              studentFatherMobileNo: studentFatherMobileNo,
              studentFatherCINIC: studentFatherCINIC),
          oldAdmissionNo);
      isLoading.value = false;
      if (result == "Sucess") {
        Get.defaultDialog(
            title: result, middleText: "Record Added Sucessfully");
      } else if (result == "existed") {
        Get.defaultDialog(title: "Error", middleText: "Record already exist");
      }
    } catch (e) {
      Get.defaultDialog(title: "Error", middleText: result);
    }

    return result;
  }

  //! GET ALL STUDENT RECORD

  Future<List<StudentsModel>?> getAllStudents() async {
    var result = await FireStoreService().getAllStudents();

    if (result is List<StudentsModel>) {
      isLoading.value = false;

      return studentList.value = result;
    } else {
      Get.defaultDialog(title: result);
    }
  }

  Future<List<StudentsModel>?> searchStudents(String field) async {
    print("i am here");
    var result = await FireStoreService().searchStudents(field);

    print("Getting all complaints");
    // print(result.toString());
    if (result is List<StudentsModel>) {
      isLoading.value = false;

      update();
      return studentList.value = result;
    } else {
      Get.defaultDialog(title: result);
    }
  }
}

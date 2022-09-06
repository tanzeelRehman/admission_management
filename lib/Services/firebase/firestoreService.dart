import 'package:admission_management/Model/StudentsModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final CollectionReference _students =
      FirebaseFirestore.instance.collection('Students');

  //! ADD A NEW STUDENT RECORD
  Future<String> addstudentRecord(StudentsModel model) async {
    String res = '';
    try {
      if (await isDuplicateUniqueName(model.admissionNo)) {
        return "existed";
      } else {
        final studentsDoc = _students.doc(model.admissionNo);
        // model. = complaintDoc.id;
        // print(model.complaint_id);

        await studentsDoc.set(model.toMap());

        return res = "Sucess";
      }
    } catch (e) {
      print("In catch");
      print(e.toString());
      return res = "Some error has occured";
    }
  }

  //! UPDATE STUDENT RECORD
  Future<String> updatestudentRecord(
      StudentsModel model, String oldAdmissionNo) async {
    String res = '';
    try {
      //! CAN BE USED IF DONT HAVE ID OF DOC
      // _students
      //     .where('admissionNo', isEqualTo: oldAdmissionNo)
      //     .get()
      //     .then((snapshots) => {
      //           if (snapshots.size > 0) {_students.doc().update(model.toMap())}
      //         });

      await _students.doc(oldAdmissionNo).update(model.toMap());

      return res = "Sucess";
    } catch (e) {
      print(e.toString());
      return res = "Some error has occured";
    }
  }

  //! DELETE STUDENT RECORD
  Future<String> deletestudentRecord(String oldAdmissionNo) async {
    String res = '';
    try {
      await _students.doc(oldAdmissionNo).delete();

      return res = "Sucess";
    } catch (e) {
      print(e.toString());
      return res = "Some error has occured";
    }
  }

  //! this function checks if uniqueName already exists
  Future<bool> isDuplicateUniqueName(String admissionNo) async {
    QuerySnapshot query =
        await _students.where('admissionNo', isEqualTo: admissionNo).get();
    return query.docs.isNotEmpty;
  }

  //! ADD GET ALL STUDENTS RECORD
  Future getAllStudents() async {
    try {
      late QuerySnapshot<Object?> students;
      students =
          await _students.orderBy('admissionNo', descending: false).get();

      List<StudentsModel> studentList = [];
      for (var i = 0; i < students.docs.length; i++) {
        StudentsModel complaint = StudentsModel.fromMap(
            students.docs[i].data() as Map<String, dynamic>);

        studentList.add(complaint);
      }

      return studentList;
    } catch (e) {
      return e.toString();
    }
  }

  //! ADD GET ALL STUDENTS RECORD
  Future searchStudents(String field) async {
    try {
      late QuerySnapshot<Object?> students;
      if (field.isNotEmpty) {
        students = await _students
            .orderBy('admissionNo', descending: false)
            .startAt([field]).endAt([field + "\uf8ff"]).get();
      } else {
        students =
            await _students.orderBy('admissionNo', descending: false).get();
      }

      List<StudentsModel> studentList = [];
      for (var i = 0; i < students.docs.length; i++) {
        StudentsModel complaint = StudentsModel.fromMap(
            students.docs[i].data() as Map<String, dynamic>);

        studentList.add(complaint);
      }

      return studentList;
    } catch (e) {
      return e.toString();
    }
  }
}

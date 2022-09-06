import 'dart:convert';

class StudentsModel {
  String admissionNo;
  String admissionDate;
  String? withdrawlDate;
  String? reasonOfWithdrawl;
  String studentName;
  String studentCINIC;
  int studentclass;
  String studentGroup;
  String studentDOB;
  String studentFatherName;
  String studentFatherMobileNo;
  String studentFatherCINIC;
  String? studentAddress;
  StudentsModel({
    required this.admissionNo,
    required this.admissionDate,
    this.withdrawlDate,
    this.reasonOfWithdrawl,
    required this.studentName,
    required this.studentCINIC,
    required this.studentclass,
    required this.studentGroup,
    required this.studentDOB,
    required this.studentFatherName,
    required this.studentFatherMobileNo,
    required this.studentFatherCINIC,
    this.studentAddress,
  });

  StudentsModel copyWith({
    String? admissionNo,
    String? admissionDate,
    String? withdrawlDate,
    String? reasonOfWithdrawl,
    String? studentName,
    String? studentCINIC,
    int? studentclass,
    String? studentGroup,
    String? studentDOB,
    String? studentFatherName,
    String? studentFatherMobileNo,
    String? studentFatherCINIC,
    String? studentAddress,
  }) {
    return StudentsModel(
      admissionNo: admissionNo ?? this.admissionNo,
      admissionDate: admissionDate ?? this.admissionDate,
      withdrawlDate: withdrawlDate ?? this.withdrawlDate,
      reasonOfWithdrawl: reasonOfWithdrawl ?? this.reasonOfWithdrawl,
      studentName: studentName ?? this.studentName,
      studentCINIC: studentCINIC ?? this.studentCINIC,
      studentclass: studentclass ?? this.studentclass,
      studentGroup: studentGroup ?? this.studentGroup,
      studentDOB: studentDOB ?? this.studentDOB,
      studentFatherName: studentFatherName ?? this.studentFatherName,
      studentFatherMobileNo:
          studentFatherMobileNo ?? this.studentFatherMobileNo,
      studentFatherCINIC: studentFatherCINIC ?? this.studentFatherCINIC,
      studentAddress: studentAddress ?? this.studentAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'admissionNo': admissionNo,
      'admissionDate': admissionDate,
      'withdrawlDate': withdrawlDate,
      'reasonOfWithdrawl': reasonOfWithdrawl,
      'studentName': studentName,
      'studentCINIC': studentCINIC,
      'studentclass': studentclass,
      'studentGroup': studentGroup,
      'studentDOB': studentDOB,
      'studentFatherName': studentFatherName,
      'studentFatherMobileNo': studentFatherMobileNo,
      'studentFatherCINIC': studentFatherCINIC,
      'studentAddress': studentAddress,
    };
  }

  factory StudentsModel.fromMap(Map<String, dynamic> map) {
    return StudentsModel(
      admissionNo: map['admissionNo'] ?? '',
      admissionDate: map['admissionDate'] ?? '',
      withdrawlDate: map['withdrawlDate'],
      reasonOfWithdrawl: map['reasonOfWithdrawl'],
      studentName: map['studentName'] ?? '',
      studentCINIC: map['studentCINIC'] ?? '',
      studentclass: map['studentclass']?.toInt() ?? 0,
      studentGroup: map['studentGroup'] ?? '',
      studentDOB: map['studentDOB'] ?? '',
      studentFatherName: map['studentFatherName'] ?? '',
      studentFatherMobileNo: map['studentFatherMobileNo'] ?? '',
      studentFatherCINIC: map['studentFatherCINIC'] ?? '',
      studentAddress: map['studentAddress'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentsModel.fromJson(String source) =>
      StudentsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StudentsModel(admissionNo: $admissionNo, admissionDate: $admissionDate, withdrawlDate: $withdrawlDate, reasonOfWithdrawl: $reasonOfWithdrawl, studentName: $studentName, studentCINIC: $studentCINIC, studentclass: $studentclass, studentGroup: $studentGroup, studentDOB: $studentDOB, studentFatherName: $studentFatherName, studentFatherMobileNo: $studentFatherMobileNo, studentFatherCINIC: $studentFatherCINIC, studentAddress: $studentAddress)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentsModel &&
        other.admissionNo == admissionNo &&
        other.admissionDate == admissionDate &&
        other.withdrawlDate == withdrawlDate &&
        other.reasonOfWithdrawl == reasonOfWithdrawl &&
        other.studentName == studentName &&
        other.studentCINIC == studentCINIC &&
        other.studentclass == studentclass &&
        other.studentGroup == studentGroup &&
        other.studentDOB == studentDOB &&
        other.studentFatherName == studentFatherName &&
        other.studentFatherMobileNo == studentFatherMobileNo &&
        other.studentFatherCINIC == studentFatherCINIC &&
        other.studentAddress == studentAddress;
  }

  @override
  int get hashCode {
    return admissionNo.hashCode ^
        admissionDate.hashCode ^
        withdrawlDate.hashCode ^
        reasonOfWithdrawl.hashCode ^
        studentName.hashCode ^
        studentCINIC.hashCode ^
        studentclass.hashCode ^
        studentGroup.hashCode ^
        studentDOB.hashCode ^
        studentFatherName.hashCode ^
        studentFatherMobileNo.hashCode ^
        studentFatherCINIC.hashCode ^
        studentAddress.hashCode;
  }
}

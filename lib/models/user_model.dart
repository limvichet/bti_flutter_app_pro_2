// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String id;
    List<String> userId;
    String payrollId;
    String nameKh;
    String nameEn;
    String gender;
    DateTime? dob;
    DateTime? dateOfStartingWork;
    String locationKh;
    String locationType;
    String province;
    String commune;
    String currentPosition;
    DateTime? startDate;
    String salaryLevelKh;
    String salaryDegree;
    String salaryTypeShiftDate;
    String highestQualification;
    String highestQualificationSubject;
    DateTime? highestQualificationDate;
    String highestProfessional;
    String professional;
    DateTime? createdAt;
    DateTime? updatedAt;
    int v;

    UserModel({
        required this.id,
        required this.userId,
        required this.payrollId,
        required this.nameKh,
        required this.nameEn,
        required this.gender,
        required this.dob,
        required this.dateOfStartingWork,
        required this.locationKh,
        required this.locationType,
        required this.province,
        required this.commune,
        required this.currentPosition,
        required this.startDate,
        required this.salaryLevelKh,
        required this.salaryDegree,
        required this.salaryTypeShiftDate,
        required this.highestQualification,
        required this.highestQualificationSubject,
        required this.highestQualificationDate,
        required this.highestProfessional,
        required this.professional,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        userId: List<String>.from(json["user_id"].map((x) => x)),
        payrollId: json["payroll_id"],
        nameKh: json["name_kh"],
        nameEn: json["name_en"],
        gender: json["gender"],
        dob: DateTime.parse(json["dob"]),
        dateOfStartingWork: DateTime.parse(json["date_of_starting_work"]),
        locationKh: json["location_kh"],
        locationType: json["location_type"],
        province: json["province"],
        commune: json["commune"],
        currentPosition: json["current_position"],
        startDate: DateTime.parse(json["start_date"]),
        salaryLevelKh: json["salary_level_kh"],
        salaryDegree: json["salary_degree"],
        salaryTypeShiftDate: json["salary_type_shift_date"],
        highestQualification: json["highest_qualification"],
        highestQualificationSubject: json["highest_qualification_subject"],
        highestQualificationDate: DateTime.parse(json["highest_qualification_date"]),
        highestProfessional: json["highest_professional"],
        professional: json["professional"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user_id": List<dynamic>.from(userId.map((x) => x)),
        "payroll_id": payrollId,
        "name_kh": nameKh,
        "name_en": nameEn,
        "gender": gender,
        "dob": dob.toString(),
        "date_of_starting_work": dateOfStartingWork.toString(),
        "location_kh": locationKh,
        "location_type": locationType,
        "province": province,
        "commune": commune,
        "current_position": currentPosition,
        "start_date": startDate.toString(),
        "salary_level_kh": salaryLevelKh,
        "salary_degree": salaryDegree,
        "salary_type_shift_date": salaryTypeShiftDate,
        "highest_qualification": highestQualification,
        "highest_qualification_subject": highestQualificationSubject,
        "highest_qualification_date": highestQualificationDate.toString(),
        "highest_professional": highestProfessional,
        "professional": professional,
        "createdAt": createdAt.toString(),
        "updatedAt": updatedAt.toString(),
        "__v": v,
    };
}

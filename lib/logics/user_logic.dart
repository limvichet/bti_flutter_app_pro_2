import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

class UserLogic extends ChangeNotifier {
  UserModel _userModel = UserModel(
    id: "",
    userId: [],
    payrollId: "",
    nameKh: "",
    nameEn: "",
    gender: "",
    dob: null,
    dateOfStartingWork: null,
    locationKh: "",
    locationType: "",
    province: "",
    commune: "",
    currentPosition: "",
    startDate: null,
    salaryLevelKh: "",
    salaryDegree: "",
    salaryTypeShiftDate: "",
    highestQualification: "",
    highestQualificationSubject: "",
    highestQualificationDate: null,
    highestProfessional: "",
    professional: "",
    createdAt: null,
    updatedAt: null,
    v: 0,
  );
  UserModel get userModel => _userModel;

  bool _loading = false;
  bool get loading => _loading;

  void enableLoading() {
    _loading = true;
    notifyListeners();
  }

  void disableLoading() {
    _loading = false;
    notifyListeners();
  }

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void fetch(String userid) async {
    enableLoading();
    try {
      _userModel = await UserService.readData(userid);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }

    disableLoading();
    notifyListeners();
  }
}

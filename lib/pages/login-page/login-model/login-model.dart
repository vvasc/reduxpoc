import 'package:reduxpoc/pages/login-page/login-model/userInfo-model.dart';

class LoginModel {
  String expiresIn; 
  String accessToken;
  UserInfoModel userInfo;

  LoginModel.fromJson(Map<String, dynamic> json) {
    this.expiresIn    = json['expiresIn'];
    this.accessToken  = json['accessToken'];
    this.userInfo     = json['userInfo'].map((userInfo) => UserInfoModel.fromJson(userInfo));
  }
}

class UserInfoModel {
  String email; 
  String name;

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    this.email        = json['email'];
    this.name         = json['name'];
  }
}

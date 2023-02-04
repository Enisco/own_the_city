class CreateAccountModel {
  String? uid;
  String? corlmiNumber;
  String? email;
  String? phoneNumber;
  String? fullName;
  String? password;

  CreateAccountModel({
    this.uid,
    this.corlmiNumber,
    this.email,
    this.phoneNumber,
    this.fullName,
    this.password,
  });

  factory CreateAccountModel.fromJson(Map<dynamic, dynamic> json) =>
      CreateAccountModel(
        uid: json['uid'] as String,
        corlmiNumber: json['corlmiNumber'] as String,
        email: json['email'] as String,
        phoneNumber: json['phoneNumber'] as dynamic,
        fullName: json['fullName'] as String,
        password: json['password'] as String,        
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'corlmiNumber': corlmiNumber,
        'email': email,
        'phoneNumber': phoneNumber,
        'fullName': fullName,
        'password': password,
      };
}

class UserModel {
  String? uid;
  String? email;
  String? fullName;
  String? userName;

  UserModel({this.uid, this.email, this.fullName, this.userName});


  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      fullName: map['fullName'],
      userName: map['userName']
    );
  }

//sending
  Map<String, dynamic> tomap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'userName': userName,
    };
  }
}

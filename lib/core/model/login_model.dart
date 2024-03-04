class LoginData {
  int? code;
  String? status;
  String? message;
  Data? data;

  LoginData({this.code, this.status, this.message, this.data});

  LoginData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sessionId;
  String? sId;
  String? username;
  String? firstName;
  String? userId;
  String? password;
  String? email;
  String? userType;
  bool? isLoggedIn;
  bool? canPost;
  bool? isBlocked;
  bool? isVerified;
  String? accessToken;
  String? inviteCode;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sessionId,
        this.sId,
        this.username,
        this.firstName,
        this.userId,
        this.password,
        this.email,
        this.userType,
        this.isLoggedIn,
        this.canPost,
        this.isBlocked,
        this.isVerified,
        this.accessToken,
        this.inviteCode,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    sId = json['_id'];
    username = json['username'];
    firstName = json['first_name'];
    userId = json['user_id'];
    password = json['password'];
    email = json['email'];
    userType = json['user_type'];
    isLoggedIn = json['is_loggedIn'];
    canPost = json['can_post'];
    isBlocked = json['is_blocked'];
    isVerified = json['is_verified'];
    accessToken = json['access_token'];
    inviteCode = json['invite_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['session_id'] = this.sessionId;
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['user_id'] = this.userId;
    data['password'] = this.password;
    data['email'] = this.email;
    data['user_type'] = this.userType;
    data['is_loggedIn'] = this.isLoggedIn;
    data['can_post'] = this.canPost;
    data['is_blocked'] = this.isBlocked;
    data['is_verified'] = this.isVerified;
    data['access_token'] = this.accessToken;
    data['invite_code'] = this.inviteCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
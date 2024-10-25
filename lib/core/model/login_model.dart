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
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['session_id'] = sessionId;
    data['_id'] = sId;
    data['username'] = username;
    data['first_name'] = firstName;
    data['user_id'] = userId;
    data['password'] = password;
    data['email'] = email;
    data['user_type'] = userType;
    data['is_loggedIn'] = isLoggedIn;
    data['can_post'] = canPost;
    data['is_blocked'] = isBlocked;
    data['is_verified'] = isVerified;
    data['access_token'] = accessToken;
    data['invite_code'] = inviteCode;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
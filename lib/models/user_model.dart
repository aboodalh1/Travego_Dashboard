class UserModel {
  UserModel({
      this.message, 
      this.status, 
      this.localDateTime, 
      this.body,});

  UserModel.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    localDateTime = json['localDateTime'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  String? message;
  String? status;
  String? localDateTime;
  Body? body;
UserModel copyWith({  String? message,
  String? status,
  String? localDateTime,
  Body? body,
}) => UserModel(  message: message ?? this.message,
  status: status ?? this.status,
  localDateTime: localDateTime ?? this.localDateTime,
  body: body ?? this.body,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    map['localDateTime'] = localDateTime;
    if (body != null) {
      map['body'] = body?.toJson();
    }
    return map;
  }

}

class Body {
  Body({
      this.user, 
      this.token,});

  Body.fromJson(dynamic json) {
    user = json['User'] != null ? User.fromJson(json['User']) : null;
    token = json['Token'];
  }
  User? user;
  String? token;
Body copyWith({  User? user,
  String? token,
}) => Body(  user: user ?? this.user,
  token: token ?? this.token,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['User'] = user?.toJson();
    }
    map['Token'] = token;
    return map;
  }

}

class User {
  User({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.theusername, 
      this.email, 
      this.creationDate, 
      this.active,});

  User.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    theusername = json['theusername'];
    email = json['email'];
    creationDate = json['creationDate'];
    active = json['active'];
  }
  num? id;
  String? firstName;
  String? lastName;
  String? theusername;
  String? email;
  String? creationDate;
  bool? active;
User copyWith({  num? id,
  String? firstName,
  String? lastName,
  String? theusername,
  String? email,
  String? creationDate,
  bool? active,
}) => User(  id: id ?? this.id,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  theusername: theusername ?? this.theusername,
  email: email ?? this.email,
  creationDate: creationDate ?? this.creationDate,
  active: active ?? this.active,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['theusername'] = theusername;
    map['email'] = email;
    map['creationDate'] = creationDate;
    map['active'] = active;
    return map;
  }

}
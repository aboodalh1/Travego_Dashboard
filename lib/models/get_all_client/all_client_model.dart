class AllClientModel {
  AllClientModel({
      this.message, 
      this.status, 
      this.localDateTime, 
      this.body,});

  AllClientModel.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    localDateTime = json['localDateTime'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  String? message;
  String? status;
  String? localDateTime;
  Body? body;
AllClientModel copyWith({  String? message,
  String? status,
  String? localDateTime,
  Body? body,
}) => AllClientModel(  message: message ?? this.message,
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
      this.content, 
      this.pageable, 
      this.totalPages, 
      this.totalElements, 
      this.last, 
      this.size, 
      this.number, 
      this.sort, 
      this.numberOfElements, 
      this.first, 
      this.empty,});

  Body.fromJson(dynamic json) {
    if (json['content'] != null) {
      content = [];
      json['content'].forEach((v) {
        content?.add(Content.fromJson(v));
      });
    }
    pageable = json['pageable'] != null ? Pageable.fromJson(json['pageable']) : null;
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    last = json['last'];
    size = json['size'];
    number = json['number'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    numberOfElements = json['numberOfElements'];
    first = json['first'];
    empty = json['empty'];
  }
  List<Content>? content;
  Pageable? pageable;
  num? totalPages;
  num? totalElements;
  bool? last;
  num? size;
  num? number;
  Sort? sort;
  num? numberOfElements;
  bool? first;
  bool? empty;
Body copyWith({  List<Content>? content,
  Pageable? pageable,
  num? totalPages,
  num? totalElements,
  bool? last,
  num? size,
  num? number,
  Sort? sort,
  num? numberOfElements,
  bool? first,
  bool? empty,
}) => Body(  content: content ?? this.content,
  pageable: pageable ?? this.pageable,
  totalPages: totalPages ?? this.totalPages,
  totalElements: totalElements ?? this.totalElements,
  last: last ?? this.last,
  size: size ?? this.size,
  number: number ?? this.number,
  sort: sort ?? this.sort,
  numberOfElements: numberOfElements ?? this.numberOfElements,
  first: first ?? this.first,
  empty: empty ?? this.empty,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (content != null) {
      map['content'] = content?.map((v) => v.toJson()).toList();
    }
    if (pageable != null) {
      map['pageable'] = pageable?.toJson();
    }
    map['totalPages'] = totalPages;
    map['totalElements'] = totalElements;
    map['last'] = last;
    map['size'] = size;
    map['number'] = number;
    if (sort != null) {
      map['sort'] = sort?.toJson();
    }
    map['numberOfElements'] = numberOfElements;
    map['first'] = first;
    map['empty'] = empty;
    return map;
  }

}

class Sort {
  Sort({
      this.empty, 
      this.sorted, 
      this.unsorted,});

  Sort.fromJson(dynamic json) {
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }
  bool? empty;
  bool? sorted;
  bool? unsorted;
Sort copyWith({  bool? empty,
  bool? sorted,
  bool? unsorted,
}) => Sort(  empty: empty ?? this.empty,
  sorted: sorted ?? this.sorted,
  unsorted: unsorted ?? this.unsorted,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['empty'] = empty;
    map['sorted'] = sorted;
    map['unsorted'] = unsorted;
    return map;
  }

}

class Pageable {
  Pageable({
      this.pageNumber, 
      this.pageSize, 
      this.sort, 
      this.offset, 
      this.paged, 
      this.unpaged,});

  Pageable.fromJson(dynamic json) {
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    offset = json['offset'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }
  num? pageNumber;
  num? pageSize;
  Sort? sort;
  num? offset;
  bool? paged;
  bool? unpaged;
Pageable copyWith({  num? pageNumber,
  num? pageSize,
  Sort? sort,
  num? offset,
  bool? paged,
  bool? unpaged,
}) => Pageable(  pageNumber: pageNumber ?? this.pageNumber,
  pageSize: pageSize ?? this.pageSize,
  sort: sort ?? this.sort,
  offset: offset ?? this.offset,
  paged: paged ?? this.paged,
  unpaged: unpaged ?? this.unpaged,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pageNumber'] = pageNumber;
    map['pageSize'] = pageSize;
    if (sort != null) {
      map['sort'] = sort?.toJson();
    }
    map['offset'] = offset;
    map['paged'] = paged;
    map['unpaged'] = unpaged;
    return map;
  }

}

class Sort1 {
  Sort1({
      this.empty, 
      this.sorted, 
      this.unsorted,});

  Sort1.fromJson(dynamic json) {
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }
  bool? empty;
  bool? sorted;
  bool? unsorted;
Sort copyWith({  bool? empty,
  bool? sorted,
  bool? unsorted,
}) => Sort(  empty: empty ?? this.empty,
  sorted: sorted ?? this.sorted,
  unsorted: unsorted ?? this.unsorted,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['empty'] = empty;
    map['sorted'] = sorted;
    map['unsorted'] = unsorted;
    return map;
  }

}

class Content {
  Content({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.theusername, 
      this.email, 
      this.creationDate, 
      this.phoneNumber,});

  Content.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    theusername = json['theusername'];
    email = json['email'];
    creationDate = json['creationDate'];
    phoneNumber = json['phone_number'];
  }
  num? id;
  String? firstName;
  String? lastName;
  String? theusername;
  String? email;
  String? creationDate;
  String? phoneNumber;
Content copyWith({  num? id,
  String? firstName,
  String? lastName,
  String? theusername,
  String? email,
  String? creationDate,
  String? phoneNumber,
}) => Content(  id: id ?? this.id,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  theusername: theusername ?? this.theusername,
  email: email ?? this.email,
  creationDate: creationDate ?? this.creationDate,
  phoneNumber: phoneNumber ?? this.phoneNumber,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['theusername'] = theusername;
    map['email'] = email;
    map['creationDate'] = creationDate;
    map['phone_number'] = phoneNumber;
    return map;
  }

}
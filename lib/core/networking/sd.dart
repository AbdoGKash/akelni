class User {
  int? status;
  String? message;
  Customer? customer;
  Contacts? contacts;

  User({this.status, this.message, this.customer, this.contacts});

  User.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    contacts = json['contacts'] != null
        ? new Contacts.fromJson(json['contacts'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.contacts != null) {
      data['contacts'] = this.contacts!.toJson();
    }
    return data;
  }
}

class Customer {
  String? id;
  String? name;
  int? numOfNotfications;

  Customer({this.id, this.name, this.numOfNotfications});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    numOfNotfications = json['numOfNotfications'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['numOfNotfications'] = this.numOfNotfications;
    return data;
  }
}

class Contacts {
  String? phone;
  String? email;
  String? link;

  Contacts({this.phone, this.email, this.link});

  Contacts.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    email = json['email'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['link'] = this.link;
    return data;
  }
}

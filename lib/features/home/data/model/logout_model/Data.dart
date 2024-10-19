class Data {
  Data({
    this.id,
    this.token,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    token = json['token'];
  }

  num? id;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['token'] = token;
    return map;
  }
}

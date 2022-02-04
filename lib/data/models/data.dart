class User {
  int? id;
  int? userid;
  String? title;
  bool? complete;
  User(this.id, this.userid, this.title, this.complete);
  User.fomJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userId'];
    title = json['title'];
    complete = json['completed'];
  }
}

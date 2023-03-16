class UserModel {
  int? id;
  String? username;
  String? subusername;
  String? userAvatar;
  String? media;
  int? likeCount;
  String? content;

  UserModel(
      {this.id,
      this.username,
      this.subusername,
      this.userAvatar,
      this.media,
      this.likeCount,
      this.content});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    subusername = json['subusername'];
    userAvatar = json['userAvatar'];
    media = json['media'];
    likeCount = json['likeCount'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['subusername'] = this.subusername;
    data['userAvatar'] = this.userAvatar;
    data['media'] = this.media;
    data['likeCount'] = this.likeCount;
    data['content'] = this.content;
    return data;
  }
}

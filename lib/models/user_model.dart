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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['subusername'] = subusername;
    data['userAvatar'] = userAvatar;
    data['media'] = media;
    data['likeCount'] = likeCount;
    data['content'] = content;
    return data;
  }
}

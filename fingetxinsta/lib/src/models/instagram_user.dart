class IUser {
  String? uid;
  String? nickname;
  String? description;
  String? thumbnail;
  IUser({
    this.uid,
    this.nickname,
    this.description,
    this.thumbnail,
  });

  factory IUser.fromJson(Map<String, dynamic> json) {
    return IUser(
      uid: json['uid'] == null ? '' : json['uid'] as String,
      nickname: json['nickname'] == null ? '' : json['nickname'] as String,
      description:
          json['description'] == null ? '' : json['description'] as String,
      thumbnail: json['thumbnail'] == null ? '' : json['thumbnail'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nickname': nickname,
      'thumbnail': thumbnail,
      'description': description,
    };
  }
}

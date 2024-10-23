class Banner {
  String? bannerName;
  String? bannerImage;
  String? description;

  Banner({this.bannerName, this.bannerImage, this.description});

  Banner.fromJson(Map<String, dynamic> json) {
    bannerName = json['banner_name'];
    bannerImage = json['banner_image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['banner_name'] = bannerName;
    data['banner_image'] = bannerImage;
    data['description'] = description;
    return data;
  }
}

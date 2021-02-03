class ReportImageModel {
  String image;
  String thumb;
  String sub;

  ReportImageModel({this.image, this.thumb, this.sub});

  ReportImageModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    thumb = json['thumb'];
    sub = json['sub'];
  }

  Map<String, dynamic> toJson() => {'image': image, 'thumb': thumb, 'sub': sub};
}

class BannerListResponse {
  bool? status;
  List<BannerList>? bannerList;

  BannerListResponse({this.status, this.bannerList});

  BannerListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['banner_list'] != null) {
      bannerList = <BannerList>[];
      json['banner_list'].forEach((v) {
        bannerList!.add(BannerList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (bannerList != null) {
      data['banner_list'] = bannerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerList {
  String? id;
  String? alias;
  String? title;
  List<Slides>? slides;

  BannerList({this.id, this.alias, this.title, this.slides});

  BannerList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alias = json['alias'];
    title = json['title'];
    if (json['slides'] != null) {
      slides = <Slides>[];
      json['slides'].forEach((v) {
        slides!.add(Slides.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['alias'] = alias;
    data['title'] = title;
    if (slides != null) {
      data['slides'] = slides!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slides {
  String? id;
  String? title;
  String? imageUrl;
  String? linkUrl;
  String? endpoint;

  Slides({this.id, this.title, this.imageUrl, this.linkUrl, this.endpoint});

  Slides.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageUrl = json['image_url'];
    linkUrl = json['link_url'];
    endpoint = json['endpoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image_url'] = imageUrl;
    data['link_url'] = linkUrl;
    data['endpoint'] = endpoint;
    return data;
  }
}

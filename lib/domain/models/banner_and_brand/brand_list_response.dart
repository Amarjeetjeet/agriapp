class BrandListResponse {
  bool? status;
  List<BrandList>? brandList;

  BrandListResponse({this.status, this.brandList});

  BrandListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['brand_list'] != null) {
      brandList = <BrandList>[];
      json['brand_list'].forEach((v) {
        brandList!.add(BrandList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (brandList != null) {
      data['brand_list'] = brandList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BrandList {
  int? brandId;
  String? brandName;
  String? brandSlug;
  int? parentBrand;
  String? brandDescription;
  String? brandLogo;

  BrandList({
    this.brandId,
    this.brandName,
    this.brandSlug,
    this.parentBrand,
    this.brandDescription,
    this.brandLogo,
  });

  BrandList.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    brandName = json['brand_name'];
    brandSlug = json['brand_slug'];
    parentBrand = json['parent_brand'];
    brandDescription = json['brand_description'];
    brandLogo = json['brand_logo'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand_id'] = brandId;
    data['brand_name'] = brandName;
    data['brand_slug'] = brandSlug;
    data['parent_brand'] = parentBrand;
    data['brand_description'] = brandDescription;
    data['brand_logo'] = brandLogo;
    return data;
  }
}

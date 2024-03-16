class CategoryListResponse {
  List<ProductCategries>? productCategries;

  CategoryListResponse({this.productCategries});

  CategoryListResponse.fromJson(Map<String, dynamic> json) {
    if (json['product_categries'] != null) {
      productCategries = <ProductCategries>[];
      json['product_categries'].forEach((v) {
        productCategries!.add(ProductCategries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productCategries != null) {
      data['product_categries'] =
          productCategries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductCategries {
  int? termId;
  String? name;
  String? slug;
  int? termGroup;
  int? termTaxonomyId;
  String? taxonomy;
  String? description;
  int? parent;
  int? count;
  String? filter;
  int? catID;
  int? categoryCount;
  String? categoryDescription;
  String? catName;
  String? categoryNicename;
  int? categoryParent;

  ProductCategries(
      {this.termId,
        this.name,
        this.slug,
        this.termGroup,
        this.termTaxonomyId,
        this.taxonomy,
        this.description,
        this.parent,
        this.count,
        this.filter,
        this.catID,
        this.categoryCount,
        this.categoryDescription,
        this.catName,
        this.categoryNicename,
        this.categoryParent});

  ProductCategries.fromJson(Map<String, dynamic> json) {
    termId = json['term_id'];
    name = json['name'];
    slug = json['slug'];
    termGroup = json['term_group'];
    termTaxonomyId = json['term_taxonomy_id'];
    taxonomy = json['taxonomy'];
    description = json['description'];
    parent = json['parent'];
    count = json['count'];
    filter = json['filter'];
    catID = json['cat_ID'];
    categoryCount = json['category_count'];
    categoryDescription = json['category_description'];
    catName = json['cat_name'];
    categoryNicename = json['category_nicename'];
    categoryParent = json['category_parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['term_id'] = termId;
    data['name'] = name;
    data['slug'] = slug;
    data['term_group'] = termGroup;
    data['term_taxonomy_id'] = termTaxonomyId;
    data['taxonomy'] = taxonomy;
    data['description'] = description;
    data['parent'] = parent;
    data['count'] = count;
    data['filter'] = filter;
    data['cat_ID'] = catID;
    data['category_count'] = categoryCount;
    data['category_description'] = categoryDescription;
    data['cat_name'] = catName;
    data['category_nicename'] = categoryNicename;
    data['category_parent'] = categoryParent;
    return data;
  }
}

class CategoryByProduct {
  int? iD;
  String? postAuthor;
  String? postDate;
  String? postDateGmt;
  String? postContent;
  String? postTitle;
  String? postExcerpt;
  String? postStatus;
  String? commentStatus;
  String? pingStatus;
  String? postPassword;
  String? postName;
  String? toPing;
  String? pinged;
  String? postModified;
  String? postModifiedGmt;
  String? postContentFiltered;
  int? postParent;
  String? guid;
  int? menuOrder;
  String? postType;
  String? postMimeType;
  String? commentCount;
  String? filter;

  CategoryByProduct(
      {this.iD,
        this.postAuthor,
        this.postDate,
        this.postDateGmt,
        this.postContent,
        this.postTitle,
        this.postExcerpt,
        this.postStatus,
        this.commentStatus,
        this.pingStatus,
        this.postPassword,
        this.postName,
        this.toPing,
        this.pinged,
        this.postModified,
        this.postModifiedGmt,
        this.postContentFiltered,
        this.postParent,
        this.guid,
        this.menuOrder,
        this.postType,
        this.postMimeType,
        this.commentCount,
        this.filter});

  CategoryByProduct.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    postAuthor = json['post_author'];
    postDate = json['post_date'];
    postDateGmt = json['post_date_gmt'];
    postContent = json['post_content'];
    postTitle = json['post_title'];
    postExcerpt = json['post_excerpt'];
    postStatus = json['post_status'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    postPassword = json['post_password'];
    postName = json['post_name'];
    toPing = json['to_ping'];
    pinged = json['pinged'];
    postModified = json['post_modified'];
    postModifiedGmt = json['post_modified_gmt'];
    postContentFiltered = json['post_content_filtered'];
    postParent = json['post_parent'];
    guid = json['guid'];
    menuOrder = json['menu_order'];
    postType = json['post_type'];
    postMimeType = json['post_mime_type'];
    commentCount = json['comment_count'];
    filter = json['filter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['post_author'] = postAuthor;
    data['post_date'] = postDate;
    data['post_date_gmt'] = postDateGmt;
    data['post_content'] = postContent;
    data['post_title'] = postTitle;
    data['post_excerpt'] = postExcerpt;
    data['post_status'] = postStatus;
    data['comment_status'] = commentStatus;
    data['ping_status'] = pingStatus;
    data['post_password'] = postPassword;
    data['post_name'] = postName;
    data['to_ping'] = toPing;
    data['pinged'] = pinged;
    data['post_modified'] = postModified;
    data['post_modified_gmt'] = postModifiedGmt;
    data['post_content_filtered'] = postContentFiltered;
    data['post_parent'] = postParent;
    data['guid'] = guid;
    data['menu_order'] = menuOrder;
    data['post_type'] = postType;
    data['post_mime_type'] = postMimeType;
    data['comment_count'] = commentCount;
    data['filter'] = filter;
    return data;
  }
}


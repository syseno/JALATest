class ShrimpNewsModel {
  List<ShrimpNewsData>? data;
  Meta? meta;

  ShrimpNewsModel({this.data, this.meta});

  ShrimpNewsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ShrimpNewsData>[];
      json['data'].forEach((v) {
        data!.add(ShrimpNewsData.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class ShrimpNewsData {
  int? id;
  int? authorId;
  int? categoryId;
  String? image;
  String? status;
  bool? featured;
  Null? advertisement;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? seoTitle;
  String? excerpt;
  String? body;
  String? slug;
  String? metaDescription;
  String? metaKeywords;

  ShrimpNewsData(
      {this.id,
        this.authorId,
        this.categoryId,
        this.image,
        this.status,
        this.featured,
        this.advertisement,
        this.createdAt,
        this.updatedAt,
        this.title,
        this.seoTitle,
        this.excerpt,
        this.body,
        this.slug,
        this.metaDescription,
        this.metaKeywords});

  ShrimpNewsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authorId = json['author_id'];
    categoryId = json['category_id'];
    image = json['image'];
    status = json['status'];
    featured = json['featured'];
    advertisement = json['advertisement'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    seoTitle = json['seo_title'];
    excerpt = json['excerpt'];
    body = json['body'];
    slug = json['slug'];
    metaDescription = json['meta_description'];
    metaKeywords = json['meta_keywords'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['author_id'] = authorId;
    data['category_id'] = categoryId;
    data['image'] = image;
    data['status'] = status;
    data['featured'] = featured;
    data['advertisement'] = advertisement;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['title'] = title;
    data['seo_title'] = seoTitle;
    data['excerpt'] = excerpt;
    data['body'] = body;
    data['slug'] = slug;
    data['meta_description'] = metaDescription;
    data['meta_keywords'] = metaKeywords;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  String? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}
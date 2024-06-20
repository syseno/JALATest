class ShrimpPriceModel {
  List<ShrimpPriceData>? data;
  Meta? meta;

  ShrimpPriceModel({this.data, this.meta});

  ShrimpPriceModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ShrimpPriceData>[];
      json['data'].forEach((v) {
        data!.add(ShrimpPriceData.fromJson(v));
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

class ShrimpPriceData {
  int? id;
  int? speciesId;
  String? date;
  int? size20;
  int? size30;
  int? size40;
  int? size50;
  int? size60;
  int? size70;
  int? size80;
  int? size90;
  int? size100;
  int? size110;
  int? size120;
  int? size130;
  int? size140;
  int? size150;
  int? size160;
  int? size170;
  int? size180;
  int? size190;
  int? size200;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? regionId;
  String? countryId;
  String? currencyId;
  String? remark;
  int? private;
  int? week;
  String? dateRegionFullName;
  String? provinceId;
  String? regencyId;
  String? districtId;
  String? villageId;
  String? occupation;
  Region? region;
  Creator? creator;

  ShrimpPriceData(
      {this.id,
      this.remark,
      this.speciesId,
      this.date,
      this.size20,
      this.size30,
      this.size40,
      this.size50,
      this.size60,
      this.size70,
      this.size80,
      this.size90,
      this.size100,
      this.size110,
      this.size120,
      this.size130,
      this.size140,
      this.size150,
      this.size160,
      this.size170,
      this.size180,
      this.size190,
      this.size200,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.regionId,
      this.countryId,
      this.currencyId,
      this.private,
      this.week,
      this.occupation,
      this.dateRegionFullName,
      this.provinceId,
      this.regencyId,
      this.districtId,
      this.villageId,
      this.region,
      this.creator});

  ShrimpPriceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    speciesId = json['species_id'];
    date = json['date'];
    size20 = json['size_20'];
    size30 = json['size_30'];
    size40 = json['size_40'];
    size50 = json['size_50'];
    size60 = json['size_60'];
    size70 = json['size_70'];
    size80 = json['size_80'];
    size90 = json['size_90'];
    size100 = json['size_100'];
    size110 = json['size_110'];
    size120 = json['size_120'];
    size130 = json['size_130'];
    size140 = json['size_140'];
    size150 = json['size_150'];
    size160 = json['size_160'];
    size170 = json['size_170'];
    size180 = json['size_180'];
    size190 = json['size_190'];
    size200 = json['size_200'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    regionId = json['region_id'];
    occupation = json['occupation'];
    countryId = json['country_id'];
    currencyId = json['currency_id'];
    remark = json['remark'];
    private = json['private'];
    week = json['week'];
    dateRegionFullName = json['date_region_full_name'];
    provinceId = json['province_id'];
    regencyId = json['regency_id'];
    districtId = json['district_id'];
    villageId = json['village_id'];
    region = json['region'] != null ? Region.fromJson(json['region']) : null;
    creator =
        json['creator'] != null ? Creator.fromJson(json['creator']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['species_id'] = speciesId;
    data['date'] = date;
    data['size_20'] = size20;
    data['size_30'] = size30;
    data['size_40'] = size40;
    data['size_50'] = size50;
    data['size_60'] = size60;
    data['size_70'] = size70;
    data['size_80'] = size80;
    data['size_90'] = size90;
    data['size_100'] = size100;
    data['size_110'] = size110;
    data['size_120'] = size120;
    data['size_130'] = size130;
    data['size_140'] = size140;
    data['size_150'] = size150;
    data['size_160'] = size160;
    data['size_170'] = size170;
    data['size_180'] = size180;
    data['size_190'] = size190;
    data['size_200'] = size200;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['region_id'] = regionId;
    data['country_id'] = countryId;
    data['currency_id'] = currencyId;
    data['remark'] = remark;
    data['private'] = private;
    data['week'] = week;
    data['occupation'] = occupation;
    data['date_region_full_name'] = dateRegionFullName;
    data['province_id'] = provinceId;
    data['regency_id'] = regencyId;
    data['district_id'] = districtId;
    data['village_id'] = villageId;
    if (region != null) {
      data['region'] = region!.toJson();
    }
    data['creator'] = creator!.toJson();
    return data;
  }
}

class Region {
  String? id;
  String? name;
  String? latitude;
  String? longitude;
  String? countryId;
  String? countryName;
  String? countryNameUppercase;
  String? provinceId;
  String? provinceName;
  String? regencyId;
  String? regencyName;
  String? districtId;
  String? districtName;
  String? villageId;
  String? villageName;
  String? fullName;
  String? nameTranslated;
  String? countryNameTranslated;
  String? countryNameTranslatedUppercase;

  Region(
      {this.id,
      this.name,
      this.latitude,
      this.longitude,
      this.countryId,
      this.countryName,
      this.countryNameUppercase,
      this.provinceId,
      this.provinceName,
      this.regencyId,
      this.regencyName,
      this.districtId,
      this.districtName,
      this.villageId,
      this.villageName,
      this.fullName,
      this.nameTranslated,
      this.countryNameTranslated,
      this.countryNameTranslatedUppercase});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    countryId = json['country_id'];
    countryName = json['country_name'];
    countryNameUppercase = json['country_name_uppercase'];
    provinceId = json['province_id'];
    provinceName = json['province_name'];
    regencyId = json['regency_id'];
    regencyName = json['regency_name'];
    districtId = json['district_id'];
    districtName = json['district_name'];
    villageId = json['village_id'];
    villageName = json['village_name'];
    fullName = json['full_name'];
    nameTranslated = json['name_translated'];
    countryNameTranslated = json['country_name_translated'];
    countryNameTranslatedUppercase = json['country_name_translated_uppercase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['country_id'] = countryId;
    data['country_name'] = countryName;
    data['country_name_uppercase'] = countryNameUppercase;
    data['province_id'] = provinceId;
    data['province_name'] = provinceName;
    data['regency_id'] = regencyId;
    data['regency_name'] = regencyName;
    data['district_id'] = districtId;
    data['district_name'] = districtName;
    data['village_id'] = villageId;
    data['village_name'] = villageName;
    data['full_name'] = fullName;
    data['name_translated'] = nameTranslated;
    data['country_name_translated'] = countryNameTranslated;
    data['country_name_translated_uppercase'] = countryNameTranslatedUppercase;
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

class Creator {
  int? id;
  int? roleId;
  String? name;
  String? email;
  String? avatar;
  bool? emailVerified;
  int? subscriptionTypeId;
  Settings? settings;
  String? createdAt;
  String? updatedAt;
  String? regionId;
  String? lastLoginAt;
  String? expiredAt;
  String? phone;
  bool? phoneVerified;

  Creator(
      {this.id,
      this.roleId,
      this.name,
      this.email,
      this.avatar,
      this.emailVerified,
      this.subscriptionTypeId,
      this.settings,
      this.createdAt,
      this.updatedAt,
      this.regionId,
      this.lastLoginAt,
      this.expiredAt,
      this.phone,
      this.phoneVerified});

  Creator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    emailVerified = json['email_verified'];
    subscriptionTypeId = json['subscription_type_id'];
    settings =
        json['settings'] != null ? Settings.fromJson(json['settings']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    regionId = json['region_id'];
    lastLoginAt = json['last_login_at'];
    expiredAt = json['expired_at'];
    phone = json['phone'];
    phoneVerified = json['phone_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role_id'] = roleId;
    data['name'] = name;
    data['email'] = email;
    data['avatar'] = avatar;
    data['email_verified'] = emailVerified;
    data['subscription_type_id'] = subscriptionTypeId;
    if (settings != null) {
      data['settings'] = settings!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['region_id'] = regionId;
    data['last_login_at'] = lastLoginAt;
    data['expired_at'] = expiredAt;
    data['phone'] = phone;
    data['phone_verified'] = phoneVerified;
    return data;
  }
}

class Settings {
  String? locale;

  Settings({this.locale});

  Settings.fromJson(Map<String, dynamic> json) {
    locale = json['locale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['locale'] = locale;
    return data;
  }
}

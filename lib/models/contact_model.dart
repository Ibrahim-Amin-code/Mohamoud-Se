class ContactModel {
  bool? status;
  String? msg;
  Data? data;

  ContactModel({this.status, this.msg, this.data});

  ContactModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  String? logo;
  String? favicon;
  String? titleAr;
  String? titleEn;
  String? titleKr;
  String? phone;
  String? email;
  String? addressAr;
  String? addressEn;
  String? longitude;
  String? latitude;
  String? descriptionAr;
  String? descriptionEn;
  String? descriptionKr;
  String? privacyAr;
  String? privacyEn;
  String? privacyKr;
  String? termsAr;
  String? termsEn;
  String? termsKr;
  String? agreementsAr;
  String? agreementsEn;
  String? returnAr;
  String? returnEn;
  String? version;
  dynamic createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.logo,
      this.favicon,
      this.titleAr,
      this.titleEn,
      this.titleKr,
      this.phone,
      this.email,
      this.addressAr,
      this.addressEn,
      this.longitude,
      this.latitude,
      this.descriptionAr,
      this.descriptionEn,
      this.descriptionKr,
      this.privacyAr,
      this.privacyEn,
      this.privacyKr,
      this.termsAr,
      this.termsEn,
      this.termsKr,
      this.agreementsAr,
      this.agreementsEn,
      this.returnAr,
      this.returnEn,
      this.version,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    favicon = json['favicon'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    titleKr = json['title_kr'];
    phone = json['phone'];
    email = json['email'];
    addressAr = json['address_ar'];
    addressEn = json['address_en'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
    descriptionKr = json['description_kr'];
    privacyAr = json['privacy_ar'];
    privacyEn = json['privacy_en'];
    privacyKr = json['privacy_kr'];
    termsAr = json['terms_ar'];
    termsEn = json['terms_en'];
    termsKr = json['terms_kr'];
    agreementsAr = json['agreements_ar'];
    agreementsEn = json['agreements_en'];
    returnAr = json['return_ar'];
    returnEn = json['return_en'];
    version = json['version'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

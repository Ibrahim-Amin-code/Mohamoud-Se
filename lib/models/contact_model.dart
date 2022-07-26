class ContactModel {
  bool? status;
  String? msg;
  Data? data;

  ContactModel({this.status, this.msg, this.data});

  ContactModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  String? logo;
  String? favicon;
  String? titleAr;
  String? titleEn;
  String? phone;
  String? email;
  String? addressAr;
  String? addressEn;
  String? longitude;
  String? latitude;
  String? descriptionAr;
  String? descriptionEn;
  String? privacyAr;
  String? privacyEn;
  String? termsAr;
  String? termsEn;
  String? agreementsAr;
  String? agreementsEn;
  String? returnAr;
  String? returnEn;
  String? version;

  Data({
    this.id,
    this.logo,
    this.favicon,
    this.titleAr,
    this.titleEn,
    this.phone,
    this.email,
    this.addressAr,
    this.addressEn,
    this.longitude,
    this.latitude,
    this.descriptionAr,
    this.descriptionEn,
    this.privacyAr,
    this.privacyEn,
    this.termsAr,
    this.termsEn,
    this.agreementsAr,
    this.agreementsEn,
    this.returnAr,
    this.returnEn,
    this.version,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    favicon = json['favicon'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    phone = json['phone'];
    email = json['email'];
    addressAr = json['address_ar'];
    addressEn = json['address_en'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
    privacyAr = json['privacy_ar'];
    privacyEn = json['privacy_en'];
    termsAr = json['terms_ar'];
    termsEn = json['terms_en'];
    agreementsAr = json['agreements_ar'];
    agreementsEn = json['agreements_en'];
    returnAr = json['return_ar'];
    returnEn = json['return_en'];
    version = json['version'];
  }
}

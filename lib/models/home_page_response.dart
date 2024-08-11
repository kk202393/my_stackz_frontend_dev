class HomePageResponse {
  HomePageResponse({
    required this.success,
    required this.message,
    required this.allCategories,
    required this.timeSlot,
  });

  final bool? success;
  final String? message;
  final List<AllCategory> allCategories;
  final List<TimeSlot> timeSlot;

  factory HomePageResponse.fromJson(Map<String, dynamic> json) {
    return HomePageResponse(
      success: json["success"],
      message: json["message"],
      allCategories: json["allCategories"] != null
          ? List<AllCategory>.from(
              json["allCategories"]!.map((x) => AllCategory.fromJson(x)))
          : [],
      timeSlot: json["timeSlot"] != null
          ? List<TimeSlot>.from(
              json["timeSlot"]!.map((x) => TimeSlot.fromJson(x)))
          : [],
    );
  }
}

class AllCategory {
  AllCategory({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.subcategories,
  });

  final String? id;
  final int? categoryId;
  final String? categoryName;
  final List<Subcategory> subcategories;

  factory AllCategory.fromJson(Map<String, dynamic> json) {
    return AllCategory(
      id: json["_id"],
      categoryId: json["category_id"],
      categoryName: json["category_name"],
      subcategories: json["subcategories"] != null
          ? List<Subcategory>.from(
              json["subcategories"]!.map((x) => Subcategory.fromJson(x)))
          : [],
    );
  }
}

class Subcategory {
  Subcategory({
    required this.id,
    required this.subcategoryName,
    required this.subcategory,
    required this.subcategoryId,
    required this.categoryId,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.serviceCategories,
  });

  final String? id;
  final String? subcategoryName;
  final int? subcategory;
  final int? subcategoryId;
  final int? categoryId;
  final double? price;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final List<ServiceCategory> serviceCategories;

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json["_id"],
      subcategoryName: json["subcategory_name"],
      subcategory: json["subcategory"],
      subcategoryId: json["subcategory_id"],
      categoryId: json["category_id"],
      price:
          json["price"] != null ? double.parse(json["price"].toString()) : 0.0,
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      serviceCategories: json["serviceCategories"] != null
          ? List<ServiceCategory>.from(json["serviceCategories"]!
              .map((x) => ServiceCategory.fromJson(x)))
          : [],
    );
  }
}

class ServiceCategory {
  ServiceCategory({
    required this.id,
    required this.servicecategoryName,
    required this.servicecategory,
    required this.servicecategoryId,
    required this.subcategoryId,
    required this.categoryId,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? servicecategoryName;
  final int? servicecategory;
  final int? servicecategoryId;
  final int? subcategoryId;
  final int? categoryId;
  final double? price;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory ServiceCategory.fromJson(Map<String, dynamic> json) {
    return ServiceCategory(
      id: json["_id"],
      servicecategoryName: json["servicecategory_name"],
      servicecategory: json["servicecategory"],
      servicecategoryId: json["servicecategory_id"],
      subcategoryId: json["subcategory_id"],
      categoryId: json["category_id"],
      price:
          json["price"] != null ? double.parse(json["price"].toString()) : 0.0,
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class TimeSlot {
  TimeSlot({
    required this.id,
    required this.slotId,
    required this.timeValue,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final int? slotId;
  final String? timeValue;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      id: json["_id"],
      slotId: json["slot_id"],
      timeValue: json["time_value"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

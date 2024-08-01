class HomePageResponse {
  HomePageResponse({
    required this.success,
    required this.message,
    required this.allCategories,
    required this.timeSlot,
  });

  late final bool success;
  late final String message;
  late final List<AllCategories> allCategories;
  late final List<TimeSlot> timeSlot;

  HomePageResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    allCategories = List.from(json['allCategories'])
        .map((e) => AllCategories.fromJson(e))
        .toList();
    timeSlot =
        List.from(json['timeSlot']).map((e) => TimeSlot.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['allCategories'] = allCategories.map((e) => e.toJson()).toList();
    _data['timeSlot'] = timeSlot.map((e) => e.toJson()).toList();
    return _data;
  }
}

class AllCategories {
  AllCategories({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.subcategories,
  });

  late final String id;
  late final int categoryId;
  late final String categoryName;
  late final List<Subcategories> subcategories;

  AllCategories.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    subcategories = List.from(json['subcategories'])
        .map((e) => Subcategories.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['category_id'] = categoryId;
    _data['category_name'] = categoryName;
    _data['subcategories'] = subcategories.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Subcategories {
  Subcategories({
    required this.id,
    required this.subcategoryName,
    required this.subcategory,
    required this.subcategoryId,
    required this.categoryId,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
    required this.serviceCategory,
  });

  late final String id;
  late final String subcategoryName;
  late final int subcategory;
  late final int subcategoryId;
  late final int categoryId;
  late final dynamic price;
  late final String createdAt;
  late final String updatedAt;
  late final int V;
  late final List<ServiceCategory> serviceCategory;

  Subcategories.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    subcategoryName = json['subcategory_name'];
    subcategory = json['subcategory'];
    subcategoryId = json['subcategory_id'];
    categoryId = json['category_id'];
    price = json['price'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
    serviceCategory = List.from(json['serviceCategory'])
        .map((e) => ServiceCategory.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['subcategory_name'] = subcategoryName;
    _data['subcategory'] = subcategory;
    _data['subcategory_id'] = subcategoryId;
    _data['category_id'] = categoryId;
    _data['price'] = price;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    _data['serviceCategory'] = serviceCategory.map((e) => e.toJson()).toList();
    return _data;
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
    required this.V,
  });

  late final String id;
  late final String servicecategoryName;
  late final int servicecategory;
  late final int servicecategoryId;
  late final int subcategoryId;
  late final int categoryId;
  late final dynamic price;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  ServiceCategory.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    servicecategoryName = json['servicecategory_name'];
    servicecategory = json['servicecategory'];
    servicecategoryId = json['servicecategory_id'];
    subcategoryId = json['subcategory_id'];
    categoryId = json['category_id'];
    price = json['price'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['servicecategory_name'] = servicecategoryName;
    _data['servicecategory'] = servicecategory;
    _data['servicecategory_id'] = servicecategoryId;
    _data['subcategory_id'] = subcategoryId;
    _data['category_id'] = categoryId;
    _data['price'] = price;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}

class TimeSlot {
  TimeSlot({
    required this.id,
    required this.slotId,
    required this.timeValue,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });

  late final String id;
  late final int slotId;
  late final String timeValue;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  TimeSlot.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    slotId = json['slot_id'];
    timeValue = json['time_value'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['slot_id'] = slotId;
    _data['time_value'] = timeValue;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}


class Products{

int? id;
String? title; 
String? description ;
String? category;
num? price; 
num? discountPercentage;
num? rating;
int? stock;
List? tags;
String? brand;
String? sku;
num? weight;
Map<String, dynamic>? dimensions;
String? warrantyInformation;
String? shippingInformation;
String? availabilityStatus;
List? reviews;
String? returnPolicy;
int? minimumOrderQuantity;
List<dynamic>? images;
String? thumbnail;

Products({
  this.id,
this.title, 
this.description ,
this.category,
this.price,
this.discountPercentage,
this.rating,
this.stock,
this.tags,
this.brand,
this.sku,
this.weight,
this.dimensions,
this.warrantyInformation,
this.shippingInformation,
this.availabilityStatus,
this.reviews,
this.returnPolicy,
this.minimumOrderQuantity,
this.images,
this.thumbnail,
});

//from json function
//converts the JSON object to a Product Object
factory Products.fromJson(Map<String, dynamic> json){
  return Products(
    id: json['id'],
    title: json['title'], 
    description: json['description'] ,
    category: json['category'],
    price: json['price'],
    discountPercentage: json['discountPercentage'],
    rating: json['rating'],
    stock: json['stock'],
    tags: json['tags'],
    brand:json['brand'],
    sku: json['sku'],
    weight: json['weight'],
    dimensions:json['dimensions'],
    warrantyInformation:json['warrantyInformation'],
    shippingInformation:json['shippingInformation'],
    availabilityStatus:json['availabilityStatus'],
    reviews:json['reviews'],
    returnPolicy:json['returnPolicy'],
    minimumOrderQuantity:json['minimumOrderQuantity'],
    images:json['images'],
    thumbnail:json['thumbnail'],

  );

}

}
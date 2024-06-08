import 'package:cloud_firestore/cloud_firestore.dart';

class CarModels {
  String name;
  String description;
  String image;
  int price;
  String status;
  String  id;
  bool isFeatured ;
  CarModels({
  required  this.name, 
  required  this.description, 
  required  this.image, 
  required  this.price, 
  required  this.status , 
  required this.isFeatured,
  required this.id});
  static CarModels empty() => CarModels(id: "", name: "", description: "", image: "", price: 0, status: "" , isFeatured:false);

  factory CarModels.fromSnapshot(DocumentSnapshot <Map<String, dynamic>> document) {
   if (document.data() == null) return CarModels.empty();
    final data = document.data()! ;
     return CarModels(
        id: document.id, 
        name: data['name'] ?? '', 
        description: data['description'] ?? '', 
        image: data['image'] ?? '', 
        status: data['status'] ?? '', 
        price: data['price'] ?? 0, 
        isFeatured:data['isFeatured'] ??false ,
        );
   
  }
  

  Map<String, dynamic> toJson() {
    return {
    "name": name,
    "description": description,
    "image": image,
    "price": price,
    "status": status,  
    'isFeatured' : isFeatured
  };
 
}
}
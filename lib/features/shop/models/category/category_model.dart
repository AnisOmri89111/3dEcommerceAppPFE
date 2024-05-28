import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id ; 
  String name ;
  String image; 
  String parentId ;
  bool isFeatured;


  CategoryModel({
    required this.image ,
    required this.id , 
    required this.name,
    this.parentId = '',
    required this.isFeatured ,
  });
  static CategoryModel empty() => CategoryModel(image: '', id: '', name: '' , isFeatured: false);
  Map <String , dynamic> toJson() {
    return {
      'Name' : name,
      'id' : id,
      'image' : image,
      'parentid' : parentId,
      'isFeatured': isFeatured
    };
  }
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String ,dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CategoryModel(
        image: data['image'] ?? '', 
        id: document.id, 
        name: data['name'] ?? '' , 
        parentId: data['parentid'] ??'',
        isFeatured: data['isFeatured'] ?? false
        
        );
    } else {
      return CategoryModel.empty();
    }
  }

}
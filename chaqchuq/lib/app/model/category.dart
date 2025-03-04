


class CategoryModel {
    final int? id;
    final String? image;
    final String? name;

    CategoryModel({required this.id, required this.image, required this.name});


    CategoryModel copyWith({
        int? id,
        String? image,
        String? name,
    }) {
        return CategoryModel(
            id: id ?? this.id, 
            image: image ?? this.image, 
            name: name ?? this.name
        );
    }



    Map<String, dynamic> toJson() {
        return {
            'id': id,
            'image': image,
            'name': name,
        };
    }

    factory CategoryModel.fromJson(Map<String, dynamic> json) {
        return CategoryModel(
            id: json['id'] ?? 0, 
            image: json['image'] ?? "image",
            name: json['name'] ?? "",
        );
    }
}
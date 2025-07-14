class PostsModel {
  final int? id;
  final String? title;
  final num? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  PostsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  PostsModel copyWith({
    int? id,
    String? title,
    num? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) {
    return PostsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }

  PostsModel.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      title = json['title'] as String?,
      price = json['price'] as num?,
      description = json['description'] as String?,
      category = json['category'] as String?,
      image = json['image'] as String?,
      rating = (json['rating'] as Map<String,dynamic>?) != null ? Rating.fromJson(json['rating'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'price' : price,
    'description' : description,
    'category' : category,
    'image' : image,
    'rating' : rating?.toJson()
  };
}

class Rating {
  final num? rate;
  final int? count;

  Rating({
    this.rate,
    this.count,
  });

  Rating copyWith({
    num? rate,
    int? count,
  }) {
    return Rating(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }

  Rating.fromJson(Map<String, dynamic> json)
    : rate = json['rate'] as num?,
      count = json['count'] as int?;

  Map<String, dynamic> toJson() => {
    'rate' : rate,
    'count' : count
  };
}
class Product {
  final String? id;
  final String? name;
  final String? imagePath;
  final String? category;
  final dynamic amount;

  Product({
    this.id,
    this.name,
    this.imagePath,
    this.category,
    this.amount,
    // this.total
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['uuid'],
        name = json['name'],
        imagePath = json['imagePath'],
        category = json['category'],
        amount = json['amount'];

  Map<String, dynamic> toJson() =>
      {'uuid': id, 'name': name, 'imagePath': imagePath, 'category': category, 'amount': amount};
}

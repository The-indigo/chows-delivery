class Cart {
  String? id;
  String? userId;
  final String? name;
  final String? imagePath;
  dynamic amount;
  int? quantity;
  dynamic total;

  Cart({
    this.id,
    this.userId,
    this.name,
    this.imagePath,
    this.amount,
    this.quantity,
    this.total,
  });

  Cart.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        name = json['name'],
        imagePath = json['imagePath'],
        amount = json['amount'],
        quantity = json['quantity'],
        total = json['total'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'name': name,
        'imagePath': imagePath,
        'quantity': quantity,
        'amount': amount,
        'total': total
      };
}

import 'package:hive/hive.dart';
part 'book.g.dart';
@HiveType(typeId: 0)
class CartBook extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String imageAssetPath;

  @HiveField(2)
  double price;

  @HiveField(3)
  int quantity;

  CartBook({
    required this.title,
    required this.imageAssetPath,
    required this.price,
    this.quantity = 1,
  });
}

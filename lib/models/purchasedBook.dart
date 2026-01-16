import 'package:hive/hive.dart';
part 'purchasedBook.g.dart';
@HiveType(typeId: 1)
class PurchasedBook extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String imageAssetPath;

  @HiveField(2)
  double price;

  @HiveField(3)
  int quantity;

  @HiveField(4)
  String userEmail; 

  PurchasedBook({
    required this.title,
    required this.imageAssetPath,
    required this.price,
    required this.quantity,
    required this.userEmail, 
  });
}

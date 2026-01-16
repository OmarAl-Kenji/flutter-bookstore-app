import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/StartPages/firstpage.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/models/book.dart';
import 'box.dart';
import 'package:myapp/models/purchasedBook.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(CartBookAdapter());
  Hive.registerAdapter(PurchasedBookAdapter());

  BoxUSER = await Hive.openBox<User>('myUser');
  await Hive.openBox<CartBook>('cartBox');
  await Hive.openBox<PurchasedBook>('purchasedBooks');

  /*await Hive.box<User>('myUser').clear();
  await Hive.box<CartBook>('cartBox').clear();
  await Hive.box<PurchasedBook>('purchasedBooks').clear();
 */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Books',
      home: Scaffold(body: FirstPage()),
    );
  }
}

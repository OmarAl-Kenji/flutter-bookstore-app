import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 2)
class User {
  User({
    required this.Fname,
    required this.Fpassword,
    required this.Femail,
    required this.Fid,
    
  });
  @HiveField(0)
  String Fname;
  @HiveField(1)
  String Fpassword;
  @HiveField(2)
  String Femail;
  @HiveField(3)
  List<int> Fid;

}

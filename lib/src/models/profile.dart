import 'moviefirst.dart';

class Profile extends IMovie {
  String nameA;
  String imgA;
  Profile({
    required String name,
    required String img,
    required int start,
    required dynamic profile,
    required this.nameA,
    required this.imgA,
  }) : super(name, img, start, profile);
}

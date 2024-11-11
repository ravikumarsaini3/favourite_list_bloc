import 'package:favourite_list/listmodel/listmodel.dart';

class Favouritelistrepo {
  Future<List<Listmodel>> fetchfavouritelist() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.generate(
      20,
      (index) => Listmodel(id: index.toString(), value: 'Ravi saini $index'),
    );
  }
}

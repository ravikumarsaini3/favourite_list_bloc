import 'package:equatable/equatable.dart';
import 'package:favourite_list/listmodel/listmodel.dart';

enum Liststuts { loading, success, failure }

class Favouriteblocstate extends Equatable {
  final List<Listmodel> favouritelist;
  final List<Listmodel> tempfavouritelist;
  final Liststuts liststuts;

  const Favouriteblocstate(
      {this.favouritelist = const [],
      this.tempfavouritelist = const [],
      this.liststuts = Liststuts.loading});
  Favouriteblocstate copyWith(
      {List<Listmodel>? favouritelist,
      List<Listmodel>? tempfavouritelist,
      Liststuts? liststuts}) {
    return Favouriteblocstate(
        favouritelist: favouritelist ?? this.favouritelist,
        tempfavouritelist: tempfavouritelist ?? this.tempfavouritelist,
        liststuts: liststuts ?? this.liststuts);
  }

  @override
  List<Object?> get props => [favouritelist, liststuts, tempfavouritelist];
}

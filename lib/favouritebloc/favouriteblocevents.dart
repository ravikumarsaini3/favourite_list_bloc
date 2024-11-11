import 'package:equatable/equatable.dart';
import 'package:favourite_list/listmodel/listmodel.dart';

abstract class Favouriteblocevents extends Equatable {
  const Favouriteblocevents();
  @override
  List<Object?> get props => [];
}

class FetchFavouriteList extends Favouriteblocevents {}

class selecttemp extends Favouriteblocevents {
  final Listmodel item;
  const selecttemp({required this.item});
  @override
  List<Object?> get props => [item];
}

class DeleteItem extends Favouriteblocevents {
  @override
  List<Object?> get props => [];
}

class unselecttemp extends Favouriteblocevents {
  final Listmodel item;
  const unselecttemp({required this.item});
  @override
  List<Object?> get props => [item];
}

class Fetchitem extends Favouriteblocevents {
  final Listmodel item;
  const Fetchitem(this.item);
  @override
  List<Object?> get props => [item];
}

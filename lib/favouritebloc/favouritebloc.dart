import 'package:bloc/bloc.dart';
import 'package:favourite_list/favouritebloc/favouriteblocevents.dart';
import 'package:favourite_list/favouritebloc/favouriteblocstate.dart';
import 'package:favourite_list/listmodel/listmodel.dart';

import '../repositiory/favouritelistrepo.dart';

class Favouritebloc extends Bloc<Favouriteblocevents, Favouriteblocstate> {
  List<Listmodel> favlist = [];
  List<Listmodel> tempfavlist = [];
  Favouritelistrepo favlistrepo = Favouritelistrepo();
  Favouritebloc(favlistrepo) : super(const Favouriteblocstate()) {
    on<FetchFavouriteList>(fetchlist);
    on<Fetchitem>(fetchfavitom);
    on<selecttemp>(_selecttemp);
    on<unselecttemp>(_unselecttemp);
    on<DeleteItem>(_deleteitem);
  }
  void fetchlist(
      FetchFavouriteList events, Emitter<Favouriteblocstate> emit) async {
    favlist = await favlistrepo.fetchfavouritelist();

    emit(state.copyWith(
        favouritelist: List.from(favlist), liststuts: Liststuts.success));
  }

  void fetchfavitom(Fetchitem event, Emitter<Favouriteblocstate> emit) async {
    int index = favlist.indexWhere(
      (element) => element.id == event.item.id,
    );
    if (event.item.isfavourite) {
      if (tempfavlist.contains(favlist[index])) {
        tempfavlist.remove(favlist[index]);
        tempfavlist.add(event.item);
      }
    } else {
      if (tempfavlist.contains(favlist[index])) {
        tempfavlist.remove(favlist[index]);
        tempfavlist.add(event.item);
      }
    }
    favlist[index] = event.item;

    emit(state.copyWith(
        favouritelist: List.of(favlist),
        tempfavouritelist: List.of(tempfavlist)));
  }

  void _deleteitem(DeleteItem event, Emitter<Favouriteblocstate> emit) {
    for (int i = 0; i < tempfavlist.length; i++) {
      favlist.remove(tempfavlist[i]);
    }
    tempfavlist.clear();
    emit(state.copyWith(
        favouritelist: List.of(favlist),
        tempfavouritelist: List.of(tempfavlist)));
  }

  void _selecttemp(selecttemp event, Emitter<Favouriteblocstate> emit) {
    tempfavlist.add(event.item);
    emit(state.copyWith(tempfavouritelist: List.of(tempfavlist)));
  }

  void _unselecttemp(unselecttemp event, Emitter<Favouriteblocstate> emit) {
    tempfavlist.remove(event.item);
    emit(state.copyWith(tempfavouritelist: List.of(tempfavlist)));
  }
}

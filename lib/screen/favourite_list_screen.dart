import 'package:favourite_list/favouritebloc/favouritebloc.dart';
import 'package:favourite_list/favouritebloc/favouriteblocevents.dart';
import 'package:favourite_list/favouritebloc/favouriteblocstate.dart';
import 'package:favourite_list/listmodel/listmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteListScreen extends StatefulWidget {
  const FavouriteListScreen({super.key});

  @override
  State<FavouriteListScreen> createState() => _FavouriteListScreenState();
}

class _FavouriteListScreenState extends State<FavouriteListScreen> {
  @override
  void initState() {
    context.read<Favouritebloc>().add(FetchFavouriteList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
        appBar: AppBar(
          actions: [
            BlocBuilder<Favouritebloc, Favouriteblocstate>(
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      context.read<Favouritebloc>().add(DeleteItem());
                    },
                    icon: Visibility(
                      visible:
                          state.tempfavouritelist.isNotEmpty ? true : false,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ));
              },
            )
          ],
          title: const Text('Favourite List'),
        ),
        body: BlocBuilder<Favouritebloc, Favouriteblocstate>(
          builder: (context, state) {
            switch (state.liststuts) {
              case Liststuts.loading:
                return const Center(child: CircularProgressIndicator());
              case Liststuts.failure:
                return Center(
                    child: Container(
                  child: const Text('Something Went Wrong '),
                ));
              case Liststuts.success:
                return ListView.builder(
                  itemCount: state.favouritelist.length,
                  itemBuilder: (context, index) {
                    var item = state.favouritelist[index];
                    return ListTile(
                      title: Text(item.value.toString()),
                      trailing: InkWell(
                        onTap: () {
                          Listmodel listmodel = Listmodel(
                              id: item.id.toString(),
                              value: item.value,
                              isfavourite: item.isfavourite ? false : true);

                          context
                              .read<Favouritebloc>()
                              .add(Fetchitem(listmodel));
                        },
                        child: Icon(item.isfavourite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined),
                      ),
                      leading: Checkbox(
                        value: state.tempfavouritelist.contains(item)
                            ? true
                            : false,
                        onChanged: (value) {
                          if (value!) {
                            context
                                .read<Favouritebloc>()
                                .add(selecttemp(item: item));
                          } else {
                            context
                                .read<Favouritebloc>()
                                .add(unselecttemp(item: item));
                          }
                        },
                      ),
                    );
                  },
                );

              default:
                return Container();
            }
          },
        ));
  }
}

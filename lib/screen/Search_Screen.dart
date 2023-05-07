import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/app_blocs.dart';
import '../model/userDetails.dart';

class Search extends SearchDelegate {
  late List<UserDetails> UserDetail;

  @override
  String get searchFieldLabel => 'Search User';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      inputDecorationTheme: searchFieldDecorationTheme ??
          const InputDecorationTheme(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
          ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 249, 186, 61),
      ),
      textTheme: const TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 18,
          decorationThickness: 0.00000001,
        ),
      ),
    );
  }

  Search({required this.UserDetail});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(
          Icons.close,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void SelectHandler(BuildContext ctx, String id, String name) {
    Navigator.of(ctx).pushNamed(
      "/OneUser",
      arguments: {
        'id': id,
        'name': name,
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<UserDetails> userDetails = query.isEmpty
        ? []
        : UserDetail.where(
                    (p) => p.name.toLowerCase().contains(query.toLowerCase()))
                .toList() +
            UserDetail.where((p) =>
                    p.companyName.toLowerCase().contains(query.toLowerCase()))
                .toList() +
            UserDetail.where((p) => p.id == query).toList();
    var seen = Set<UserDetails>();
    List<UserDetails> uniquelist =
        userDetails.where((user) => seen.add(user)).toList();
    UserDetail = uniquelist;

    return UserDetail.isEmpty
        ? Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color.fromARGB(127, 249, 186, 61),
            child: const Center(
              child: Text(
                "No Users found!",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          )
        : Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color.fromARGB(127, 249, 186, 61),
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => SelectHandler(
                      context, UserDetail[index].id, UserDetail[index].name),
                  splashColor: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.black,
                    elevation: 10,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(
                                child: SizedBox(
                                  width: 50,
                                  child: Text(
                                    UserDetail[index].id,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${UserDetail[index].name}\n",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      UserDetail[index].companyName,
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(127, 249, 186, 61),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                alignment: Alignment.topCenter,
                                margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      BlocProvider.of<UserBloc>(context)
                                          .deleteUser(
                                              int.parse(UserDetail[index].id));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder(),
                                        padding: const EdgeInsets.all(10),
                                        primary: Colors.transparent),
                                    child: Icon(
                                      Icons.delete,
                                      color: Color.fromARGB(255, 10, 181, 161),
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: UserDetail.length,
            ),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color.fromARGB(127, 249, 186, 61),
      child: const Center(
        child: Text(
          "Search User",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

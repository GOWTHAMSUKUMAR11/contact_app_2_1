import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/blocs/app_blocs.dart';
import 'package:user/blocs/app_states.dart';
import 'package:user/repos/repositories.dart';
import 'package:user/model/userDetails.dart';
import 'package:user/screen/Search_Screen.dart';
import 'package:user/widgets/SortDetailSheet.dart';

import '../widgets/NewContact.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => UserListState();
}

class UserListState extends State<UserList> {
  late List<UserDetails> _userDetails;
  bool valueName = false;
  bool valueId = true;
  bool valueCompanyName = false;

  // ignore: non_constant_identifier_names
  void SelectHandler(BuildContext ctx, id, name) {
    Navigator.of(ctx).pushNamed(
      "/OneUser",
      arguments: {
        'id': id,
        'name': name,
      },
    );
  }

  void searchAndFilter(context) {
    showSearch(
      context: context,
      delegate: Search(UserDetail: _userDetails),
    );
  }

  void sort(bool vName, bool vId, bool vCompanyName) {
    setState(() {
      valueName = vName;
      valueId = vId;
      valueCompanyName = vCompanyName;
    });
  }

  void sortDetails(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return SortDetails(
          valueName: valueName,
          valueId: valueId,
          valueCompanyName: valueCompanyName,
          sort: sort,
        );
      },
    );
  }

  void _addNewContact(
      String enteredname,
      String enteredusername,
      String enteredemail,
      String enteredaddress,
      String enteredphone,
      String enteredwebsite,
      String enteredcompany) {
    print(enteredaddress);
    UserDetails new_user = UserDetails(
      id: "-1",
      name: enteredname,
      username: enteredusername,
      email: enteredemail,
      address: enteredaddress,
      phone: enteredphone,
      website: enteredwebsite,
      companyName: enteredcompany,
    );

    BlocProvider.of<UserBloc>(context).addUser(new_user);
  }

  void _startAddNewContact(BuildContext ctx) {
    showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewContact(
            addTx: _addNewContact,
            name: "",
            username: "",
            email: "",
            phone: "",
            address: "",
            website: "",
            company: "",
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("LiveMe"),
        backgroundColor: const Color.fromARGB(255, 249, 186, 61),
        actions: [
          IconButton(
            onPressed: () {
              _startAddNewContact(context);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        _userDetails = state.users;
        if (valueId) {
          _userDetails.sort((a, b) {
            int num1 = int.parse(a.id);
            int num2 = int.parse(b.id);
            if (num1 > num2) {
              return 1;
            } else if (num1 < num2) {
              return -1;
            } else {
              if (valueName) {
                int sortvalue = a.name.compareTo(b.name);
                if (sortvalue == 0 && valueCompanyName) {
                  return a.companyName.compareTo(b.companyName);
                }
                return sortvalue;
              }
              return 0;
            }
          });
        }
        if (!valueId && valueName) {
          _userDetails.sort((a, b) {
            int sortvalue = a.name.compareTo(b.name);
            if (sortvalue == 0 && valueCompanyName) {
              return a.companyName.compareTo(b.companyName);
            }
            return sortvalue;
          });
        }
        if (!valueId && !valueName && valueCompanyName) {
          _userDetails.sort((a, b) => a.companyName.compareTo(b.companyName));
        }
        return Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height * 7 / 100,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 249, 186, 61),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        splashColor: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          sortDetails(context);
                        },
                        child: Container(
                          width: width * 50 / 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 0.1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  sortDetails(context);
                                },
                                icon: const Icon(
                                  Icons.sort,
                                ),
                                color: Colors.white,
                              ),
                              const Text(
                                "Sort",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        onTap: () => searchAndFilter(context),
                        child: Container(
                          width: width * 50 / 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 0.1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () => searchAndFilter(context),
                                icon: const Icon(
                                  Icons.filter_list,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                "Filter",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: height * 90 / 100,
                  color: const Color.fromARGB(127, 249, 186, 61),
                  padding: EdgeInsets.fromLTRB(height * 0.7 / 100,
                      height * 0.7 / 100, height * 0.7 / 100, height * 9 / 100),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => SelectHandler(context,
                            _userDetails[index].id, _userDetails[index].name),
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
                                          _userDetails[index].id,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${_userDetails[index].name}\n",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                          Text(
                                            _userDetails[index].companyName,
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  127, 249, 186, 61),
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
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 10, 10, 0),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            BlocProvider.of<UserBloc>(context)
                                                .deleteUser(int.parse(
                                                    _userDetails[index].id));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: const CircleBorder(),
                                              padding: const EdgeInsets.all(10),
                                              primary: Colors.transparent),
                                          child: Icon(
                                            Icons.delete,
                                            color: Color.fromARGB(
                                                255, 10, 181, 161),
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
                    itemCount: _userDetails.length,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

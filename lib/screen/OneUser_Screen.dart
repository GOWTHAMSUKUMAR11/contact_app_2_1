import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/widgets/CardUser.dart';
import 'package:user/model/userDetails.dart';

import '../blocs/app_blocs.dart';
import '../blocs/app_states.dart';
import '../repos/repositories.dart';
import '../widgets/NewContact.dart';

// ignore: must_be_immutable
class OneUser extends StatefulWidget {
  OneUser({super.key});

  @override
  State<OneUser> createState() => _OneUserState();
}

class _OneUserState extends State<OneUser> {
  late List<UserDetails> userDetails;
  late int id1;
  static const routeName = '/oneUser';

  void _modifyContact(
    String enteredname,
    String enteredusername,
    String enteredemail,
    String enteredaddress,
    String enteredphone,
    String enteredwebsite,
    String enteredcompany,
  ) {
    UserDetails new_user = UserDetails(
        id: id1.toString(),
        name: enteredname,
        username: enteredusername,
        email: enteredemail,
        address: enteredaddress,
        phone: enteredphone,
        website: enteredwebsite,
        companyName: enteredcompany);

    BlocProvider.of<UserBloc>(context).modifyUser(id1, new_user);
  }

  void _startmodifyContact(
      BuildContext ctx,
      String name,
      String username,
      String email,
      String phone,
      String address,
      String website,
      String company) {
    showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewContact(
              addTx: _modifyContact,
              name: name,
              username: username,
              email: email,
              phone: phone,
              address: address,
              website: website,
              company: company),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArguments = ModalRoute.of(context)!.settings.arguments as Map;
    late UserDetails userDetails;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details - ${routeArguments["name"]}",
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 249, 186, 61),
        actions: [
          IconButton(
            onPressed: () {
              _startmodifyContact(
                context,
                userDetails.name,
                userDetails.username,
                userDetails.email,
                userDetails.phone,
                userDetails.address,
                userDetails.website,
                userDetails.companyName,
              );
            },
            icon: Icon(Icons.edit),
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        int id = int.parse(routeArguments["id"]);
        id1 = id;
        int index = 0;
        for (UserDetails x in state.users) {
          if (int.parse(x.id) == id) {
            userDetails = x;
            break;
          }
          index++;
        }
        return Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color.fromARGB(127, 249, 186, 61),
          padding: const EdgeInsets.all(10),
          child: CardUser(userDetails),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';

class NewContact extends StatefulWidget {
  Function addTx;
  String name;
  String email;
  String address;
  String phone;
  String website;
  String company;
  String username;

  NewContact({
    required this.addTx,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.website,
    required this.company,
    required this.username,
  });

  @override
  _NewContactState createState() => _NewContactState(
      name: this.name,
      email: this.email,
      address: this.address,
      phone: this.phone,
      website: this.website,
      company: this.company,
      username: this.username);
}

class _NewContactState extends State<NewContact> {
  String name;
  String email;
  String address;
  String phone;
  String website;
  String company;
  String username;

  _NewContactState({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.website,
    required this.company,
    required this.username,
  });

  late final _nameController = TextEditingController(text: name);
  late final _emailController = TextEditingController(text: email);
  late final _addressController = TextEditingController(text: address);
  late final _phoneController = TextEditingController(text: phone);
  late final _websiteController = TextEditingController(text: website);
  late final _companyController = TextEditingController(text: company);
  late final _usernameController = TextEditingController(text: username);

  void _submitData() {
    final enteredname = _nameController.text;
    final enteredemail = _emailController.text;
    final enteredaddress = _addressController.text;
    final enteredphone = _phoneController.text;
    final enteredwebsite = _websiteController.text;
    final enteredcompany = _companyController.text;
    final enteredusername = _usernameController.text;

    widget.addTx(enteredname, enteredusername, enteredemail, enteredaddress,
        enteredphone, enteredwebsite, enteredcompany);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        height: double.tryParse('490'),
        decoration: BoxDecoration(
          color: const Color.fromARGB(127, 249, 186, 61),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                  border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                ),
                controller: _nameController,
                style: TextStyle(color: Color.fromARGB(255, 255, 170, 0)),
              ),
            ),
            Container(
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'UserName',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                  border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                ),
                controller: _usernameController,
                style: TextStyle(color: Color.fromARGB(255, 255, 170, 0)),
              ),
            ),
            Container(
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                  border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                ),
                controller: _emailController,
                style: TextStyle(color: Color.fromARGB(255, 255, 170, 0)),
              ),
            ),
            Container(
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Phone number',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                  border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                ),
                controller: _phoneController,
                style: TextStyle(color: Color.fromARGB(255, 255, 170, 0)),
              ),
            ),
            Container(
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Address',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                  border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                ),
                controller: _addressController,
                style: TextStyle(color: Color.fromARGB(255, 255, 170, 0)),
              ),
            ),
            Container(
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Website',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                  border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                ),
                controller: _websiteController,
                style: TextStyle(color: Color.fromARGB(255, 255, 170, 0)),
              ),
            ),
            Container(
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Company',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                  border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 170, 0)),
                  ),
                ),
                controller: _companyController,
                style: TextStyle(color: Color.fromARGB(255, 255, 170, 0)),
              ),
            ),
            ElevatedButton(
              child: Text('Add'),
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 249, 186, 61),
                foregroundColor: Colors.white,
              ),
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}

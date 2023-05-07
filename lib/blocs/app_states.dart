// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:user/model/userDetails.dart';

@immutable
class UserState {
  List<UserDetails> users;

  UserState(this.users);

  @override
  List<Object?> get props => [];
}

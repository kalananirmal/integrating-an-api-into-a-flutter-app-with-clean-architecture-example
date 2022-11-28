import 'package:Users/models/user.dart';
import 'package:Users/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class UserDetail extends StatefulWidget {
  User user;
   UserDetail({Key? key, required this.user}) : super(key: key);

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
            child: Column(
              children: [
                DetailTextField(label: 'Last Name', value: widget.user.lastname.toUpperCase()),
                DetailTextField(label: 'Date Of Birth', value: widget.user.dob,),
                DetailTextField(label: 'Address', value: widget.user.address),
                DetailTextField(label: 'Email', value: widget.user.email),
                DetailTextField(label: 'Mobile', value: widget.user.mobile),
              ],
            ),
        ),

      ),
    );
  }
}

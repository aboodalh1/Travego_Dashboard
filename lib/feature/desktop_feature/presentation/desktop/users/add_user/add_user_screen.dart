import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Users.dart';

class UserFormPage extends StatefulWidget {


  const UserFormPage({super.key});

  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit & Add User'),
        actions: [
          IconButton(
              icon: const Icon(Icons.save),
              onPressed: (){
                Provider.of<UserProvider>(context, listen: false).addUser(
                  username: usernameController.text,
                  email: emailController.text,
                  first_name: firstNameController.text,
                  last_name: lastNameController.text,
                  password: passwordController.text,
                  phone_number: phoneNumberController.text,
                  confirmation_password: confirmPasswordController.text,
                );
              }
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(

                decoration: const InputDecoration(labelText: 'First name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter First name';
                  }
                  return null;
                },
                controller: firstNameController,
              ),
              TextFormField(

                decoration: const InputDecoration(labelText: 'Last name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Last name';
                  }
                  return null;
                },
                controller: lastNameController,
              ), TextFormField(

                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an Username';
                  }
                  return null;
                },
                controller: usernameController,
              ), TextFormField(

                decoration: const InputDecoration(labelText: 'Phone'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a Phone number';
                  }
                  return null;
                },
                controller: phoneNumberController,
              ), TextFormField(

                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
                controller: emailController,
              ),
              TextFormField(

                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an password';
                  }
                  return null;
                },
                controller: passwordController,
              ),
              TextFormField(

                decoration: const InputDecoration(labelText: 'Confirmation Password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your password';
                  }
                  return null;
                },
                controller: confirmPasswordController,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

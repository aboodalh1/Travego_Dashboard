import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travego_dashboard/Dio/dioHelper.dart';
import 'package:travego_dashboard/shared/constant/constant.dart';

import '../../shared/component/component.dart';
import 'SureAlertDialog.dart';
import 'add_user/add_user_screen.dart';




class UserProvider with ChangeNotifier {

  void addUser({required first_name,required last_name,required username,required phone_number,required email,required password,required confirmation_password}) {
    DioHelper.postData(url: 'Auth/Manager/Create_CLient', data: {
      "first_name": first_name,
      "last_name": last_name,
      "username": username,
      "phone_number": phone_number,
      "email": email,
      "password": password,
      "confirmation_password": confirmation_password
    }).then((value) {
      getClient();
      showToast(text: value.data['message'], state: ToastStates.SUCCESS);

    }).catchError((e) {
      showToast(text: e.response?.data['message'], state: ToastStates.ERROR);
    });
  }

  void updateUser(String id) {

    }

  void deleteUser(context,{required num id,required String email}) {
    showDialog(context: context, builder: (context)=>Sure_Alert_Dialog(id:id,email:email));

  }



}


class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const UserFormPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('User Name', style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text('User Email', style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Center(child: Text('Is Active', style: TextStyle(fontWeight: FontWeight.bold)))),
              ],
            ),
          ),
          Expanded(
            child: Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                return ListView.builder(
                  itemCount: allClientModel!.body!.content!.length,
                  itemBuilder: (context, index) {

                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text("${allClientModel!.body!.content![index].firstName} ${allClientModel!.body!.content![index].lastName}" )),
                          Expanded(child: Text(allClientModel!.body!.content![index].email!)),

                        ],
                      ),
                      onTap: () {

                      },
                      onLongPress: () {
                        userProvider.deleteUser(
                            id:allClientModel!.body!.content![index].id!,
                            email:allClientModel!.body!.content![index].email!,
                            context);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  

  }
}

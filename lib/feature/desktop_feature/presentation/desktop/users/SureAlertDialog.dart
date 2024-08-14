import 'package:flutter/material.dart';
import '../../../../../Dio/dioHelper.dart';
import '../../../../../shared/component/component.dart';
import '../../../../../shared/constant/constant.dart';

class Sure_Alert_Dialog extends StatelessWidget {
  num? id;
  String? email;
  Sure_Alert_Dialog({super.key, this.id, this.email}) {
    this.id = id;
    this.email = email;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 100,
        width: 200,
        child: Column(
          children: [
            Text('Are you sure you want to delete this user?'),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('No')),
                TextButton(
                    onPressed: () {
                      DioHelper.deleteData(
                          path: 'Auth/Manager/Delete_CLient',
                          token: token,
                          query: {"id": id, "email": email}).then((value) {
                        showToast(
                            text: value.data['message'],
                            state: ToastStates.SUCCESS);
                      }).catchError((e) {
                        showToast(
                            text: e.response?.data['message'],
                            state: ToastStates.ERROR);
                      });
                      getClient();
                      Navigator.of(context).pop();
                    },
                    child: Text('Yes')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

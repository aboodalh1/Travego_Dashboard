import 'package:travego_dashboard/models/get_all_client/all_client_model.dart';
import 'package:travego_dashboard/models/user_model.dart';

import '../../Dio/dioHelper.dart';
import '../component/component.dart';

String ? token;
UserModel ? userModel;
AllClientModel? allClientModel;

void getClient(){
  DioHelper.getData(path: 'Auth/Manager/Get_AllClient',token: token).then((value) {
    allClientModel = AllClientModel.fromJson(value.data);
    showToast(text: value.data['message'], state: ToastStates.SUCCESS);
  });
}
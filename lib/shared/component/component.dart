import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
Widget DefaultIconButton(
        {required void Function() function,
        required String label,
        required Icon icon}) =>
    Container(
      decoration: BoxDecoration(
          gradient:
          LinearGradient(colors: [Color.fromARGB( 150,51, 102, 204) , Color.fromARGB(255, 51, 102, 204),]),
          borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      height: 50,
      child: MaterialButton(
        onPressed: function,
        child: Row(children: [
          icon,
          SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );

Widget dividerWidget() => Container(
      width: double.infinity,
      height: 1,
      color: Colors.white30,
    );

Widget DefaultButton(
        {required void Function() function, required String label, context}) =>
    Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color.fromARGB( 150,51, 102, 204) , Color.fromARGB(255, 51, 102, 204),]),
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      height: 47,
      alignment: AlignmentDirectional.center,
      width: 300,
      child: MaterialButton(
        onPressed: function,
        child: Container(
            width: double.infinity,
            alignment: AlignmentDirectional.center,
            child: Text(
              "$label",
              style: TextStyle(
                color: Colors.white
              ),
            )),
      ),
    );

void showToast({
  required String text,
  required ToastStates state,
})=>   Fluttertoast.showToast(
    msg: text ,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: chooseToastColor(state: state),
    textColor: Colors.white,
    fontSize: 16.0
);
Widget DefaultShadowFormField(
    {
  required String hintText,
  required TextEditingController controller,
      required dynamic validator,
      IconButton ? icon,
      double width = 300,
      double height = 50,
      bool isIcon = false,
      bool isSecure = false,
    }

)=> TextFormField(
  obscureText: isSecure,
  validator: validator,
    controller: controller ,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      suffixIcon: icon,
      prefixIcon: isIcon ? Padding(
        padding: const EdgeInsets.only(
          left: 17.23,
          bottom: 22,
          right: 20,
        ),
        child: icon,
      ) : null,
      hintText: hintText,
    ));


enum ToastStates { SUCCESS, ERROR, WARNING }
Color chooseToastColor({required ToastStates state}) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
enum StateColor { Pending,Done, Preparing, In_Progress }
Color chooseStateColor({required StateColor state}) {
  Color color;
  switch (state) {
    case StateColor.Pending:
      color = Colors.blue;
      break;
    case StateColor.Done:
      color = Colors.green;
      break;
    case StateColor.In_Progress:
      color = Colors.red;
      break;
    case StateColor.Preparing:
      color = Colors.amber;
      break;
  }
  return color;
}
void navigateTo (context, widget) =>Navigator.push(context, MaterialPageRoute(builder: (context)=> widget,),
);
void navigateAndFinish (context, widget) =>Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(
  builder: (context)=> widget,),
        (route) =>false
);
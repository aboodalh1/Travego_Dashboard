// ignore_for_file: prefer_const_constructors

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travego_dashboard/desktop/provider.dart';


class Addtrip extends StatefulWidget {
  const Addtrip({super.key});

  @override
  State<Addtrip> createState() => _AddtripState();
}

class _AddtripState extends State<Addtrip> {
   DateTime startTime= DateTime(2024);
   DateTime exTime =DateTime(2024);
  String finishtime = '';
  int companyid = 0;
  int categoryid = 0;
  int stock = 20 ;
  String comname = '';
  String sinname = '';
  String price = '';
  String des = '';
  bool isloading = false;
  bool companyloading = false ;
  final GlobalKey<FormState> _formkey = GlobalKey();
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration.zero, () async{
     
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return ListView(
  children: [
    AlertDialog(
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.99,
        child: Form(
          key: _formkey,
          child: isloading==false?  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 90,
                    height: 100,
                    margin: EdgeInsets.only(right: 17),
                    child: Image.asset(
                      'assets/images/travel.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Text(
                    'Create Trip : ',
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'RobotoCondensed',
                      color: Color.fromARGB(219, 14, 179, 255),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'X',
                        style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 1, 43, 121),),
                      ))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.17,
                child: Row(
                  children: [
                    SizedBox(
                      height: 200,
                      width: 150,
                      child: Center(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            SizedBox(
                              height: 200,
                              width: 150,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // SizedBox(
                                  //   height: 160,
                                  //   width: 150,
                                  //   child: Image.asset(
                                  //     'assets/images/border.png',
                                  //     fit: BoxFit.fitWidth,
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 70,
                                    width: 70,
                                    child: Image.asset(
                                      'assets/images/pic.png',
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 20),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Colors.grey.withOpacity(0.2)),
                                    child: const Icon(
                                      Icons.add,
                                      color: Color.fromARGB(255, 0, 118, 173),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 200,
                      width: 300,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top:15),
                            height: 60,
                            width: 280,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: ' Name of Trip',
                                  labelStyle:  TextStyle(
                                      color: Color.fromARGB(219, 14, 179, 255).withOpacity(0.6), fontSize: 18),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 1, 43, 121),
                                  )),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 1, 43, 121),
                                      width: 1.4,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromARGB(255, 1, 43, 121), width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(8.0))),
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Trip Name is Empty ';
                                } else{ return null;}
                              },
                              onSaved: (newValue) {
                                comname = newValue!;
                              },
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(top: 10),
                          //   height: 60,
                          //   width: 280,
                          //   //  color: Colors.blue,
                          //   child: TextFormField(
                          //     decoration: InputDecoration(
                          //         labelText: '',
                          //         labelStyle:  TextStyle(
                          //             color: Color.fromARGB(219, 14, 179, 255).withOpacity(0.6), fontSize: 18),
                          //         focusedBorder: const OutlineInputBorder(
                          //             borderSide: BorderSide(
                          //           color: Color.fromARGB(255, 1, 43, 121),
                          //         )),
                          //         enabledBorder: OutlineInputBorder(
                          //           borderSide: const BorderSide(
                          //             color: Color.fromARGB(255, 1, 43, 121),
                          //             width: 1.4,
                          //           ),
                          //           borderRadius: BorderRadius.circular(30),
                          //         ),
                          //         border: OutlineInputBorder(
                          //             borderSide: const BorderSide(
                          //                 color: Color.fromARGB(255, 1, 43, 121), width: 2.0),
                          //             borderRadius:
                          //                 BorderRadius.circular(8.0))),
                          //     validator: (val) {
                          //       if (val == null || val.isEmpty) {
                          //         return 'scientific Name is Empty ';
                          //       } else{ return null;}
                          //     },
                          //     onSaved: (newValue) {
                          //       sinname = newValue!;
                          //     },
                          //     keyboardType: TextInputType.text,
                          //   ),
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 20 , right: 20 ),
                   alignment: Alignment.center,
                  width: double.infinity,
                  height: 15,
                  child: const DottedLine(
                    lineThickness: 2,
                    direction: Axis.horizontal,
                    dashLength: 10,
                    lineLength: double.infinity,
                    dashColor: Color.fromARGB(255, 1, 43, 121),
                  
                  )),


                  
              Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    InkWell(
                       onTap: () {
                        // showDialog(
                        //     context: context,
                        //     builder: (ctx) => Comdialog()).then((value) {
                        //       setState(() {
                        //         companyid = value;
                        //       });
                        //     });
                      },
                      child: SizedBox(
                          height: 60,
                          width: 160,
                          child: Card(
                            shadowColor: Color.fromARGB(184, 14, 179, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            elevation: 4,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 25,
                                    child: Image.asset(
                                      'assets/images/addcom.png',
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Country',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'RobotoCondensed',
                                      color: Color.fromARGB(255, 1, 43, 121),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    SizedBox(width: 5,),
                    InkWell(
                       onTap: () {
                        // showDialog(
                        //     context: context,
                        //     builder: (ctx) => Comdialog()).then((value) {
                        //       setState(() {
                        //         companyid = value;
                        //       });
                        //     });
                      },
                      child: SizedBox(
                          height: 60,
                          width: 160,
                          child: Card(
                            shadowColor: Color.fromARGB(184, 14, 179, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            elevation: 4,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 25,
                                    child: Image.asset(
                                      'assets/images/addcom.png',
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'City',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'RobotoCondensed',
                                      color: Color.fromARGB(255, 1, 43, 121),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("Start Date"),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2035),
                        ).then((value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            startTime = value;
                            finishtime = '${startTime.year.toString()}-${startTime.month.toString()}-${startTime.day.toString()}';
                          });
                        });
                      },
                      child: SizedBox(
                          height: 60,
                          width: 170,
                          child: Card(
                            shadowColor: Color.fromARGB(184, 14, 179, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            // color:Color.fromARGB(255, 245, 252, 255) ,
                            elevation: 4,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: Image.asset(
                                      'assets/images/error.png',
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 70,
                                    width: 100,
                                    child: Text(
                                      startTime.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'RobotoCondensed',
                                        color: Color.fromARGB(255, 1, 43, 121),
                                      ),
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("End Date"),
                    SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2035),
                      ).then((value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          exTime = value;
                          finishtime = '${exTime.year.toString()}-${exTime.month.toString()}-${exTime.day.toString()}';
                        });
                      });
                    },
                    child: SizedBox(
                            height: 60,
                            width: 160,
                            child: Card(
                              shadowColor: Color.fromARGB(184, 14, 179, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              // color:Color.fromARGB(255, 245, 252, 255) ,
                              elevation: 4,
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: Image.asset(
                                        'assets/images/error.png',
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 70,
                                      width: 80,
                                      child: Text(
                                        exTime.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'RobotoCondensed',
                                          color: Color.fromARGB(255, 1, 43, 121),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            )),
                  ),
                            SizedBox(
                      width: 15,
                    ),       
                    InkWell(
                      onTap: () {
                        // showDialog(
                        //     context: context,
                        //     builder: (ctx) => category_dialog(context, ctx));
                      },
                      child: SizedBox(
                          height: 60,
                          width: 160,
                          child: Card(
                            shadowColor: Color.fromARGB(184, 14, 179, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            // color:Color.fromARGB(255, 245, 252, 255) ,
                            elevation: 4,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 25,
                                    width: 22,
                                    child: Image.asset(
                                      'assets/images/addcat.png',
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Category',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'RobotoCondensed',
                                      color: Color.fromARGB(255, 1, 43, 121),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.minimize,
                      size: 30,
                      color: Color.fromARGB(255, 1, 43, 121),
                    ),
                    const Text(
                      '  Min People :',
                      style: TextStyle(
                        fontFamily: 'RobotoCondensed',
                        fontSize: 25,
                        color: Color.fromARGB(219, 14, 179, 255),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    Container(
                      height: 40,
                      width: 160,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 1, 43, 121),
                              width: 1.2),
                          borderRadius: BorderRadius.circular(40)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 25,
                            width: 40,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(219, 14, 179, 255),
                                borderRadius: BorderRadius.circular(100)),
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    stock = stock+1 ;
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                          ),
                           Text(
                            '$stock',
                            style: TextStyle(fontSize: 24, color: Colors.black),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 25,
                            width: 40,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(219, 14, 179, 255),
                                borderRadius: BorderRadius.circular(100)),
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    stock= stock-1 ;
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                )),
                          )

                        ],
                      ),
                    ),
                    SizedBox(
                                 width: 60,
                    ),
                    const Icon(
                      Icons.maximize,
                      size: 30,
                      color: Color.fromARGB(255, 1, 43, 121),
                    ),
                    const Text(
                      '  Max People :',
                      style: TextStyle(
                        fontFamily: 'RobotoCondensed',
                        fontSize: 25,
                        color: Color.fromARGB(219, 14, 179, 255),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    Container(
                      height: 40,
                      width: 160,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 1, 43, 121),
                              width: 1.2),
                          borderRadius: BorderRadius.circular(40)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 25,
                            width: 40,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(219, 14, 179, 255),
                                borderRadius: BorderRadius.circular(100)),
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    stock = stock+1 ;
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                          ),
                           Text(
                            '$stock',
                            style: TextStyle(fontSize: 24, color: Colors.black),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 25,
                            width: 40,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(219, 14, 179, 255),
                                borderRadius: BorderRadius.circular(100)),
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    stock= stock-1 ;
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                )),
                          )

                        ],
                      ),
                    )
                  ],

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.price_change_outlined,
                      size: 30,
                      color: Color.fromARGB(255, 1, 43, 121),
                    ),
                    const Text(
                      '  Price :',
                      style: TextStyle(
                        fontFamily: 'RobotoCondensed',
                        fontSize: 25,
                        color: Color.fromARGB(219, 14, 179, 255),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 30,
                      width: 150,
                      child: TextFormField(
                        
                        decoration: const InputDecoration(
                          hintText: ' Price' ,
                          hintStyle:  TextStyle(
                                color: Color.fromARGB(255, 63, 63, 63),
                                fontSize: 15),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromARGB(255, 1, 43, 121),
                            )),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue))),
                                 validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return ' Price is Empty ';
                                } else{return null;}
                              },
                              onSaved: (newValue) {
                                price = newValue!;
                              },
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.description_outlined,
                      size: 25,
                      color: Color.fromARGB(255, 1, 43, 121),
                    ),
                    const Text(
                      '  Description :',
                      style: TextStyle(
                        fontFamily: 'RobotoCondensed',
                        fontSize: 25,
                        color: Color.fromARGB(219, 14, 179, 255),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child:TextFormField(
                        maxLines: 10,
                        minLines: 2,
                         keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  labelText: ' Add Some Description ',
                                  labelStyle:  TextStyle(
                                      color: Color.fromARGB(219, 14, 179, 255).withOpacity(0.6), fontSize: 18),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 1, 43, 121),
                                  )),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 1, 43, 121),
                                      width: 1.4,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromARGB(255, 1, 43, 121), width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(8.0))),
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Description  is Empty ';
                                } else{ return null;}
                              },
                              onSaved: (newValue) {
                                des = newValue!;
                              },
                             
                            ),
                    )
                  ],
                ),
              ),
              SizedBox(height:5 ,),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.timer,
                      size: 25,
                      color: Color.fromARGB(255, 1, 43, 121),
                    ),
                    Text(
                      'Trip Status :',
                      style: TextStyle(
                        fontFamily: 'RobotoCondensed',
                        fontSize: 25,
                        color: Color.fromARGB(219, 14, 179, 255),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    
                  ],
                ),
              ),
              SizedBox(height:5,),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.privacy_tip,
                      size: 30,
                      color: Color.fromARGB(255, 1, 43, 121),
                    ),
                    Text(
                      'Is Privet:',
                      style: TextStyle(
                        fontFamily: 'RobotoCondensed',
                        fontSize: 25,
                        color: Color.fromARGB(219, 14, 179, 255),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    // CheckboxListTile(
                    //   fillColor: MaterialStateProperty.all(Color.fromARGB(237, 1, 51, 145)),
                    //   checkColor: const Color.fromARGB(219, 14, 179, 255),
                    //   overlayColor:MaterialStateProperty.all(Colors.black.withOpacity(0.0)),
                    //   title: const Text(
                    //               'Trip Status',
                    //               style: TextStyle(fontSize: 23 , fontFamily: 'RobotoCondensed' , color:  Color.fromARGB(219, 14, 179, 255)),
                    //             ),
                    //             controlAffinity:
                    //                 ListTileControlAffinity.leading,
                    //   value: true,
                    //   onChanged:(value) => {

                    //   },
                    //  ),
                    
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
                child: Row(
                  children: [
                    Spacer(),
                    ElevatedButton(
                      onPressed: (){
                       // pressed(context);
                        },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),),
                        backgroundColor: Color.fromARGB(255, 162, 231, 255),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                            color: Color.fromARGB(255, 1, 43, 121),
                            fontSize: 25,
                            fontFamily: 'Pacifico',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ):Center(
            child: SizedBox(
              height: 70,
              width: 70,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
     
   ), ),
  ],
    );
  }
  //  AlertDialog category_dialog(BuildContext context, BuildContext ctx) {
  //   return AlertDialog(
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(30)
  //                           ),
  //                               content: Container(
  //                                   width: MediaQuery.of(context).size.width *
  //                                       0.5,
  //                                   height:
  //                                       MediaQuery.of(context).size.height *
  //                                           0.4,
  //                                   color: Colors.white,
  //                                   child: GridView(
  //                                     padding: const EdgeInsets.symmetric(
  //                                         horizontal: 10, vertical: 10),
  //                                     gridDelegate:
  //                                         SliverGridDelegateWithMaxCrossAxisExtent(
  //                                       maxCrossAxisExtent:
  //                                           MediaQuery.of(context)
  //                                                   .size
  //                                                   .width *
  //                                               0.1,
  //                                       childAspectRatio: 1,
  //                                       crossAxisSpacing: 20,
  //                                       mainAxisSpacing: 20,
  //                                     ),
  //                                     children: cat
  //                                         .map((e) => InkWell(
  //                                           onTap: (){
  //                                             setState(() {
  //                                               categoryid = int.parse(e['id']!);
  //                                             });
  //                                             Navigator.of(ctx).pop();
  //                                           },
  //                                               child: Container(
  //                                                 decoration: BoxDecoration(
  //                                                   border: Border.all(
  //                                                       color: const Color
  //                                                               .fromARGB(
  //                                                           255, 1, 51, 145),
  //                                                       width: 1.2),
  //                                                   borderRadius:
  //                                                       BorderRadius.circular(
  //                                                           40),
  //                                                 ),
  //                                                 child: Column(
  //                                                   mainAxisAlignment:
  //                                                       MainAxisAlignment
  //                                                           .center,
  //                                                   children: [
  //                                                     const SizedBox(
  //                                                       height: 5,
  //                                                     ),
  //                                                     SizedBox(
  //                                                       height: 55,
  //                                                       width: 60,
  //                                                       child: Image.asset(
  //                                                         e['image']!,
  //                                                         fit: BoxFit
  //                                                             .fitHeight,
  //                                                       ),
  //                                                     ),
  //                                                     const SizedBox(
  //                                                       height: 5,
  //                                                     ),
  //                                                     Text(
  //                                                       e['name']!,
  //                                                       style: const TextStyle(
  //                                                           fontSize: 15,
  //                                                           fontFamily:
  //                                                               'RobotoCondensed',
  //                                                           color:
  //                                                               Colors.black),
  //                                                     ),
  //                                                     const SizedBox(
  //                                                       height: 5,
  //                                                     )
  //                                                   ],
  //                                                 ),
  //                                               ),
  //                                             ))
  //                                         .toList(),
  //                                   )),
  //                             );
  // }

  // void pressed(BuildContext ctx)async{
  //   if(!_formkey.currentState!.validate()){
  // return;
  //   }
  //   if (companyid == 0 ){
  //     showDialog(context: ctx, builder: (_)=>AlertDialog(
  //       content: Text('Please Choose any Company' , style: TextStyle(
  //         color: Colors.black,
  //         fontSize: 25,
  //         fontFamily: 'RobotoCondensed'
  //       ),),
  //     ));
  //     return;
  //   }
  //   if (categoryid == 0 ){
  //     showDialog(context: ctx, builder: (_)=>AlertDialog(
  //       content: Text('Please Choose any Category' , style: TextStyle(
  //         color: Colors.black,
  //         fontSize: 25,
  //         fontFamily: 'RobotoCondensed'
  //       ),),
  //     ));
  //     return;
  //   }

  //   if (extime == DateTime(2022)){
  //     showDialog(context: ctx, builder: (_)=>AlertDialog(
  //       content: Text('Please Choose any Expiration date' , style: TextStyle(
  //         color: Colors.black,
  //         fontSize: 25,
  //         fontFamily: 'RobotoCondensed'
  //       ),),
  //     ));
  //     return;
  //   }
  //   _formkey.currentState?.save();
  //    setState(() {
  //      isloading = true;
  //    });
  //    try{
  //      Provider.of<Mypro>(ctx , listen: false).setmapmedecien(comname, sinname, des, int.parse(price), stock, finishtime, categoryid, companyid);
  //      await Provider.of<Mypro>(ctx , listen: false).setmedicen();
  //      Navigator.of(ctx).pop();
  //    }catch(error){
  //      showDialog(context: ctx, builder: (ctxx)=>AlertDialog(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(40)
  //     ),
  //     title: const Text('Warning', style: TextStyle(color:  Color.fromARGB(255, 252, 93, 93) , fontSize: 25), textAlign: TextAlign.center,),
  //     content: Text(error.toString()),
  //   ));
  //    }
  //    setState(() {
  //      isloading=false;
  //    });
  //   // // ignore: use_build_context_synchronously
  //   // Navigator.of(ctx).pop();
  //   // print(finishtime);
  // }

  

}

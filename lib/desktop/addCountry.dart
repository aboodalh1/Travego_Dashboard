import 'package:flutter/material.dart';

class AddCountry extends StatefulWidget {
  const AddCountry({super.key});

  @override
  State<AddCountry> createState() => _AddCountryState();
}

class _AddCountryState extends State<AddCountry>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
   final GlobalKey<FormState> _formkey = GlobalKey();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: MediaQuery.of(context).size.height*0.50,
        width: MediaQuery.of(context).size.width*0.50,
        child: Form(
          key: _formkey,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    margin: const EdgeInsets.only(right: 17),
                    child: Image.asset(
                      'assets/images/traveling.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  const Text(
                    'Add Country : ',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'RobotoCondensed',
                      color: Color.fromARGB(219, 14, 179, 255),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'X',
                        style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 1, 144, 160),),
                      ))
                ],
              ),
               Padding(
                 padding: const EdgeInsets.only(left: 20),
                 child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
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
                                    SizedBox(
                                      height: 160,
                                      width: 150,
                                      child: Image.asset(
                                        'assets/images/border.png',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
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
                                    horizontal: 10, vertical: 20),
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
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        height: 250,
                        width: 300,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 25),
                              height: 70,
                              width: 280,
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: const Text(' Enter The Name of Country :' , 
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'RobotoCondensed',
                                  color: Color.fromARGB(255, 1, 144, 160),
                                ),),
                              )                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 70,
                              width: 280,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: " Country's Name ",
                                    labelStyle:  TextStyle(
                                        color: const Color.fromARGB(219, 14, 179, 255).withOpacity(0.6), fontSize: 18),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Color.fromARGB(255, 1, 144, 160),
                                    )),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 1, 144, 160),
                                        width: 1.4,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(255, 1, 144, 160), width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(8.0))),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return ' Name is Empty ';
                                  } else{ return null;}
                                },
                                onSaved: (newValue) {
                                 // sinname = newValue!;
                                },
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                             ),
               ),
               Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
                child: Row(
                  children: [
                    const Spacer(),
                    ElevatedButton(
                      onPressed: (){
                        
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),),
                        backgroundColor: const Color.fromARGB(255, 214, 245, 255),
                      ),
                      child:const Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                            color: Color.fromARGB(255, 1, 144, 160),
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
          ) ),
      ),
    );
  }
}
// ignore_for_file: file_names
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';




// ignore: camel_case_types, must_be_immutable
class Tripditeals_page extends StatefulWidget {
  const Tripditeals_page({super.key});

  //int medid;

  //Medicine_page(this.medid);

  @override
  State<Tripditeals_page> createState() => _Tripditeals_pageState();
}

class _Tripditeals_pageState extends State<Tripditeals_page> {
  Map<String, dynamic> medinfo = {};
  // Medicen? medicen;

  bool isLoading = true;
  final List<String> images = [
    'assets/images/12 (1).jpeg',
    'assets/images/1.jpeg',
    'assets/images/images (2).jpeg',
  ];
  final PageController _pageController = PageController();


  @override
  Widget build(BuildContext context) {

    var quantityController = TextEditingController();
    var quantityNumber;
    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding (
          padding: const EdgeInsets.all(4.0),
        child:
             Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.only(right: 5.0),
                      color: Colors.white,
                      width: 80,
                      height: 80,
                      child: Image.asset(
                              'assets/images/ion_earth.png',
                              fit: BoxFit.fitHeight,
                            )
                          
                    ),
                  ),
                  Padding(
              padding: const EdgeInsets.all(4.0),
              child: Stack(
                children: [
                  SizedBox(
                    height: 200,
                    width: 600,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          images[index],
                          fit: BoxFit.fitHeight,
                          
                          );
                      },
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                         curve: Curves.easeIn,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: 
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            color: Color.fromARGB(255, 179, 207, 255),
                          ),
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Column(
                                  children: [
                                  
                                    SizedBox(
                                      width: double.infinity,
                                      height: 40,
                                      child: Text(
                                       'Travel to Paris',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 1, 58, 102),
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 40,
                                      child: Text(
                                       'Paris, France',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('Category',
                                         // S.of(context).Stock,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(255, 1, 58, 102),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        SizedBox(
                                          width: 150,
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              )),
                                              backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                const Color.fromARGB(
                                                    255, 216, 255, 194),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: const Text('International',
                                              style: TextStyle(
                                                color:
                                                    Color.fromARGB(255, 1, 58, 102),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const DottedLine(
                                      direction: Axis.vertical,
                                      dashLength: 3,
                                      lineLength: 50,
                                      dashColor: Color.fromARGB(255, 1, 58, 102),
                                    ),
                                    const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                         // S.of(context).
                                         'Total Price per persone',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(255, 1, 58, 102),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 18.0,
                                        ),
                                        Text(
                                         '3500',
                                           
                                          style: TextStyle(color: Colors.black87),
                                        )
                                      ],
                                    ),
                                   
                                    const DottedLine(
                                      direction: Axis.vertical,
                                      dashLength: 3,
                                      lineLength: 50,
                                      dashColor: Color.fromARGB(255, 1, 58, 102),
                                    ),
                                   Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                         // S.of(context).
                                          'Start Date:',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(255, 1, 58, 102),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        SizedBox(
                                          width: 220,
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              )),
                                              backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                const Color.fromARGB(
                                                    255, 255, 247, 176),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              ('July 20, 2024, 08:00 AM',)
                                                  .toString(),
                                              style: const TextStyle(
                                                color:
                                                    Color.fromARGB(255, 1, 58, 102),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const DottedLine(
                                      direction: Axis.vertical,
                                      dashLength: 3,
                                      lineLength: 50,
                                      dashColor: Color.fromARGB(255, 1, 58, 102),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                         // S.of(context).
                                          'End Date:',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(255, 1, 58, 102),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        SizedBox(
                                          width: 220,
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              )),
                                              backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                const Color.fromARGB(
                                                    255, 255, 247, 176),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              ('July 20, 2024, 08:00 AM',)
                                                  .toString(),
                                              style: const TextStyle(
                                                color:
                                                    Color.fromARGB(255, 1, 58, 102),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('Includes Flight:',
                                         // S.of(context).Stock,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(255, 1, 58, 102),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: 100,
                                          height: 30,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              )),
                                              backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                const Color.fromARGB(
                                                    255, 216, 255, 194),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: const Text('yes',
                                              style: TextStyle(
                                                color:
                                                    Color.fromARGB(255, 1, 58, 102),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const DottedLine(
                                      direction: Axis.vertical,
                                      dashLength: 3,
                                      lineLength: 50,
                                      dashColor: Color.fromARGB(255, 1, 58, 102),
                                    ),
                                    const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                         // S.of(context).
                                         'Cost per person with flight:',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(255, 1, 58, 102),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 18.0,
                                        ),
                                        Text(
                                         '4500',
                                           
                                          style: TextStyle(color: Colors.black87),
                                        )
                                      ],
                                    ),
                                    const DottedLine(
                                      direction: Axis.vertical,
                                      dashLength: 3,
                                      lineLength: 50,
                                      dashColor: Color.fromARGB(255, 1, 58, 102),
                                    ),
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                         // S.of(context).
                                          'Hotels:',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(255, 1, 58, 102),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        SizedBox(
                                          width: 300,
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              )),
                                              backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                const Color.fromARGB(
                                                    255, 255, 247, 176),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              ('5-star accommodations included',)
                                                  .toString(),
                                              style: const TextStyle(
                                                color:
                                                    Color.fromARGB(255, 1, 58, 102),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const DottedLine(
                                      direction: Axis.vertical,
                                      dashLength: 3,
                                      lineLength: 50,
                                      dashColor: Color.fromARGB(255, 1, 58, 102),
                                    ),
                                   const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                         // S.of(context).
                                         'Cost per person with hotels:',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(255, 1, 58, 102),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 18.0,
                                        ),
                                        Text(
                                         '5500',
                                           
                                          style: TextStyle(color: Colors.black87),
                                        )
                                      ],
                                    ),
                                    const DottedLine(
                                      direction: Axis.vertical,
                                      dashLength: 3,
                                      lineLength: 50,
                                      dashColor: Color.fromARGB(255, 1, 58, 102),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                         // S.of(context).
                                          'Registration Available:',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(255, 1, 58, 102),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        SizedBox(
                                          width: 100,
                                          height: 30,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              )),
                                              backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                Colors.green,
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              ('yes',)
                                                  .toString(),
                                              style: const TextStyle(
                                                color:
                                                    Color.fromARGB(255, 1, 58, 102),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                 const Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        //S.of(context).
                                        'Description',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 1, 58, 102),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Explore the beautiful city of Paris with guided tours and luxurious accommodations.',
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black45),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                      height: 10,
                                    ),
                                 const Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        //S.of(context).
                                        'Trip Services',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 1, 58, 102),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                    'Guided Tours , All Meals Included , Photography Sessions',
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black45),
                                    ),
                                  ],
                                ),
                            
                              ],
                            ),
                              ]
                                                ),
                                            
                                              ),
                                            ),
                        ),
              
              )
         
      ),
                            ],
             ),
    ),
      );
  }
}

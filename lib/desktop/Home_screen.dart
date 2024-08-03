import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travego_dashboard/desktop/users/Users.dart';
import 'package:travego_dashboard/desktop/countries.dart';
import 'package:travego_dashboard/desktop/create_trip.dart';
import 'package:travego_dashboard/desktop/home_show.dart';
import 'package:travego_dashboard/desktop/hotellist.dart';
import 'package:travego_dashboard/desktop/provider.dart';


class HomePageScreen extends StatefulWidget {
  const HomePageScreen({ super.key });
   static const homename = 'Home Page Screen';
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
int index = 0;
var places = [];
 List<DestinationCard> listplaces = [];
bool isloading = false;



@override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      setState(() {
        isloading = true;
      });
      try {
        print('Nawara0');
        await Provider.of<Mypro>(context, listen: false).Get_AllClient();
        print('Nawara1');
        places = Provider.of<Mypro>(context, listen: false).places;
         print('Nawara2');
       for (int i = 0; i < places.length; i++) {
         listplaces.add(
            DestinationCard(
            imagePath: 'assets/images/download (2).jpeg',
            title: places[i]['name'],
            location: places[i]['country']
                
               ),
          );
        }
       
      } catch (errore) {
        showDialog(
            context: context,
            builder: (ctxx) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  title: const Text(
                    'Warning',
                    style: TextStyle(
                        color: Color.fromARGB(255, 252, 93, 93), fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  content: Text(errore.toString()),
                ));
      }
      setState(() {
        isloading = false;
      });
    });
  }








  @override
  Widget build(BuildContext context) {
    List<String> li = [];
    List<Widget> body = [homepage(context),const CountryGridScreen(), HotelListScreen(), UserListPage()];
    return Scaffold(
      body: SizedBox(
         height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
           children: [
            drawerside(context, li),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.82,
                child: LayoutBuilder(
                  builder: (ctx, cont) => Container(
                    margin: const EdgeInsets.only(left: 15),
                    width: cont.maxWidth * 0.97,
                    height: MediaQuery.of(context).size.height,
                    // color: Colors.amber,
                    child: body[index],
                  ),
                ),
              ),
            ),
          ],
        )
        ),
    );
  }


Widget homepage(BuildContext context) {
  return isloading == false
        ?
       Row(
        children: [
          // Sidebar
          // Container(
          //   width: 200,
          //   color: Colors.grey[200],
          //   child: Column(
          //     children: [
          //      // UserProfile(),
          //      // MenuItems(),
               
          //     ],
          //   ),
          // ),
          // Main content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Header(),
                  Expanded(
                    child: Row(
                      children: [
                        // Left section
                         Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              DestinationCards(listplaces: listplaces,),
                              BookingHistory(),
                            ],
                          ),
                        ),
                        // Right section
                        Expanded(
                          
                          child: Padding(
                            padding: const EdgeInsets.only(left:10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              
                              children: [
                                        
                               GestureDetector(
                                 onTap: ()async{
                                   setState(() {
                                     index = 2;
                                   });
              //                       Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => HotelListScreen(),
              //   ),
              // );
                                 },
                              child: const Padding(
                                  padding: EdgeInsets.only(left:10),
                                   child:
                                    Text('Hotels', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                                              ),
                               ),
                              const SizedBox(height: 4),
                                         
                                const HotelCards(),
                                const FlightInfo(),
                                const UpcomingTrips(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
      : Center(
            child: SizedBox(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(),
            ),
          );
}

 Expanded drawerside(BuildContext context, List<String> li) {
    return Expanded(
        flex: 1,
        child:Container(
            width: 200,
            color: Colors.grey[200],
            child: Column(
              children: [
               Container(
      padding: const EdgeInsets.all(16),
      child: const Column(
        children: [
          CircleAvatar(radius: 40, backgroundImage: AssetImage('assets/images/travel.png')),
          SizedBox(height: 8),
          Text('Hosen R.', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Dhaka, Bangladesh'),
        ],
      ),
    ),
               Column(
      children: [
        
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Homepage'),
          onTap: ()async{
                 setState(() {
                  index = 0;
                                   });
          },        ),
      
        
        ListTile(
          leading: const Icon(Icons.people),
          title: const Text('User Tourist'),
          onTap: (){
            setState(() {
                  index = 3;
                                   });
          },
        ),
      
        
        
        ListTile(
          leading: const Icon(Icons.place_outlined),
          title: const Text('Our Destination'),
          onTap: (){setState(() {
                                     index = 1;
                                   });
           
          },
        ),
       
         ListTile(
          leading: const Icon(Icons.add_reaction),
          title: const Text('Add New Trip'),
          onTap: (){
           showDialog(
                    context: context,
                    builder: (ctx) => const Addtrip(),
                    barrierDismissible: false);
          },
        ),
       
      ],
    ),
               
              ],
            ),
          ),
        );

}

}
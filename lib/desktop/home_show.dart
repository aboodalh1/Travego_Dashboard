import 'package:flutter/material.dart';
import 'package:travego_dashboard/desktop/countries.dart';
import 'package:travego_dashboard/desktop/hotel_deatails.dart';
import 'package:travego_dashboard/desktop/hotellist.dart';
import 'package:travego_dashboard/desktop/places.dart';

class Home_Show extends StatefulWidget {
 Home_Show({super.key});
  static const homename = 'Home Page';
  @override
  _Home_ShowState createState() => _Home_ShowState();
}

class _Home_ShowState extends State<Home_Show> {

// var places = [];
 List<DestinationCard> listplaces = [];
// bool isloading = false;





// @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration.zero, () async {
//       setState(() {
//         isloading = true;
//       });
//       try {
//         await Provider.of<Mypro>(context, listen: false).getplaces();
//         // ignore: use_build_context_synchronously
//         places = Provider.of<Mypro>(context, listen: false).places;

//        for (int i = 0; i < places.length; i++) {
//          listplaces.add(
//             DestinationCard(
//             imagePath: 'assets/images/download (2).jpeg',
//             title: places[i]['name'],
//             location: places[i]['country']
                
//                ),
//           );
//         }
       
//       } catch (errore) {
//         showDialog(
//             context: context,
//             builder: (ctxx) => AlertDialog(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(40)),
//                   title: const Text(
//                     'Warning',
//                     style: TextStyle(
//                         color: Color.fromARGB(255, 252, 93, 93), fontSize: 25),
//                     textAlign: TextAlign.center,
//                   ),
//                   content: Text(errore.toString()),
//                 ));
//       }
//       setState(() {
//         isloading = false;
//       });
//     });
//   }


  @override
  Widget build(BuildContext context) {
    


    return  Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 200,
            color: Colors.grey[200],
            child: Column(
              children: [
                UserProfile(),
                MenuItems(),
               
              ],
            ),
          ),
          // Main content
          Expanded(
            child: Padding(
              padding:  EdgeInsets.all(8.0),
              child: Column(
                children: [
                   Header(),
                  Expanded(
                    child: Row(
                      children: [
                        // Left section
                         Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              DestinationCards(listplaces: listplaces),
                              BookingHistory(),
                            ],
                          ),
                        ),
                        // Right section
                        Expanded(
                          
                          child: Padding(
                            padding:  EdgeInsets.only(left:10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              
                              children: [
                                        
                               GestureDetector(
                                 onTap: (){
                                    Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HotelListScreen(),
                ),
              );
                                 },
                              child: const Padding(
                                  padding: EdgeInsets.only(left:10),
                                   child:
                                    Text('Hotels', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                                              ),
                               ),
                              const SizedBox(height: 4),
                                         
                               HotelCards(),
                                 FlightInfo(),
                              UpcomingTrips(),
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
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Column(
        children: [
          CircleAvatar(radius: 40, backgroundImage: AssetImage('assets/images/travel.png')),
          SizedBox(height: 8),
          Text('Hosen R.', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Dhaka, Bangladesh'),
        ],
      ),
    );
  }
}

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){},
          child: 
        const ListTile(
          leading: Icon(Icons.home),
          title: Text('Homepage'),
        ),
        ),
        GestureDetector(
          onTap: (){},
          child: 
        const ListTile(
          leading: Icon(Icons.people),
          title: Text('User Tourist'),
        ),
        ),
        
        
        ListTile(
          leading: const Icon(Icons.place_outlined),
          title: const Text('Our Destination'),
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CountryGridScreen(),
                ),
              );
          },
        ),
        // ListTile(
        //   leading: Icon(Icons.place_outlined),
        //   title: Text('Add Country'),
        //   onTap: (){
        //    showDialog(
        //             context: context,
        //             builder: (ctx) => AddCountry(),
        //             barrierDismissible: false);
        //   },
        // ),
       
      ],
    );
  }
}

class DestinationList extends StatelessWidget {
   DestinationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: ListView(
        children: [
          const ListTile(
            leading: Icon(Icons.place),
            title: Text('India'),
          ),
          const ListTile(
            leading: Icon(Icons.place),
            title: Text('Thailand'),
          ),
          const ListTile(
            leading: Icon(Icons.place),
            title: Text('Japan'),
          ),
          const ListTile(
            leading: Icon(Icons.place),
            title: Text('China'),
          ),
          const ListTile(
            leading: Icon(Icons.place),
            title: Text('Spain'),
          ),
          GestureDetector(
            child: const ListTile(
              leading: Icon(Icons.more_horiz),
              title: Text('Show More'),
            ),
          ),
        ],
      ),
    );
  }
}



class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Welcome To Travego', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(width: 400,),
        GestureDetector(
         onTap: (){
         Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const place_page(),
                ),
              );
      },
          child: const Text('show more', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200))),
       // CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/images/travel.png')),
      ],
    );
  }
}




class DestinationCards extends StatelessWidget {
  final List<DestinationCard> listplaces;
   DestinationCards({super.key  ,required this.listplaces});
 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
      
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
       itemCount: listplaces.length,
        itemBuilder: (context, index) {
          return listplaces[index];
        },
        
        // children: const [ 
        //   DestinationCard(
        //     imagePath: 'assets/images/download (1).jpeg',
        //     title: 'Nepal Mountain',
        //     location: 'Nepal, Kathmandu',
        //   ),
        //   DestinationCard(
        //     imagePath: 'assets/images/download (2).jpeg',
        //     title: 'USA Sea Beach',
        //     location: 'USA, Miami',
        //   ),
        //   DestinationCard(
        //     imagePath: 'assets/images/download (3).jpeg',
        //     title: 'India Jhansi',
        //     location: 'India, Kolkata',
        //   ),
        //   DestinationCard(
        //     imagePath: 'assets/images/download.jpeg',
        //     title: 'Nepal Mountain',
        //     location: 'Nepal, Kathmandu',
        //   ),
        //   DestinationCard(
        //     imagePath: 'assets/images/images.jpeg',
        //     title: 'USA Sea Beach',
        //     location: 'USA, Miami',
        //   ),
        //   DestinationCard(
        //     imagePath: 'assets/images/travel.png',
        //     title: 'India Jhansi',
        //     location: 'India, Kolkata',
        //   ),
        //   // يمكنك إضافة المزيد من البطاقات هنا
        // ],
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;

 DestinationCard({super.key, required this.imagePath, required this.title, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            location,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}


class BookingHistory extends StatelessWidget {
  const BookingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Up Coming Trip', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: const [
                  BookingCard(
                    
                    destination: 'Star Pacific Ocean',
                    nights: 5,
                    location: 'USA, Miami',
                    date: '07-12-2022',
                    adjustments: 1,
                    price: 156,
                    imagePath: 'assets/images/12 (1).jpeg',
                  ),
                  BookingCard(
                    destination: 'Seagal Garden',
                    nights: 4,
                    location: 'India, Kolkata',
                    date: '09-12-2022',
                    adjustments: 3,
                    price: 200,
                    imagePath: 'assets/images/12 (1).jpeg',
                  ),
                  BookingCard(
                    destination: 'Pacify Valley',
                    nights: 8,
                    location: 'Nepal',
                    date: '10-12-2022',
                    adjustments: 5,
                    price: 180,
                    imagePath: 'assets/images/12 (1).jpeg',
                  ),
                  BookingCard(
                    destination: 'Inaya Garden',
                    nights: 6,
                    location: 'Nepal',
                    date: '03-12-2022',
                    adjustments: 1,
                    price: 236,
                    imagePath: 'assets/images/12 (1).jpeg',
                  ),
                  BookingCard(
                    destination: 'Star Pacific Ocean',
                    nights: 5,
                    location: 'USA, Miami',
                    date: '07-12-2022',
                    adjustments: 1,
                    price: 156,
                    imagePath: 'assets/images/12 (1).jpeg',
                  ),
                  BookingCard(
                    destination: 'Seagal Garden',
                    nights: 4,
                    location: 'India, Kolkata',
                    date: '09-12-2022',
                    adjustments: 3,
                    price: 200,
                    imagePath: 'assets/images/12 (1).jpeg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String destination;
  final int nights;
  final String location;
  final String date;
  final int adjustments;
  final double price;
  final String imagePath;

  const BookingCard({super.key, 
    required this.destination,
    required this.nights,
    required this.location,
    required this.date,
    required this.adjustments,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
               
             ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                 fit: BoxFit.fill,
                  
                ),
              ),
            const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    destination,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text('$nights Night${nights > 1 ? 's' : ''} • $location'),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Date: $date'),
                      Text('Adjustments: $adjustments'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('\$$price p/b', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class FlightInfo extends StatelessWidget {
  const FlightInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Flight', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          FlightCard(
            departure: '20 Dec',
            returnDate: '21 Dec',
            departureTime: '9 AM',
            returnTime: '9 AM',
          ),
          FlightCard(
            departure: '22 Dec',
            returnDate: '25 Dec',
            departureTime: '10 AM',
            returnTime: '6 AM',
          ),
        ],
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  final String departure;
  final String returnDate;
  final String departureTime;
  final String returnTime;

  const FlightCard({super.key, 
    required this.departure,
    required this.returnDate,
    required this.departureTime,
    required this.returnTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Leave: $departure', style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Return: $returnDate', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Departure Time: $departureTime'),
                Text('Return Time: $returnTime'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class UpcomingTrips extends StatelessWidget {
  const UpcomingTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Booking History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: const [
                  TripCard(
                    destination: 'Mariana Lake',
                    startDate: '12 Dec',
                    description: 'Planning process are grouped into tours and put.',
                  ),
                  TripCard(
                    destination: 'Lotus Fallen',
                    startDate: '2 Jan',
                    description: 'Tour planning is a planning are grouped into tours and put.',
                  ),
                  TripCard(
                    destination: 'Mariana Lake',
                    startDate: '15 Feb',
                    description: 'Planning process are grouped into tours and put.',
                  ),
                  TripCard(
                    destination: 'Mariana Lake',
                    startDate: '12 Dec',
                    description: 'Planning process are grouped into tours and put.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  final String destination;
  final String startDate;
  final String description;

  const TripCard({super.key, 
    required this.destination,
    required this.startDate,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              destination,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text('Start From: $startDate'),
            const SizedBox(height: 4),
            Text(description),
          ],
        ),
      ),
    );
  }
}








class HotelCards extends StatelessWidget {
  const HotelCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          HotelCard(
            imagePath: 'assets/images/lovepik-man-travel.png',
            title: 'Nepal Mountain',
            location: 'Nepal, Kathmandu',
          ),
          HotelCard(
            imagePath: 'assets/images/addcom.png',
            title: 'USA Sea Beach',
            location: 'USA, Miami',
          ),
          HotelCard(
            imagePath: 'assets/images/travel.png',
            title: 'India Jhansi',
            location: 'India, Kolkata',
          ),
          HotelCard(
            imagePath: 'assets/images/addcom.png',
            title: 'Nepal Mountain',
            location: 'Nepal, Kathmandu',
          ),
          HotelCard(
            imagePath: 'assets/images/traveling.png',
            title: 'USA Sea Beach',
            location: 'USA, Miami',
          ),
          HotelCard(
            imagePath: 'assets/images/travel.png',
            title: 'India Jhansi',
            location: 'India, Kolkata',
          ),
          // يمكنك إضافة المزيد من البطاقات هنا
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;

  const HotelCard({super.key, required this.imagePath, required this.title, required this.location});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HotelDetailsPage(),
                ),
              );
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            Text(
              location,
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}

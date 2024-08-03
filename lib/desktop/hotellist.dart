import 'package:flutter/material.dart';
import 'package:travego_dashboard/desktop/add_hotel.dart';
import 'package:travego_dashboard/desktop/hotel_deatails.dart';


class HotelListScreen extends StatelessWidget {
  final List<Hotel> hotels = [
    Hotel(
      name: "Hotel 1",
      imageUrl: "assets/images/pngtree-hotel-room-that-has-a-window-overlooking-the-harbor-picture-image_2458677.jpg",
   hotelName: "Hotel Name" ,
   num_of_rooms:50,
   stars : 5,
   cityName:"City",
  country: "Country",
 description: "A wonderful hotel with great amenities.",
   photos : [
    'assets/images/pngtree-hotel-room-that-has-a-window-overlooking-the-harbor-picture-image_2458677.jpg',
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
  ],
   startTime : "12:00 PM",
  endTime : "11:00 AM",
   priceForExtraBed :20.0,
   distanceFromCity :5.0,
   breakfastPrice: 15.0,
  hotelServices: "Free Wi-Fi, Pool, Gym",
   security : "24/7 Security",
  location :"123 Street, City",
   facilities :"Spa, Parking, Restaurant",
   cleanliness: 9.0,
   averageRating : 4.5,
      
    ),
   Hotel(
      name: "Hotel 2",
      imageUrl: "assets/images/download (1).jpeg",
   hotelName: "Hotel Name" ,
   num_of_rooms:50,
   stars : 8,
   cityName:"City",
  country: "Country",
 description: "A wonderful hotel with great amenities.",
   photos : [
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
  ],
   startTime : "12:00 PM",
  endTime : "11:00 AM",
   priceForExtraBed :20.0,
   distanceFromCity :5.0,
   breakfastPrice: 15.0,
  hotelServices: "Free Wi-Fi, Pool, Gym",
   security : "24/7 Security",
  location :"123 Street, City",
   facilities :"Spa, Parking, Restaurant",
   cleanliness: 9.0,
   averageRating : 4.5,
      
    ),
    Hotel(
      name: "Hotel 3",
      imageUrl: "assets/images/download (1).jpeg",
   hotelName: "Hotel Name" ,
   num_of_rooms:50,
   stars : 5,
   cityName:"City",
  country: "Country",
 description: "A wonderful hotel with great amenities.",
   photos : [
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
  ],
   startTime : "12:00 PM",
  endTime : "11:00 AM",
   priceForExtraBed :20.0,
   distanceFromCity :5.0,
   breakfastPrice: 15.0,
  hotelServices: "Free Wi-Fi, Pool, Gym",
   security : "24/7 Security",
  location :"123 Street, City",
   facilities :"Spa, Parking, Restaurant",
   cleanliness: 9.0,
   averageRating : 4.5,
      
    ),
    Hotel(
      name: "Hotel 4",
      imageUrl: "assets/images/download (1).jpeg",
   hotelName: "Hotel Name" ,
   num_of_rooms:50,
   stars : 5,
   cityName:"City",
  country: "Country",
 description: "A wonderful hotel with great amenities.",
   photos : [
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
  ],
   startTime : "12:00 PM",
  endTime : "11:00 AM",
   priceForExtraBed :20.0,
   distanceFromCity :5.0,
   breakfastPrice: 15.0,
  hotelServices: "Free Wi-Fi, Pool, Gym",
   security : "24/7 Security",
  location :"123 Street, City",
   facilities :"Spa, Parking, Restaurant",
   cleanliness: 9.0,
   averageRating : 4.5,
      
    ),
     Hotel(
      name: "Hotel 6",
      imageUrl: "assets/images/download (1).jpeg",
   hotelName: "Hotel Name" ,
   num_of_rooms:50,
   stars : 7,
   cityName:"City",
  country: "Country",
 description: "A wonderful hotel with great amenities.",
   photos : [
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
  ],
   startTime : "12:00 PM",
  endTime : "11:00 AM",
   priceForExtraBed :20.0,
   distanceFromCity :5.0,
   breakfastPrice: 15.0,
  hotelServices: "Free Wi-Fi, Pool, Gym",
   security : "24/7 Security",
  location :"123 Street, City",
   facilities :"Spa, Parking, Restaurant",
   cleanliness: 9.0,
   averageRating : 4.5,
      
    ),
    Hotel(
      name: "Hotel 8",
      imageUrl: "assets/images/download (1).jpeg",
   hotelName: "Hotel Name" ,
   num_of_rooms:50,
   stars : 5,
   cityName:"City",
  country: "Country",
 description: "A wonderful hotel with great amenities.",
   photos : [
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
  ],
   startTime : "12:00 PM",
  endTime : "11:00 AM",
   priceForExtraBed :20.0,
   distanceFromCity :5.0,
   breakfastPrice: 15.0,
  hotelServices: "Free Wi-Fi, Pool, Gym",
   security : "24/7 Security",
  location :"123 Street, City",
   facilities :"Spa, Parking, Restaurant",
   cleanliness: 9.0,
   averageRating : 4.5,
      
    ),
     Hotel(
      name: "Hotel 9",
      imageUrl: "assets/images/download (1).jpeg",
   hotelName: "Hotel Name" ,
   num_of_rooms:50,
   stars : 5,
   cityName:"City",
  country: "Country",
 description: "A wonderful hotel with great amenities.",
   photos : [
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
  ],
   startTime : "12:00 PM",
  endTime : "11:00 AM",
   priceForExtraBed :20.0,
   distanceFromCity :5.0,
   breakfastPrice: 15.0,
  hotelServices: "Free Wi-Fi, Pool, Gym",
   security : "24/7 Security",
  location :"123 Street, City",
   facilities :"Spa, Parking, Restaurant",
   cleanliness: 9.0,
   averageRating : 4.5,
      
    ),
    Hotel(
      name: "Hotel 10",
      imageUrl: "assets/images/download (1).jpeg",
   hotelName: "Hotel Name" ,
   num_of_rooms:50,
   stars : 5,
   cityName:"City",
  country: "Country",
 description: "A wonderful hotel with great amenities.",
   photos : [
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
  ],
   startTime : "12:00 PM",
  endTime : "11:00 AM",
   priceForExtraBed :20.0,
   distanceFromCity :5.0,
   breakfastPrice: 15.0,
  hotelServices: "Free Wi-Fi, Pool, Gym",
   security : "24/7 Security",
  location :"123 Street, City",
   facilities :"Spa, Parking, Restaurant",
   cleanliness: 9.0,
   averageRating : 4.5,
      
    ),
     Hotel(
      name: "Hotel 11",
      imageUrl: "assets/images/download (1).jpeg",
   hotelName: "Hotel Name" ,
   num_of_rooms:50,
   stars : 5,
   cityName:"City",
  country: "Country",
 description: "A wonderful hotel with great amenities.",
   photos : [
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
  ],
   startTime : "12:00 PM",
  endTime : "11:00 AM",
   priceForExtraBed :20.0,
   distanceFromCity :5.0,
   breakfastPrice: 15.0,
  hotelServices: "Free Wi-Fi, Pool, Gym",
   security : "24/7 Security",
  location :"123 Street, City",
   facilities :"Spa, Parking, Restaurant",
   cleanliness: 9.0,
   averageRating : 4.5,
      
    ),
    Hotel(
      name: "Hotel 12",
      imageUrl: "assets/images/download (1).jpeg",
   hotelName: "Hotel Name" ,
   num_of_rooms:50,
   stars : 5,
   cityName:"City",
  country: "Country",
 description: "A wonderful hotel with great amenities.",
   photos : [
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
  ],
   startTime : "12:00 PM",
  endTime : "11:00 AM",
   priceForExtraBed :20.0,
   distanceFromCity :5.0,
   breakfastPrice: 15.0,
  hotelServices: "Free Wi-Fi, Pool, Gym",
   security : "24/7 Security",
  location :"123 Street, City",
   facilities :"Spa, Parking, Restaurant",
   cleanliness: 9.0,
   averageRating : 4.5,
      
    ),
    Hotel(
      name: "Hotel 1",
      imageUrl: "assets/images/download (1).jpeg",
   hotelName: "Hotel Name" ,
   num_of_rooms:50,
   stars : 5,
   cityName:"City",
  country: "Country",
 description: "A wonderful hotel with great amenities.",
   photos : [
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
  ],
   startTime : "12:00 PM",
  endTime : "11:00 AM",
   priceForExtraBed :20.0,
   distanceFromCity :5.0,
   breakfastPrice: 15.0,
  hotelServices: "Free Wi-Fi, Pool, Gym",
   security : "24/7 Security",
  location :"123 Street, City",
   facilities :"Spa, Parking, Restaurant",
   cleanliness: 9.0,
   averageRating : 4.5,
      
    ),
    Hotel(
      name: "Hotel 1",
      imageUrl: "assets/images/download (1).jpeg",
   hotelName: "Hotel Name" ,
   num_of_rooms:50,
   stars : 5,
   cityName:"City",
  country: "Country",
 description: "A wonderful hotel with great amenities.",
   photos : [
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (2).jpeg',
  ],
   startTime : "12:00 PM",
  endTime : "11:00 AM",
   priceForExtraBed :20.0,
   distanceFromCity :5.0,
   breakfastPrice: 15.0,
  hotelServices: "Free Wi-Fi, Pool, Gym",
   security : "24/7 Security",
  location :"123 Street, City",
   facilities :"Spa, Parking, Restaurant",
   cleanliness: 9.0,
   averageRating : 4.5,
      
    ),
    // Add more hotels here
  ];

 HotelListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
          icon: const Icon(Icons.add),
            tooltip: 'Add New Hotel',
            onPressed: () {
               showDialog(
                    context: context,
                    builder: (ctx) =>  const AddHotelPage(),
                    barrierDismissible: false);
            },
          ),
        ],
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: const Text('Hotels' ,
         style:TextStyle(
           color: Colors.amberAccent,
           fontWeight: FontWeight.bold,
         ),
         ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:5,
          childAspectRatio: 0.7, 
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          ),
          padding: const EdgeInsets.all(10),
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HotelDetailsPage(),
                ),
              );
            },
        child:  HotelCard(hotel: hotel),
        );
        },
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  const HotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 248, 217, 122),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft:Radius.circular(8), topRight: Radius.circular(8)),
            child: Image.network(
              hotel.imageUrl,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotel.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    Text(hotel.location),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Hotel {
  final String name;
  final String imageUrl;
  final String location;
 final String hotelName ;
 final int num_of_rooms ;
 final int stars ;
 final String cityName ;
 final String country ;
 final String description ;
 final List<String> photos ;
 final String startTime ;
 final String endTime ;
 final double priceForExtraBed ;
 final double distanceFromCity ;
 final double breakfastPrice ;
 final String hotelServices ;
 final String security ;
 final String facilities ;
 final double cleanliness ;
 final double averageRating ;

  Hotel({required this.name, required this.imageUrl, required this.location, required this.hotelName, required this.num_of_rooms, required this.stars, required this.cityName, required this.country, required this.description, required this.photos, required this.startTime, required this.endTime, required this.priceForExtraBed, required this.distanceFromCity, required this.breakfastPrice, required this.hotelServices, required this.security, required this.facilities, required this.cleanliness, required this.averageRating});

  

 
}
class Hotel {
  final int id;
  final int score;
  final String name;
  final String location;
  final String contactNumber;
  final String description;
  bool isFavorited = false;

  Hotel({
    required this.id,
    required this.score,
    required this.name,
    required this.location,
    required this.contactNumber,
    required this.description,
  });

  get fileAssetsAddress => "assets/images/hotels/$id.jpg";
}

class HotelBook {

  static final HotelBook _singleton = HotelBook._internal();
  factory HotelBook() {
    return _singleton;
  }
  HotelBook._internal();
  final List<Hotel> _favoritedHotels = <Hotel>[

  ];
  final List<Hotel> _hotelBook = [Hotel(
          id: 0,
          contactNumber: "+48 22 318 28 00",
          location: "Carrera 43 # 14 - 81 El Poblado., El Poblado, Medellín, Colombia, 050022",
          name: "Viaggio Medellin Grand Select",
          score: 4,
          description: """Conveniently situated in the El Poblado part of Medellín, this property puts you close to attractions and interesting dining options. This 4-star property is packed with in-house facilities to improve the quality and joy of your stay."""),
      Hotel(
          id: 1,
          contactNumber: "+48 22 318 28 00",
          location: "Cra 38 #9 A-13, El Poblado, Medellín, Colombia, 050021",
          name: "Marquee Medellin",
          score: 5,
          description: """Conveniently situated in the El Poblado part of Medellín, this property puts you close to attractions and interesting dining options. This 5-star property is packed with in-house facilities to improve the quality and joy of your stay."""),
      Hotel(
          id: 2,
          contactNumber: "+48 22 318 28 00",
          location: "Calle 10A #36-29, El Poblado, Medellín, Colombia, 050021",
          name: "Haven A Design Hotel",
          score: 4,
          description: """Get your trip off to a great start with a stay at this property, which offers free Wi-Fi in all rooms. Conveniently situated in the El Poblado part of Medellín, this property puts you close to attractions and interesting dining options. Don't leave before paying a visit to the famous José María Córdova International Airport. Rated with 4 stars, this high-quality property provides guests with access to indoor pool and outdoor pool on-site."""),
      Hotel(
          id: 3,
          contactNumber: "+48 22 318 28 00",
          location: "Circular 2 # 74-91 laureles segundo piso, Laureles, Medellín, Colombia, 050031",
          name: "Hotel Laureles Home",
          score: 3,
          description: """Conveniently situated in the Laureles part of Medellín, this property puts you close to attractions and interesting dining options."""),
      Hotel(
          id: 4,
          contactNumber: "+48 22 318 28 00",
          location: "Calle 10 B # 37 - 29, El Poblado, Medellín, Colombia, 050021",
          name: "The Click Clack Hotel Medellin",
          score: 5,
          description: """Conveniently situated in the El Poblado part of Medellín, this property puts you close to attractions and interesting dining options. This 5-star property is packed with in-house facilities to improve the quality and joy of your stay."""),
      Hotel(
          id: 5,
          contactNumber: "+48 22 318 28 00",
          location: "5316 West Southern Avenue, Indianapolis Airport, Indianapolis (IN), United States, 46241",
          name: "La Quinta Inn by Wyndham",
          score: 3,
          description: """The car parking and the Wi-Fi are always free, so you can stay in touch and come and go as you please. Conveniently situated in the Indianapolis Airport part of Indianapolis (IN), this property puts you close to attractions and interesting dining options. Don't leave before paying a visit to the famous Indianapolis Childrens Museum. Restaurant, fitness center and indoor pool are among the special facilities that will enhance your stay with on-site convenience."""),
    ];
  List<Hotel> get hotelBook => _hotelBook;
  List<Hotel> get favoritedHotelBook => _favoritedHotels;
  int get length => _hotelBook.length;
  void addFavoriteHotel(Hotel hotel){
    _favoritedHotels.add(hotel);
  }
  void deleteFavoriteHotel(Hotel hotel){
    _favoritedHotels.remove(hotel);
  }
}

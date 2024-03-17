class WaterPoint {
  final int pointId;
  final String name;
  final String distance;
  final double latitude;
  final double longitude;
  double flowRate;
  String quality;
  final int price;
  String status;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;
  final String fundedBy;

  WaterPoint(
      {required this.pointId,
      required this.name,
      required this.distance,
      required this.latitude,
      required this.longitude,
      required this.flowRate,
      required this.quality,
      required this.price,
      required this.status,
      required this.imageURL,
      required this.isFavorated,
      required this.decription,
      required this.isSelected,
      required this.fundedBy}
      );

  //List of Plants data
  static List<WaterPoint> pointList = [
    WaterPoint(
        pointId: 0,
        name: "Kimironko Vendor",
        distance: '1-2 mins',
        latitude: -1.9192373, 
        longitude: 30.1905454,
        flowRate: 4.5,
        quality: 'is potable',
        price: 1000,
        status: "Open",
        imageURL: 'assets/images/wp1.png',
        isFavorated: true,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false,
        fundedBy: "Rwanda Government"),
    WaterPoint(
        pointId: 1,
        name: "Remera Outlet",
        distance: '1-2 mins',
        latitude: -1.9490870, 
        longitude: 30.1126849,
        flowRate: 4.5,
        quality: 'is potable',
        price: 1000,
        status: "Closed",
        imageURL: 'assets/images/wp2.jpg',
        isFavorated: true,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false,
        fundedBy: "Rwanda Government"),
    WaterPoint(
        pointId: 2,
        name: "Gishushu Outlet",
        distance: '1-2 mins',
        latitude: -1.9519999, 
        longitude: 30.1056387,
        flowRate: 4.5,
        quality: 'is potable',
        price: 1000,
        status: "Open",
        imageURL: 'assets/images/wp3.jpg',
        isFavorated: true,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false,
        fundedBy: "Rwanda Government"),
    WaterPoint(
        pointId: 3,
        name: "Kwa Nayinzira Pipeline",
        distance: '1-2 mins',
        latitude: -1.9307064, 
        longitude: 30.1442809,
        flowRate: 4.5,
        quality: 'is potable',
        price: 1000,
        status: "Closed",
        imageURL: 'assets/images/wp4.jpg',
        isFavorated: true,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false,
        fundedBy: "Rwanda Government"),
    WaterPoint(
        pointId: 4,
        name: "Nyamata Outlet",
        distance: '1-2 mins',
        latitude: -2.0648287, 
        longitude: 30.0883861,
        flowRate: 4.5,
        quality: 'is potable',
        price: 1000,
        status: "Open",
        imageURL: 'assets/images/wp3.jpg',
        isFavorated: true,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false,
        fundedBy: "Rwanda Government"),
    WaterPoint(
        pointId: 5,
        name: "Kimironko Vendor",
        distance: '1-2 mins',
        latitude: -1.9192373,
        longitude: 30.1905454,
        flowRate: 4.5,
        quality: 'is potable',
        price: 1000,
        status: "Open",
        imageURL: 'assets/images/wp2.jpg',
        isFavorated: true,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false,
        fundedBy: "Rwanda Government"),
    WaterPoint(
        pointId: 0,
        name: "Kimironko Vendor",
        distance: '1-2 mins',
        latitude: -1.9192373,
        longitude: 30.1905454,
        flowRate: 4.5,
        quality: 'is potable',
        price: 1000,
        status: "Closed",
        imageURL: 'assets/images/wp4.jpg',
        isFavorated: true,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false,
        fundedBy: "Rwanda Government"),

  ];

  //Get the favorated items
  static List<WaterPoint> getFavoritedPlants() {
    List<WaterPoint> _travelList = WaterPoint.pointList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  static List<WaterPoint> addedToCartPlants() {
    List<WaterPoint> _selectedPlants = WaterPoint.pointList;
    return _selectedPlants
        .where((element) => element.isSelected == true)
        .toList();
  }
}  


class ExpertInfo {
  final String name;
  final String title;
  final String hospital;
  final String location;
  // final String option;
  final String image;
  final String price;
  final String address;
  final String phone;
  final String description;

  ExpertInfo({
    required this.name,
    required this.title,
    required this.hospital,
    required this.location,
    required this.image,
    required this.price,
    required this.address,
    required this.phone,
    required this.description,
  });

  factory ExpertInfo.fromJson(Map<String, dynamic> json) {
    return ExpertInfo(
      name: json['name'],
      title: json['title'],
      hospital: json['hospital'],
      location: json['location'],
      // option: json['option'],
      image: json['image'],
      price: json['price'],
      address: json['address'],
      phone: json['phone'],
      description: json['description'],
    );
  }
}

class TimerCard {
  final String imagePath;
  final Duration countdownDuration;
  final String address;
  final double price;
  final bool isHeartFilled;

  TimerCard({
    required this.imagePath,
    required this.countdownDuration,
    required this.address,
    required this.price,
    required this.isHeartFilled,
  });

  factory TimerCard.fromJson(Map<String, dynamic> json) {
    return TimerCard(
      imagePath: json['imagePath'],
      countdownDuration: Duration(seconds: json['countdownDuration']),
      address: json['address'],
      price: json['price'].toDouble(),
      isHeartFilled: json['isHeartFilled'],
    );
  }
}

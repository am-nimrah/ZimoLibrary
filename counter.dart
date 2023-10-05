import 'dart:async';

class TimerCard {
  late final String imagePath;
  late final Duration countdownDuration;
  late final String address;
  late final double price;
  late final bool isHeartFilled;
  late Timer _timer;

  TimerCard({
    required this.imagePath,
    required this.countdownDuration,
    required this.address,
    required this.price,
    required this.isHeartFilled,
    required Function(Duration) onTimerUpdate,
  }) {
    startTimer(onTimerUpdate);
  }
  factory TimerCard.fromJson(Map<String, dynamic> json) {
    return TimerCard(
      imagePath: json['imagePath'],
      countdownDuration: Duration(milliseconds: json['countdownDuration']),
      address: json['address'],
      price: json['price'].toDouble(),
      isHeartFilled: json['isHeartFilled'],
      onTimerUpdate: (Duration duration) {
// Do something with the updated duration if needed
      },
    );
  }

  void startTimer(Function(Duration) onTimerUpdate) {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdownDuration.inSeconds > 0) {
        countdownDuration -= Duration(seconds: 1);
        onTimerUpdate(countdownDuration);
      } else {
        _timer.cancel();
      }
    });
  }

  void disposeTimer() {
    _timer.cancel();
  }


}
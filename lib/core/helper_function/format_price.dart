/// 45.0 -> "45" , 12.5 -> "12.5"
String formatPrice(num value) =>
    value % 1 == 0 ? value.toInt().toString() : value.toStringAsFixed(1);

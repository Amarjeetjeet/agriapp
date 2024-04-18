class HelperFunctions {
  static int calculateDiscountPercentage(
      String? regularPrice, String? discountPrice) {
    // Check if both regularPrice and discountPrice are provided


    if (regularPrice == null || discountPrice == null) {
      return 0;
      // throw ArgumentError(
      //     "Both regularPrice and discountPrice must be provided.");
    }

    if (regularPrice.isEmpty || discountPrice.isEmpty) {
      return 0;
      // throw ArgumentError(
      //     "Both regularPrice and discountPrice must be provided.");
    }

    // Parse the prices to double
    double regularPriceValue = double.tryParse(regularPrice) ?? 0;
    double discountPriceValue = double.tryParse(discountPrice) ?? 0;

    // Calculate the discount percentage
    double discountPercentage =
        ((regularPriceValue - discountPriceValue) / regularPriceValue) * 100;

    return discountPercentage.toInt();
  }
}

extension TimeOfDayExtension on DateTime {
  String get greeting {
    var hour = this.hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }
}



extension StringX on String?{
  String get upCaseString {
    if((this ?? "").isEmpty){
      return "";
    }
    if(this == null){
      return "N/A";
    }
    if(this != null){
      return (this ?? "").toUpperCase().replaceAll("-", " ");
    }
    return this ?? "";
  }
}
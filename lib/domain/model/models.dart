class SliderObject {
  final String title1;
  final String title2;
  final String image;

  SliderObject({
    required this.title1,
    required this.title2,
    required this.image,
  });
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject({
    required this.sliderObject,
    required this.currentIndex,
    required this.numOfSlides,
  });
}

//login model
class Customer {
  String id;
  String name;
  int numOfNotifications;

  Customer({
    required this.id,
    required this.name,
    required this.numOfNotifications,
  });
}

class Contacts {
  String phone;
  String email;
  String link;

  Contacts({required this.phone, required this.email, required this.link});
}

class Authentication {
  Customer ?customer;
  Contacts ?contacts;

  Authentication({required this.customer, required this.contacts});
}

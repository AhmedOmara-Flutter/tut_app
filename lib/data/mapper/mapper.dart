import 'package:tut_app/app/app_imports.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      id: this?.id.orEmpty() ?? "",
      name: this?.name.orEmpty() ?? "",
      numOfNotifications: this?.numOfNotifications.orZero() ?? 0,
    );
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
      email: this?.email.orEmpty() ?? "",
      phone: this?.phone.orEmpty() ?? "",
      link: this?.link.orEmpty() ?? "",
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      contacts: this?.contacts.toDomain(),
      customer: this?.customer.toDomain(),
    );
  }
}

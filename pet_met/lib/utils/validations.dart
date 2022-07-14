class Validations {
  String? validateFirstName(String value) {
    if (value.isEmpty) {
      return 'First name is required';
    }
    return null;
  }

  String? validateUserName(String value) {
    if (value.isEmpty) {
      return 'User name is required';
    }
    return null;
  }

  String? validateLastName(String value) {
    if (value.isEmpty) {
      return 'Last name is required';
    }
    return null;
  }

  String? validateFullName(String value) {
    if (value.isEmpty) {
      return 'Full name is required';
    }

    if (!RegExp(r"^[A-Z a-z-]{2,25}$").hasMatch(value)) {
      return 'Invalid first name';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email is required";
    } else if (!isNumeric(value) &&
        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
      return "Invalid email";
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password is required";
    } else if (value.length < 6) {
      return "Length should be 6 character";
    } else {
      return null;
    }
  }

  String? validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.isEmpty) {
      return "Mobile number is required";
    } else if (value.length != 10) {
      return 'Mobile number must be of 10 digit';
    } else {
      return null;
    }
  }

  bool isNumeric(String s) {
    if (s.isEmpty) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  // String? validateSubject(String value) {
  //   if (value.isEmpty) {
  //     return 'Subject is required';
  //   }

  //   if (!RegExp(r"^[A-Z a-z-]{2,25}$").hasMatch(value)) {
  //     return 'Invalid first name';
  //   }
  //   return null;
  // }

  // String? validateComment(String value) {
  //   if (value.isEmpty) {
  //     return 'Comment is required';
  //   }

  //   if (!RegExp(r"^[A-Z a-z-]{2,25}$").hasMatch(value)) {
  //     return 'Invalid first name';
  //   }
  //   return null;
  // }

  // String? validateShippingAddress(String value) {
  //   if(value.isEmpty){
  //         return "Shipping Address should not be Empty";
  //       }
  //   return null;
  // }

  // String? validateBillingAddress(String value) {
  //   if(value.isEmpty){
  //     return "Billing Address should not be Empty";
  //   }
  //   return null;
  // }

}

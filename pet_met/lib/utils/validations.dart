class Validations {
  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? validateDetails(String value) {
    if (value.isEmpty) {
      return 'Details is required';
    }
    return null;
  }

  String? validateWeight(String value) {
    if (value.isEmpty) {
      return 'Weight is required';
    }
    return null;
  }

  String? validateLocation(String value) {
    if (value.isEmpty) {
      return 'Location is required';
    }
    return null;
  }

  String? validateOpenTime(String value) {
    if (value.isEmpty) {
      return 'Open time is required';
    }
    return null;
  }

  String? validateCloseTime(String value) {
    if (value.isEmpty) {
      return 'Close time is required';
    }
    return null;
  }

  String? validateBankAccountNumber(String value) {
    if (value.isEmpty) {
      return 'Bank account number is required';
    }
    return null;
  }

  String? validateIfscCode(String value) {
    if (value.isEmpty) {
      return 'IFSC code is required';
    }
    return null;
  }

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
      return "Password must be at least 6 characters";
    } else {
      return null;
    }
  }


  String? validateNewPassword(String value) {
    if (value.isEmpty) {
      return "Password is required";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters";
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String value, String value2) {
    if (value.isEmpty) {
      return "Password is required";
    }else if (value != value2) {
      return "New Password and Confirm Password should not be Match";
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

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return 'Address is required';
    }
    return null;
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

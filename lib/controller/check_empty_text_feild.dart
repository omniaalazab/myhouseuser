class CheckEmptyValidationTextField {
  static String checkIsEmpty(var value) {
    if (value!.isEmpty) {
      return " Cann't be empty";
    } else {
      return "valid";
    }
  }
}

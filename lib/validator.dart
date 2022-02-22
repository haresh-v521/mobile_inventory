class FieldValidator{

    static String? validateEmail(String? value){
      if (value!.isEmpty) {
        return 'Please enter your email';
      }
      return null;
    }
    static String? validatePassword(String? value){
      if (value!.isEmpty) {
        return 'Please enter your email';
      } else if (value.length < 6) {
        return 'Please enter password with atleast 6 chars';
      }
      return null;
    }

}
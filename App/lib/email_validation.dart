// This only contains the email validation function
// The validation used is the one specified in the HTML5 specification
// https://html.spec.whatwg.org/multipage/input.html#e-mail-state-(type=email)

bool validate_email(String email) {
  Pattern regExPattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = new RegExp(regExPattern);
  
  return regex.hasMatch(email);
}

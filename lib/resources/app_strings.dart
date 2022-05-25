class AppStrings {
  static const String appName = 'Ketan Test';

  static const int contactNoMaxLength = 10;
  static const int contactNoMinLength = 7;
  static const int zipCodeMinLength = 6;
  static const int zipCodeMaxLength = 6;
  static const int passwordMinLength = 6;
  static const int priceMaxLength = 10;
  static const int otpLength = 6;
  static const int amountLength = 6;
  static const String currencySign = '\$'; //'₹';

  static const String regexCharactersOnly = '[a-zA-Z]';
  static const String regexCharactersWithSpace = '[a-zA-Z ]';
  static const String regexEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String regexGSTIN =
      r"^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$";
  static const String regexPAN = "[A-Z]{5}[0-9]{4}[A-Z]{1}";
  static const String regexIFSC = r"^[A-Z]{4}[0][A-Z0-9]{6}$";

  static const String strNoInternet = 'No Internet Connection';

  static const String dummyText =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';

  static const String strPrice = 'Price';
  static const String strSelect = 'Select';
  static const String strEnterQuantity = 'Enter Quantity';
  static const String strSubmitProduct = 'Submit Product';
  static const String strProductList = 'Product List';
  static const String strSelectColor = 'Select Color';
  static const String strSelectBrand = 'Select Brand';
  static const String strEnterValidQuantity = 'Enter valid quantity';
  static const String strOrderSummary = 'Order Summary';
  static const String strQty = 'Qty';
  static const String strSelectedColor = 'Selected Color';
  static const String strSelectedBrand = 'Selected Brand';
  static const String strTotalPrice = 'Total Price';
}

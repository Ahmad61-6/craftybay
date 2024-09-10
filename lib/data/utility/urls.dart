class Urls {
  static const String _baseUrl = 'http://ecom-api.teamrabbil.com/api';
  static String sendEmailOtp(email) => '$_baseUrl/UserLogin/$email';
  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';
  static String readProfileData = '$_baseUrl/ReadProfile';
  static String createProfile = '$_baseUrl/CreateProfile';
  static String homeBanner = '$_baseUrl/ListProductSlider';
  static String categoryList = '$_baseUrl/CategoryList';
  static String popularProducts = '$_baseUrl/ListProductByRemark/Popular';
  static String specialProducts = '$_baseUrl/ListProductByRemark/Special';
  static String newProducts = '$_baseUrl/ListProductByRemark/New';
  static String productsByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';
  static String productDetailsDataList(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';
  static String addToCart = '$_baseUrl/CreateCartList';
  static String cartList = '$_baseUrl/CartList';
}

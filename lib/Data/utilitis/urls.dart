class Urls{
  Urls._();
  static String _baseUrl = "https://ecom-api.teamrabbil.com/api";
  static String verifyEmail(String email) => "$_baseUrl/UserLogin/$email";
  static String verifyLogin(String email, String otp) => "$_baseUrl/VerifyLogin/$email/$otp";
  static String homeSlider= "$_baseUrl/ListProductSlider";
  static String getCategories= "$_baseUrl/CategoryList";
  static String getProductList(int productId)=> "$_baseUrl/ListProductByCategory/$productId";
  static String getProductByRemarks(String remarks)=> "$_baseUrl/ListProductByRemark/$remarks";
  static String getProductDetails(int id)=> "$_baseUrl/ProductDetailsById/$id";
  static String addToCart='$_baseUrl/CreateCartList';
  static String getCartList ='$_baseUrl/CartList';
  static String removeCartList(int id) =>'$_baseUrl/DeleteCartList/$id';
  static String listReviewByProduct(int id) =>'$_baseUrl/ListReviewByProduct/$id';
  static String readProfile ='$_baseUrl/ReadProfile';
  static String completeProfile ='$_baseUrl/CreateProfile';
}
abstract class ShopStates {}

class InitialHomeState extends ShopStates {}

class LoadingProductState extends ShopStates {}
class SuccessProductState extends ShopStates {}
class ErrorProductState extends ShopStates {}

////////////////////////////////////////////////////////

class LoadingCategoryState extends ShopStates {}
class SuccessCategoryState extends ShopStates {}
class ErrorCategoryState extends ShopStates {}

/////////////////////////////////////////////////////////

class LoadingFavoriteState extends ShopStates {}
class SuccessFavoriteState extends ShopStates {}
class ErrorFavoriteState extends ShopStates {}

//////////////////////////////////////////////////////////

class LoadingProfileState extends ShopStates {}
class SuccessProfileState extends ShopStates {}
class ErrorProfileState extends ShopStates {}

//////////////////////////////////////////////////////////

class SuccessUpdateProfileState extends ShopStates {}
class ErrorUpdateProfileState extends ShopStates {}
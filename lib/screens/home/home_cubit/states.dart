abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState(this.error);
}

class CategoriesLoadingState extends HomeState {}

class CategoriesSuccessState extends HomeState {}

class CategoriesErrorState extends HomeState {
  final String error;
  CategoriesErrorState(this.error);
}

class ProductsLoadingState extends HomeState {}

class ProductsSuccessState extends HomeState {}

class ProductsErrorState extends HomeState {
  final String error;
  ProductsErrorState(this.error);
}

// class AllProductsLoadingState extends HomeState{}
// class AllProductsSuccessState extends HomeState{}
// class AllProductsErrorState extends HomeState{
//   final String error;
//   AllProductsErrorState(this.error);
// }

class ContactInfoLoadingState extends HomeState {}

class ContactInfoSuccessState extends HomeState {}

class ContactInfoErrorState extends HomeState {
  final String error;
  ContactInfoErrorState(this.error);
}

class GetBrandLoadingState extends HomeState {}

class GetBrandSuccessState extends HomeState {}

class GetBrandErrorState extends HomeState {
  final String error;
  GetBrandErrorState(this.error);
}

class SearchProductsLoadingState extends HomeState {}

class SearchProductsSuccessState extends HomeState {}

class SearchProductsErrorState extends HomeState {
  final String error;
  SearchProductsErrorState(this.error);
}

class AddToCartLoadingState extends HomeState {}

class AddToCartSuccessState extends HomeState {}

class AddToCartErrorState extends HomeState {
  final String error;
  AddToCartErrorState(this.error);
}

class RemoveFromCartLoadingState extends HomeState {}

class RemoveFromCartSuccessState extends HomeState {}

class RemoveFromCartErrorState extends HomeState {
  final String error;
  RemoveFromCartErrorState(this.error);
}

class GetCartLoadingState extends HomeState {}

class GetCartSuccessState extends HomeState {}

class GetCartErrorState extends HomeState {
  final String error;
  GetCartErrorState(this.error);
}

class ContactUsLoadingState extends HomeState {}

class ContactUsSuccessState extends HomeState {}

class ContactUsErrorState extends HomeState {
  final String error;
  ContactUsErrorState(this.error);
}

class WishListLoadingState extends HomeState {}

class WishListSuccessState extends HomeState {}

class WishListErrorState extends HomeState {
  final String error;
  WishListErrorState(this.error);
}

class GetWishListLoadingState extends HomeState {}

class GetWishListSuccessState extends HomeState {}

class GetWishListErrorState extends HomeState {
  final String error;
  GetWishListErrorState(this.error);
}

class AllOffersLoadingState extends HomeState {}

class AllOffersSuccessState extends HomeState {}

class AllOffersErrorState extends HomeState {
  final String error;
  AllOffersErrorState(this.error);
}

class AddReviewLoadingState extends HomeState {}

class AddReviewSuccessState extends HomeState {}

class AddReviewErrorState extends HomeState {
  final String error;
  AddReviewErrorState(this.error);
}

class AllReviewLoadingState extends HomeState {}

class AllReviewSuccessState extends HomeState {}

class AllReviewErrorState extends HomeState {
  final String error;
  AllReviewErrorState(this.error);
}

class ChangeAppLang extends HomeState {}

class ChangeAppLang2 extends HomeState {}

class ChangeAppLang3 extends HomeState {}

class ChangeToDollar extends HomeState {}

class ChangeToKron extends HomeState {}

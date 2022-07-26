abstract class CheckoutState{}


class CheckoutInitialState extends CheckoutState{}

class CheckoutLoadingState extends CheckoutState{}
class CheckoutSuccessState extends CheckoutState{}
class CheckoutErrorState extends CheckoutState{
  final String error;
  CheckoutErrorState(this.error);
}

class AddAddressLoadingState extends CheckoutState{}
class AddAddressSuccessState extends CheckoutState{}
class AddAddressErrorState extends CheckoutState{
  final String error;
  AddAddressErrorState(this.error);
}


class DeleteAddressLoadingState extends CheckoutState{}
class DeleteAddressSuccessState extends CheckoutState{}
class DeleteAddressErrorState extends CheckoutState{
  final String error;
  DeleteAddressErrorState(this.error);
}

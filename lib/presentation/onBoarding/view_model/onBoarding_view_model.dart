import '../../base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel
    with BaseViewModelInputs, BaseViewModelOutputs {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }
}

mixin BaseViewModelInputs {
  void goNext();

  void goPrevious();

  void onPageChanged(int index);
}

mixin BaseViewModelOutputs {}

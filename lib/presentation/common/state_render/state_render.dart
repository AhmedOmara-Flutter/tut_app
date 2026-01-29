import 'package:tut_app/app/app_imports.dart';

enum StateRenderType {
  //popup
  popUpLoadingState,
  popUpErrorState,

  //full screen
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,

  //general
  contentState,
}

class StateRender extends StatelessWidget {
  final StateRenderType stateRenderType;
  final String message;
  final String title;
  final Function retryActionFunction;

  const StateRender({
    super.key,
    required this.stateRenderType,
    this.message = "default message",
    this.title = "default title",
    required this.retryActionFunction,
  });

  @override
  Widget build(BuildContext context) {
    return getContentWidget();
  }

  Widget getContentWidget() {
    switch (stateRenderType) {
      case StateRenderType.fullScreenLoadingState:
        return getColumnState([
          getContentImage(JsonAssets.loading),
          getContentTitle('Loading...'),
        ]);
      case StateRenderType.fullScreenErrorState:
        return getColumnState([
          getContentImage(JsonAssets.error),
          getContentMessage('Something went wrong. Try again later!.'),
          getContentButton('Retry Again'),
        ]);
      case StateRenderType.fullScreenEmptyState:
        return getColumnState([
          getContentImage(JsonAssets.empty),
          getContentTitle('No Data'),
        ]);
      case StateRenderType.contentState:
        return Container();
      case StateRenderType.popUpLoadingState:
        return Container();
      case StateRenderType.popUpErrorState:
        return Container();
    }
  }

  Widget getColumnState(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget getContentImage(String lottieImage) {
    return Lottie.asset(lottieImage);
  }

  Widget getContentTitle(String title) {
    return Text(title, style: getSemiBoldTextStyle(color: ColorManger.black));
  }

  Widget getContentMessage(String title) {
    return Text(title, style: getRegularTextStyle(color: ColorManger.black));
  }

  Widget getContentButton(String title) {
    return ElevatedButton(onPressed: () {}, child: Text(title));
  }
}

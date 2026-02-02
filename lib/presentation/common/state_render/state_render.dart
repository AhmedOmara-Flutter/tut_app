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
    return getStateWidget(context);
  }

  Widget getStateWidget(BuildContext context) {
    switch (stateRenderType) {
      // Full Screen Loading
      case StateRenderType.fullScreenLoadingState:
        return getColumnState([
          getAnimatedImage(JsonAssets.loading),
          getContentTitle('Loading...'),
        ]);

      // Full Screen Error
      case StateRenderType.fullScreenErrorState:
        return getColumnState([
          getAnimatedImage(JsonAssets.error),
          getContentMessage('Something went wrong. Try again later!.'),
          getRetryButton('Retry Again', context),
        ]);

      // Full Screen Empty
      case StateRenderType.fullScreenEmptyState:
        return getColumnState([
          getAnimatedImage(JsonAssets.empty),
          getContentTitle('No Data'),
        ]);

      // Pop Up Loading
      case StateRenderType.popUpLoadingState:
        return _getPopUpDialog(context,[
          SizedBox(height: AppSizeManager.s8,),
          getAnimatedImage(JsonAssets.loading),
          SizedBox(height: AppSizeManager.s8,)

        ]);

      // Pop Up Error
      case StateRenderType.popUpErrorState:
        return _getPopUpDialog(context,[
          getAnimatedImage(JsonAssets.error),
          getContentMessage('Something went wrong. Try again later!.'),
          getRetryButton('Ok', context),
        ]);

      case StateRenderType.contentState:
        return Container();
    }
  }
  Widget _getPopUpDialog(BuildContext context,List<Widget>children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizeManager.s14),
      ),
      elevation: AppSizeManager.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManger.white,
          borderRadius: BorderRadius.circular(AppSizeManager.s14),
          boxShadow: const [
            BoxShadow(color: Colors.black26),
          ],
        ),
        child: getDialogContent(context,children),
      ),
    );
  }

  Widget getDialogContent(BuildContext context,List<Widget>children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget getColumnState(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget getAnimatedImage(String lottieImage) {
    return Lottie.asset(lottieImage,height: AppSizeManager.s120,width: AppSizeManager.s120);
  }

  Widget getContentTitle(String title) {
    return Text(title, style: getSemiBoldTextStyle(color: ColorManger.black));
  }

  Widget getContentMessage(String title) {
    return Text(title, style: getRegularTextStyle(color: ColorManger.black));
  }

  Widget getRetryButton(String title, BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: AppMarginManager.m20,vertical: AppMarginManager.m8),
      child: ElevatedButton(
        onPressed: () {
          if (stateRenderType == StateRenderType.fullScreenErrorState) {
            retryActionFunction.call();
          } else {
            Navigator.of(context,rootNavigator: true).pop(true);
          }
        },
        child: Text(title),
      ),
    );
  }

}

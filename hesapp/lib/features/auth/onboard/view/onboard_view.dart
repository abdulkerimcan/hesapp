import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/constants/asset_constants.dart';
import 'package:hesapp/core/extension/contex_extension.dart';
import 'package:hesapp/features/auth/onboard/model/onboard_model.dart';
import 'package:hesapp/features/auth/onboard/viewmodel/onboard_provider.dart';
import 'package:hesapp/product/widget/onboard_circle.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

@RoutePage()
class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  @override
  void initState() {
    super.initState();
    context.read<OnBoardViewModel>().addItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Expanded(flex: 5, child: _buildPageView()),
          Expanded(flex: 2, child: _buildRowFooter()),
        ],
      ),
    );
  }

  Row _buildRowFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildListViewCircles(),
        _buildCircularProgressIndicator(),
        Visibility(
            visible: context.watch<OnBoardViewModel>().isLastIndex,
            child: _buildFloatingActionButton())
      ],
    );
  }

  ListView _buildListViewCircles() {
    return ListView.builder(
      itemCount: context.read<OnBoardViewModel>().onBoardItems.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return OnBoardCircle(
            isSelected:
                context.watch<OnBoardViewModel>().currentIndex == index);
      },
    );
  }

  Expanded _buildCircularProgressIndicator() {
    return Expanded(
        child: Center(
      child: Visibility(
          visible: context.read<OnBoardViewModel>().isLoading,
          child: LottieBuilder.asset(AssetConstants.loadingLottie,height: context.highHeightValue,width: context.highHeightValue,)),
    ));
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
        backgroundColor: Colors.yellow, //will change,
        child: const Icon(Icons.keyboard_arrow_right_outlined),
        onPressed: () {
          context.read<OnBoardViewModel>().completeOnBoard(context);
        });
  }

  PageView _buildPageView() {
    return PageView.builder(
      itemCount: context.read<OnBoardViewModel>().onBoardItems.length,
      onPageChanged: (value) {
        context.read<OnBoardViewModel>().changeCurrentIndex(value);
      },
      itemBuilder: (context, index) {
        var model = context.read<OnBoardViewModel>().onBoardItems[index];
        return Column(
          children: [
            Expanded(flex: 5, child: Lottie.asset(model.lottiePath)),
            Padding(
              padding: context.paddingMediumHorizontal,
              child: Column(
                children: [
                  _titleText(model, context),
                  _descriptionText(model, context),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Text _titleText(OnBoardModel model, BuildContext context) {
    return Text(
                  model.title,
                  style: context.textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                );
  }

  Text _descriptionText(OnBoardModel model, BuildContext context) {
    return Text(
                  model.description,
                  style: context.textTheme.labelMedium
                      ?.copyWith(fontWeight: FontWeight.w300),
                );
  }
}

// ignore_for_file: dead_code

import 'dart:convert';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/constants/enums/local_keys_enum.dart';
import 'package:hesapp/core/extension/contex_extension.dart';
import 'package:hesapp/core/init/cache/local_manager.dart';
import 'package:hesapp/features/qr/model/qr_response_model.dart';
import 'package:hesapp/features/qr/viewmodel/qr_viewmodel.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/constants/asset_constants.dart';

@RoutePage()
class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends QrViewModel with SingleTickerProviderStateMixin {
  BarcodeCapture? barcodeCapture;
  late MobileScannerController controller = MobileScannerController();
  Barcode? barcode;
  BarcodeCapture? capture;
  QrResponseModel? response;
  String deger = "";

  Future<void> onDetect(BarcodeCapture barcode) async {
    capture = barcode;
    var a = barcode.barcodes.first.displayValue;
    var decodedJson = jsonDecode(a ?? "");
    response = QrResponseModel.fromJson(decodedJson);
    LocalManager.instance.setIntValue(
        PreferencesKeys.RESTAURANT_ID, response?.restaurantId ?? 0);

    LocalManager.instance
        .setIntValue(PreferencesKeys.TABLE_ID, response?.tableId ?? 0)
        .whenComplete(
            () => context.router.replaceNamed(AppRoutes.routeHomeMain));
    setState(() => this.barcode = barcode.barcodes.first);
  }

  MobileScannerArguments? arguments;
  TextEditingController idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isCameraWorking = false;
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: 200,
      height: 200,
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: !isCameraWorking
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: idController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      prefixIconColor: Colors.white,
                      filled: true,
                      fillColor: Colors.white38,
                      border: OutlineInputBorder(),
                      labelText: "Enter your table id"),
                ),
                ElevatedButton(
                    onPressed: () {
                      scan(idController.text);
                    },
                    child: isLoading
                        ?  LottieBuilder.asset(AssetConstants.loadingLottie,height: context.highHeightValue,width: context.highHeightValue,)
                        : const Text("OK"))
              ],
            )
          : Builder(
              builder: (context) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    MobileScanner(
                      fit: BoxFit.contain,
                      scanWindow: scanWindow,
                      controller: controller,
                      onScannerStarted: (arguments) {
                        setState(() {
                          this.arguments = arguments;
                        });
                      },
                      onDetect: onDetect,
                    ),
                    if (barcode != null &&
                        barcode?.corners != null &&
                        arguments != null)
                      CustomPaint(
                        painter: BarcodeOverlay(
                          barcode: barcode!,
                          arguments: arguments!,
                          boxFit: BoxFit.contain,
                          capture: capture!,
                        ),
                      ),
                    const TextField(),
                    CustomPaint(
                      painter: ScannerOverlay(scanWindow),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: 100,
                        color: Colors.black.withOpacity(0.4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width - 120,
                                height: 50,
                                child: FittedBox(
                                  child: Text(
                                    deger,
                                    overflow: TextOverflow.fade,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}

class ScannerOverlay extends CustomPainter {
  ScannerOverlay(this.scanWindow);

  final Rect scanWindow;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPath = Path()..addRect(Rect.largest);
    final cutoutPath = Path()..addRect(scanWindow);

    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );
    canvas.drawPath(backgroundWithCutout, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BarcodeOverlay extends CustomPainter {
  BarcodeOverlay({
    required this.barcode,
    required this.arguments,
    required this.boxFit,
    required this.capture,
  });

  final BarcodeCapture capture;
  final Barcode barcode;
  final MobileScannerArguments arguments;
  final BoxFit boxFit;

  @override
  void paint(Canvas canvas, Size size) {
    if (barcode.corners == null) return;
    final adjustedSize = applyBoxFit(boxFit, arguments.size, size);

    double verticalPadding = size.height - adjustedSize.destination.height;
    double horizontalPadding = size.width - adjustedSize.destination.width;
    if (verticalPadding > 0) {
      verticalPadding = verticalPadding / 2;
    } else {
      verticalPadding = 0;
    }

    if (horizontalPadding > 0) {
      horizontalPadding = horizontalPadding / 2;
    } else {
      horizontalPadding = 0;
    }

    final ratioWidth =
        (Platform.isIOS ? capture.width! : arguments.size.width) /
            adjustedSize.destination.width;
    final ratioHeight =
        (Platform.isIOS ? capture.height! : arguments.size.height) /
            adjustedSize.destination.height;

    final List<Offset> adjustedOffset = [];
    for (final offset in barcode.corners!) {
      adjustedOffset.add(
        Offset(
          offset.dx / ratioWidth + horizontalPadding,
          offset.dy / ratioHeight + verticalPadding,
        ),
      );
    }
    final cutoutPath = Path()..addPolygon(adjustedOffset, true);

    final backgroundPaint = Paint()
      ..color = Colors.red.withOpacity(0.3)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    canvas.drawPath(cutoutPath, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

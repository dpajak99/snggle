import 'dart:async';

import 'package:codec_utils/codec_utils.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:snggle/config/app_colors.dart';
import 'package:snggle/views/widgets/custom/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:snggle/views/widgets/custom/custom_scaffold.dart';
import 'package:snggle/views/widgets/generic/gradient_scrollbar.dart';
import 'package:snggle/views/widgets/qr/qr_result_scaffold_layout.dart';

class QRResultScaffold extends StatefulWidget {
  final String title;
  final String subtitle;
  final UR? ur;
  final Widget body;
  final Widget tooltip;
  final bool closeButtonVisible;
  final bool popButtonVisible;
  final VoidCallback? customPopCallback;
  final List<Widget>? actions;
  final Widget? addressPreview;
  final String? plaintext;

  const QRResultScaffold.fromUniformResource({
    required this.title,
    required this.subtitle,
    required this.ur,
    required this.body,
    required this.tooltip,
    this.closeButtonVisible = false,
    this.popButtonVisible = true,
    this.customPopCallback,
    this.actions,
    this.addressPreview,
    super.key,
  }) : plaintext = null;

  const QRResultScaffold.fromPlaintext({
    required this.title,
    required this.subtitle,
    required this.plaintext,
    required this.body,
    required this.tooltip,
    this.closeButtonVisible = false,
    this.popButtonVisible = true,
    this.customPopCallback,
    this.actions,
    this.addressPreview,
    super.key,
  }) : ur = null;

  @override
  State<StatefulWidget> createState() => _QRResultScaffoldState();
}

class _QRResultScaffoldState extends State<QRResultScaffold> {
  final ScrollController scrollController = ScrollController();
  late final UREncoder? urEncoder;
  String? qrCodeContent;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    if (widget.ur != null) {
      urEncoder = UREncoder(ur: widget.ur!, maxFragmentLength: 30);
      qrCodeContent = urEncoder!.nextPart();
      if (urEncoder!.fragmentsCount != 1) {
        _updateQRWithNextPart();
        timer = Timer.periodic(const Duration(milliseconds: 150), (Timer timer) => _updateQRWithNextPart());
      }
    } else {
      urEncoder = null;
      qrCodeContent = widget.plaintext;
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return CustomScaffold(
      title: widget.title,
      actions: widget.actions,
      closeButtonVisible: widget.closeButtonVisible,
      popButtonVisible: widget.popButtonVisible,
      customPopCallback: widget.customPopCallback,
      body: QRResultScaffoldLayout(
        tooltip: widget.tooltip,
        addressPreview: widget.addressPreview,
        body: GradientScrollbar(
          scrollController: scrollController,
          margin: const EdgeInsets.only(bottom: CustomBottomNavigationBar.height),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  Text(
                    widget.subtitle,
                    style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.darkGrey),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return QrImageView(
                          data: qrCodeContent ?? '',
                          version: QrVersions.auto,
                          size: constraints.maxWidth,
                          padding: EdgeInsets.zero,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 14),
                  widget.body,
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _updateQRWithNextPart() {
    if (urEncoder!.isComplete) {
      urEncoder!.reset();
    }
    setState(() => qrCodeContent = urEncoder!.nextPart());
  }
}

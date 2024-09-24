import 'dart:convert';

import 'package:blockies_svg/blockies_svg.dart';
import 'package:codec_utils/codec_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snggle/config/app_colors.dart';
import 'package:snggle/config/app_icons/app_icons.dart';
import 'package:snggle/shared/models/networks/network_template_model.dart';
import 'package:snggle/shared/models/wallets/wallet_model.dart';
import 'package:snggle/views/widgets/generic/gradient_text.dart';
import 'package:snggle/views/widgets/generic/label_wrapper_vertical.dart';
import 'package:snggle/views/widgets/icons/asset_icon.dart';
import 'package:snggle/views/widgets/qr/qr_result_scaffold.dart';
import 'package:snggle/views/widgets/tooltip/bottom_tooltip/bottom_tooltip.dart';
import 'package:snggle/views/widgets/tooltip/bottom_tooltip/bottom_tooltip_item.dart';

class WalletQrConnectPage extends StatefulWidget {
  final WalletModel walletModel;
  final NetworkTemplateModel networkTemplateModel;

  const WalletQrConnectPage({
    required this.walletModel,
    required this.networkTemplateModel,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _WalletQrConnectPageState();
}

class _WalletQrConnectPageState extends State<WalletQrConnectPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return QRResultScaffold.fromUniformResource(
      title: 'Wallet QR Connect',
      subtitle: 'Extended public key',
      popButtonVisible: true,
      ur: UR(
        type: 'crypto-hdkey',
        serializedCbor: base64Decode(
          'pQNYIQOsSkRx3bAeHYEpUXIGb5s9OGZaOARyvvozddZgVAk5ZgRYIOYL6JMi0QIqRAi4E+QJ5Dy1+rYURKPhNu7ecFAaZ2vcBtkBMKIBhhgs9Rg89QD1AhqZ+mOOCBowNGZiCW1BaXJHYXAgLSB0d2F0',
        ),
      ),
      tooltip: BottomTooltip(
        actions: <Widget>[
          BottomTooltipItem(
            assetIconData: AppIcons.menu_save,
            label: 'Done',
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      addressPreview: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: LabelWrapperVertical(
          label: 'Exported address:',
          bottomBorderVisibleBool: false,
          child: NetworkAddressListTile(
            address: widget.walletModel.address,
            networkTemplateModel: widget.networkTemplateModel,
          ),
        ),
      ),
      body: const Column(
        children: <Widget>[],
      ),
    );
  }
}

class NetworkAddressListTile extends StatelessWidget {
  final String address;
  final NetworkTemplateModel networkTemplateModel;

  const NetworkAddressListTile({
    required this.address,
    required this.networkTemplateModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Row(
      children: <Widget>[
        SizedBox(
          width: 43,
          child: Stack(
            children: <Widget>[
              ClipOval(
                child: SvgPicture.string(
                  Blockies(seed: address).toSvg(size: 13),
                  fit: BoxFit.cover,
                  width: 30,
                  height: 30,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: AssetIcon(networkTemplateModel.networkIconType.largeIcon, size: 16),
              )
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: GradientText(
            address,
            gradient: AppColors.primaryGradient,
            textStyle: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

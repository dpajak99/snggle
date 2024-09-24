import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:snggle/config/app_colors.dart';
import 'package:snggle/config/app_icons/app_icons.dart';
import 'package:snggle/shared/models/networks/network_template_model.dart';
import 'package:snggle/shared/models/wallets/wallet_model.dart';
import 'package:snggle/views/pages/bottom_navigation/vaults_wrapper/wallet_connect_page/wallet_qr_connect_page.dart';
import 'package:snggle/views/widgets/button/gradient_outlined_button.dart';
import 'package:snggle/views/widgets/custom/custom_checkbox.dart';
import 'package:snggle/views/widgets/custom/custom_scaffold.dart';
import 'package:snggle/views/widgets/icons/asset_icon.dart';

@RoutePage()
class WalletConnectPage extends StatefulWidget {
  final WalletModel walletModel;
  final NetworkTemplateModel networkTemplateModel;

  const WalletConnectPage({
    required this.walletModel,
    required this.networkTemplateModel,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _WalletConnectPageState();
}

class _WalletConnectPageState extends State<WalletConnectPage> {
  WalletExportType selectedWalletExportType = WalletExportType.qr;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return CustomScaffold(
      title: 'Connect Wallet',
      popAvailableBool: true,
      popButtonVisible: true,
      body: Column(
        children: <Widget>[
          Text(
            'Choose a connection method',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.darkGrey,
            ),
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              WalletExportTypeButton(
                selectedBool: selectedWalletExportType == WalletExportType.qr,
                label: 'QR based',
                icon: AppIcons.connect_wallet_qr,
                onTap: () => _changeWalletExportType(WalletExportType.qr),
              ),
              WalletExportTypeButton(
                selectedBool: selectedWalletExportType == WalletExportType.hardware,
                label: 'Hardware based',
                icon: AppIcons.connect_wallet_hardware,
                onTap: () => _changeWalletExportType(WalletExportType.hardware),
              ),
            ],
          ),
          const SizedBox(height: 34),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                if (selectedWalletExportType == WalletExportType.qr) ...<Widget>[
                  GradientOutlinedButton.large(
                    label: 'Metamask QR',
                    icon: const AssetIcon(AppIcons.wallet_metamask, size: 18),
                    onPressed: _showQRConnectPage,
                  ),
                ],
                if (selectedWalletExportType == WalletExportType.hardware) ...<Widget>[
                  const GradientOutlinedButton.large(label: 'Install Trezor Interface', icon: AssetIcon(AppIcons.wallet_trezor, size: 18)),
                  const SizedBox(height: 8),
                  const GradientOutlinedButton.large(label: 'Install Ledger Interface', icon: AssetIcon(AppIcons.wallet_ledger, size: 18)),
                  const SizedBox(height: 10),
                  Text(
                    "You don't have any Snggle hardware abstraction apps currently installed.",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _changeWalletExportType(WalletExportType walletExportType) {
    setState(() => selectedWalletExportType = walletExportType);
  }

  Future<void> _showQRConnectPage() async {
    await showDialog(
      context: context,
      useSafeArea: false,
      builder: (BuildContext context) {
        return WalletQrConnectPage(walletModel: widget.walletModel, networkTemplateModel: widget.networkTemplateModel);
      },
    );
  }
}

enum WalletExportType { qr, hardware }

class WalletExportTypeButton extends StatelessWidget {
  final bool selectedBool;
  final String label;
  final AssetIconData icon;
  final VoidCallback onTap;

  const WalletExportTypeButton({
    required this.selectedBool,
    required this.label,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: selectedBool ? 1 : 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AssetIcon(icon, size: 100),
                Text(
                  label,
                  style: theme.textTheme.labelMedium?.copyWith(color: AppColors.body3),
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: CustomCheckbox(selectedBool: selectedBool, size: 14),
          ),
        ],
      ),
    );
  }
}

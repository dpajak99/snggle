import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:snggle/bloc/generic/list/list_state.dart';
import 'package:snggle/bloc/pages/bottom_navigation/vaults_wrapper/wallet_list_page/wallet_list_page_cubit.dart';
import 'package:snggle/config/app_colors.dart';
import 'package:snggle/config/app_icons.dart';
import 'package:snggle/shared/models/a_list_item_model.dart';
import 'package:snggle/shared/models/groups/group_model.dart';
import 'package:snggle/shared/models/password_model.dart';
import 'package:snggle/shared/models/vaults/vault_model.dart';
import 'package:snggle/shared/models/wallets/wallet_model.dart';
import 'package:snggle/shared/router/router.gr.dart';
import 'package:snggle/shared/utils/filesystem_path.dart';
import 'package:snggle/views/pages/bottom_navigation/vaults_wrapper/wallet_list_page/wallet_group_list_item.dart';
import 'package:snggle/views/pages/bottom_navigation/vaults_wrapper/wallet_list_page/wallet_list_item.dart';
import 'package:snggle/views/widgets/button/list_item_creation_button.dart';
import 'package:snggle/views/widgets/custom/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:snggle/views/widgets/drag/dragged_item/dragged_item_notifier.dart';
import 'package:snggle/views/widgets/generic/gradient_icon.dart';
import 'package:snggle/views/widgets/list/horizontal_list_item/horizontal_list_item_animation_wrapper.dart';
import 'package:snggle/views/widgets/list/horizontal_list_item/horizontal_list_item_layout.dart';
import 'package:snggle/views/widgets/list/list_item_actions_wrapper.dart';
import 'package:snggle/views/widgets/list/list_page_scaffold.dart';
import 'package:snggle/views/widgets/list/sliver_page_list.dart';

@RoutePage()
class WalletListPage extends StatefulWidget {
  final String name;
  final VaultModel vaultModel;
  final FilesystemPath filesystemPath;
  final PasswordModel vaultPasswordModel;

  const WalletListPage({
    required this.name,
    required this.vaultModel,
    required this.filesystemPath,
    required this.vaultPasswordModel,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _WalletListPageState();
}

class _WalletListPageState extends State<WalletListPage> {
  final DraggedItemNotifier draggedItemNotifier = DraggedItemNotifier();
  late final WalletListPageCubit walletListPageCubit = WalletListPageCubit(
    depth: 0,
    filesystemPath: widget.filesystemPath,
    vaultModel: widget.vaultModel,
    vaultPasswordModel: widget.vaultPasswordModel,
  );

  @override
  void initState() {
    walletListPageCubit.refreshAll();
    super.initState();
  }

  @override
  void dispose() {
    draggedItemNotifier.dispose();
    walletListPageCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListPageScaffold<WalletModel, WalletListPageCubit>(
      defaultPageTitle: widget.name,
      listCubit: walletListPageCubit,
      bodyBuilder: (BuildContext context, ListState listState) {
        return CustomScrollView(
          shrinkWrap: listState.isScrollDisabled,
          physics: listState.isScrollDisabled ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
          slivers: <Widget>[
            if (listState.isEmpty) ...<Widget>[
              SliverFillRemaining(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: CustomBottomNavigationBar.height),
                    child: IconButton(
                      onPressed: walletListPageCubit.createNewWallet,
                      icon: GradientIcon(AppIcons.add_circle, size: 54, gradient: AppColors.primaryGradient),
                    ),
                  ),
                ),
              ),
            ] else ...<Widget>[
              SliverPageList(
                addButtonVisibleBool: listState.isSelectionEnabled == false,
                loadingBool: listState.loadingBool,
                items: listState.visibleItems,
                selectedItems: listState.selectedItems,
                loadingPlaceholder: const HorizontalListItemLayout.loading(),
                creationButton: HorizontalListItemLayout(
                  iconWidget: ListItemCreationButton(
                    size: HorizontalListItemLayout.listItemIconSize,
                    onTap: walletListPageCubit.createNewWallet,
                  ),
                ),
                itemBuilder: (AListItemModel listItemModel) {
                  return HorizontalListItemAnimationWrapper(
                    key: Key('item${listItemModel.filesystemPath.fullPath}'),
                    childBuilder: (AnimationController fadeAnimationController, AnimationController slideAnimationController) {
                      return ListItemActionsWrapper<WalletModel, WalletListPageCubit>(
                        defaultPageTitle: widget.name,
                        draggedItemNotifier: draggedItemNotifier,
                        listItemSize: HorizontalListItemLayout.listItemSize,
                        listCubit: walletListPageCubit,
                        listItemModel: listItemModel,
                        onNavigate: _navigateToNextPage,
                        selectionPadding: const EdgeInsets.all(5),
                        child: switch (listItemModel) {
                          WalletModel walletModel => WalletListItem(
                              walletModel: walletModel,
                              fadeAnimationController: fadeAnimationController,
                              slideAnimationController: slideAnimationController,
                            ),
                          GroupModel groupModel => WalletGroupListItem(
                              groupModel: groupModel,
                              fadeAnimationController: fadeAnimationController,
                              slideAnimationController: slideAnimationController,
                            ),
                          (_) => const SizedBox(),
                        },
                      );
                    },
                  );
                },
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ],
        );
      },
    );
  }

  Future<void> _navigateToNextPage(AListItemModel listItemModel) async {
    if (listItemModel is WalletModel) {
      await AutoRouter.of(context).push<void>(WalletDetailsRoute(walletModel: listItemModel));
      await walletListPageCubit.refreshAll();
    } else if (listItemModel is GroupModel) {
      await walletListPageCubit.navigateNext(
        filesystemPath: listItemModel.filesystemPath,
      );
    }
  }
}

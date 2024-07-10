import 'package:snggle/config/locator.dart';
import 'package:snggle/infra/entities/vault_entity.dart';
import 'package:snggle/infra/repositories/vaults_repository.dart';
import 'package:snggle/infra/services/secrets_service.dart';
import 'package:snggle/shared/factories/vault_model_factory.dart';
import 'package:snggle/shared/models/vaults/vault_model.dart';
import 'package:snggle/shared/utils/filesystem_path.dart';

class VaultsService {
  final VaultsRepository _vaultsRepository = globalLocator<VaultsRepository>();
  final SecretsService _secretsService = globalLocator<SecretsService>();

  Future<int> getLastIndex() async {
    List<VaultEntity> vaultEntityList = await _vaultsRepository.getAll();
    if (vaultEntityList.isEmpty) {
      return -1;
    }
    List<int> vaultEntityIndexList = vaultEntityList.map((VaultEntity vaultEntity) => vaultEntity.index).toList();
    int currentMaxIndex = vaultEntityIndexList.reduce((int currentMaxIndex, int currentIndex) {
      return currentMaxIndex > currentIndex ? currentMaxIndex : currentIndex;
    });
    return currentMaxIndex;
  }

  Future<VaultModel> getById(int id) async {
    VaultEntity vaultEntity = await _vaultsRepository.getById(id);
    return globalLocator<VaultModelFactory>().createFromEntity(vaultEntity);
  }

  Future<List<VaultModel>> getAllByParentPath(FilesystemPath parentFilesystemPath, {bool firstLevelBool = false, bool previewEmptyBool = false}) async {
    List<VaultEntity> vaultEntityList = await _vaultsRepository.getAll();

    vaultEntityList = vaultEntityList.where((VaultEntity vaultEntity) {
      return FilesystemPath.fromString(vaultEntity.filesystemPathString).isSubPathOf(parentFilesystemPath, singleLevelBool: firstLevelBool);
    }).toList();

    List<VaultModel> vaultModelList = <VaultModel>[];
    for (VaultEntity vaultEntity in vaultEntityList) {
      vaultModelList.add(await globalLocator<VaultModelFactory>().createFromEntity(vaultEntity, previewEmptyBool: previewEmptyBool));
    }

    return vaultModelList;
  }

  Future<VaultModel> move(VaultModel vaultModel, FilesystemPath newParentFilesystemPath) async {
    FilesystemPath previousFilesystemPath = vaultModel.filesystemPath;
    FilesystemPath updatedFilesystemPath = vaultModel.filesystemPath.replace(previousFilesystemPath.parentPath, newParentFilesystemPath.fullPath);

    VaultModel movedVaultModel = vaultModel.copyWith(filesystemPath: updatedFilesystemPath);
    await save(movedVaultModel);
    await _secretsService.move(previousFilesystemPath, movedVaultModel.filesystemPath);
    return movedVaultModel;
  }

  Future<void> moveByParentPath(FilesystemPath previousFilesystemPath, FilesystemPath newFilesystemPath) async {
    List<VaultModel> vaultModelsToMove = await getAllByParentPath(previousFilesystemPath, firstLevelBool: false);
    for (VaultModel vaultModel in vaultModelsToMove) {
      FilesystemPath updatedFilesystemPath = vaultModel.filesystemPath.replace(previousFilesystemPath.fullPath, newFilesystemPath.fullPath);
      VaultModel updatedVaultModel = vaultModel.copyWith(filesystemPath: updatedFilesystemPath);

      await save(updatedVaultModel);
      await _secretsService.move(vaultModel.filesystemPath, updatedFilesystemPath);
    }
  }

  Future<void> save(VaultModel vaultModel) async {
    await _vaultsRepository.save(VaultEntity.fromVaultModel(vaultModel));
  }

  Future<void> deleteAllByParentPath(FilesystemPath parentFilesystemPath) async {
    List<VaultModel> vaultModelList = await getAllByParentPath(parentFilesystemPath, firstLevelBool: false);
    vaultModelList.sort((VaultModel a, VaultModel b) => b.filesystemPath.fullPath.length.compareTo(a.filesystemPath.fullPath.length));

    for (VaultModel vaultModel in vaultModelList) {
      await _secretsService.delete(vaultModel.filesystemPath);
      await _vaultsRepository.deleteById(vaultModel.id);
    }
  }

  Future<void> deleteById(int id) async {
    VaultModel vaultModel = await getById(id);
    await _secretsService.delete(vaultModel.filesystemPath);
    await _vaultsRepository.deleteById(id);
  }
}

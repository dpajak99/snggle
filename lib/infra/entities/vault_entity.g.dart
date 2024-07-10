// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVaultEntityCollection on Isar {
  IsarCollection<VaultEntity> get vaults => this.collection();
}

const VaultEntitySchema = CollectionSchema(
  name: r'VaultEntity',
  id: 3836971811035980723,
  properties: {
    r'encrypted': PropertySchema(
      id: 0,
      name: r'encrypted',
      type: IsarType.bool,
    ),
    r'filesystemPathString': PropertySchema(
      id: 1,
      name: r'filesystemPathString',
      type: IsarType.string,
    ),
    r'index': PropertySchema(
      id: 2,
      name: r'index',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'pinned': PropertySchema(
      id: 4,
      name: r'pinned',
      type: IsarType.bool,
    )
  },
  estimateSize: _vaultEntityEstimateSize,
  serialize: _vaultEntitySerialize,
  deserialize: _vaultEntityDeserialize,
  deserializeProp: _vaultEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'encrypted': IndexSchema(
      id: -5171473955020626441,
      name: r'encrypted',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'encrypted',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'pinned': IndexSchema(
      id: -8913717909547348198,
      name: r'pinned',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'pinned',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'index': IndexSchema(
      id: -5425839060849557016,
      name: r'index',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'index',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'filesystemPathString': IndexSchema(
      id: 4339951643106715750,
      name: r'filesystemPathString',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'filesystemPathString',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _vaultEntityGetId,
  getLinks: _vaultEntityGetLinks,
  attach: _vaultEntityAttach,
  version: '3.1.0+1',
);

int _vaultEntityEstimateSize(
  VaultEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.filesystemPathString.length * 3;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _vaultEntitySerialize(
  VaultEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.encrypted);
  writer.writeString(offsets[1], object.filesystemPathString);
  writer.writeLong(offsets[2], object.index);
  writer.writeString(offsets[3], object.name);
  writer.writeBool(offsets[4], object.pinned);
}

VaultEntity _vaultEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VaultEntity(
    encrypted: reader.readBool(offsets[0]),
    filesystemPathString: reader.readString(offsets[1]),
    index: reader.readLong(offsets[2]),
    name: reader.readStringOrNull(offsets[3]),
    pinned: reader.readBool(offsets[4]),
  );
  return object;
}

P _vaultEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _vaultEntityGetId(VaultEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vaultEntityGetLinks(VaultEntity object) {
  return [];
}

void _vaultEntityAttach(
    IsarCollection<dynamic> col, Id id, VaultEntity object) {}

extension VaultEntityQueryWhereSort
    on QueryBuilder<VaultEntity, VaultEntity, QWhere> {
  QueryBuilder<VaultEntity, VaultEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhere> anyEncrypted() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'encrypted'),
      );
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhere> anyPinned() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'pinned'),
      );
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhere> anyIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'index'),
      );
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhere>
      anyFilesystemPathString() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'filesystemPathString'),
      );
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhere> anyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'name'),
      );
    });
  }
}

extension VaultEntityQueryWhere
    on QueryBuilder<VaultEntity, VaultEntity, QWhereClause> {
  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> encryptedEqualTo(
      bool encrypted) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'encrypted',
        value: [encrypted],
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> encryptedNotEqualTo(
      bool encrypted) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'encrypted',
              lower: [],
              upper: [encrypted],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'encrypted',
              lower: [encrypted],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'encrypted',
              lower: [encrypted],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'encrypted',
              lower: [],
              upper: [encrypted],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> pinnedEqualTo(
      bool pinned) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pinned',
        value: [pinned],
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> pinnedNotEqualTo(
      bool pinned) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pinned',
              lower: [],
              upper: [pinned],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pinned',
              lower: [pinned],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pinned',
              lower: [pinned],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pinned',
              lower: [],
              upper: [pinned],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> indexEqualTo(
      int index) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'index',
        value: [index],
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> indexNotEqualTo(
      int index) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'index',
              lower: [],
              upper: [index],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'index',
              lower: [index],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'index',
              lower: [index],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'index',
              lower: [],
              upper: [index],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> indexGreaterThan(
    int index, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'index',
        lower: [index],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> indexLessThan(
    int index, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'index',
        lower: [],
        upper: [index],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> indexBetween(
    int lowerIndex,
    int upperIndex, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'index',
        lower: [lowerIndex],
        includeLower: includeLower,
        upper: [upperIndex],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause>
      filesystemPathStringEqualTo(String filesystemPathString) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'filesystemPathString',
        value: [filesystemPathString],
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause>
      filesystemPathStringNotEqualTo(String filesystemPathString) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'filesystemPathString',
              lower: [],
              upper: [filesystemPathString],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'filesystemPathString',
              lower: [filesystemPathString],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'filesystemPathString',
              lower: [filesystemPathString],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'filesystemPathString',
              lower: [],
              upper: [filesystemPathString],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause>
      filesystemPathStringGreaterThan(
    String filesystemPathString, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'filesystemPathString',
        lower: [filesystemPathString],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause>
      filesystemPathStringLessThan(
    String filesystemPathString, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'filesystemPathString',
        lower: [],
        upper: [filesystemPathString],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause>
      filesystemPathStringBetween(
    String lowerFilesystemPathString,
    String upperFilesystemPathString, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'filesystemPathString',
        lower: [lowerFilesystemPathString],
        includeLower: includeLower,
        upper: [upperFilesystemPathString],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause>
      filesystemPathStringStartsWith(String FilesystemPathStringPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'filesystemPathString',
        lower: [FilesystemPathStringPrefix],
        upper: ['$FilesystemPathStringPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause>
      filesystemPathStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'filesystemPathString',
        value: [''],
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause>
      filesystemPathStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'filesystemPathString',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'filesystemPathString',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'filesystemPathString',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'filesystemPathString',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [null],
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> nameEqualTo(
      String? name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> nameNotEqualTo(
      String? name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> nameGreaterThan(
    String? name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [name],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> nameLessThan(
    String? name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [],
        upper: [name],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> nameBetween(
    String? lowerName,
    String? upperName, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [lowerName],
        includeLower: includeLower,
        upper: [upperName],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> nameStartsWith(
      String NamePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [NamePrefix],
        upper: ['$NamePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [''],
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterWhereClause> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'name',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'name',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'name',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'name',
              upper: [''],
            ));
      }
    });
  }
}

extension VaultEntityQueryFilter
    on QueryBuilder<VaultEntity, VaultEntity, QFilterCondition> {
  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition>
      encryptedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encrypted',
        value: value,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition>
      filesystemPathStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filesystemPathString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition>
      filesystemPathStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'filesystemPathString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition>
      filesystemPathStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'filesystemPathString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition>
      filesystemPathStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'filesystemPathString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition>
      filesystemPathStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'filesystemPathString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition>
      filesystemPathStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'filesystemPathString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition>
      filesystemPathStringContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'filesystemPathString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition>
      filesystemPathStringMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'filesystemPathString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition>
      filesystemPathStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filesystemPathString',
        value: '',
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition>
      filesystemPathStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'filesystemPathString',
        value: '',
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition> indexEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition>
      indexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition> indexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition> indexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'index',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterFilterCondition> pinnedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pinned',
        value: value,
      ));
    });
  }
}

extension VaultEntityQueryObject
    on QueryBuilder<VaultEntity, VaultEntity, QFilterCondition> {}

extension VaultEntityQueryLinks
    on QueryBuilder<VaultEntity, VaultEntity, QFilterCondition> {}

extension VaultEntityQuerySortBy
    on QueryBuilder<VaultEntity, VaultEntity, QSortBy> {
  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy> sortByEncrypted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encrypted', Sort.asc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy> sortByEncryptedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encrypted', Sort.desc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy>
      sortByFilesystemPathString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filesystemPathString', Sort.asc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy>
      sortByFilesystemPathStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filesystemPathString', Sort.desc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy> sortByIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.asc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy> sortByIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.desc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy> sortByPinned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinned', Sort.asc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy> sortByPinnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinned', Sort.desc);
    });
  }
}

extension VaultEntityQuerySortThenBy
    on QueryBuilder<VaultEntity, VaultEntity, QSortThenBy> {
  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy> thenByEncrypted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encrypted', Sort.asc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy> thenByEncryptedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encrypted', Sort.desc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy>
      thenByFilesystemPathString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filesystemPathString', Sort.asc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy>
      thenByFilesystemPathStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filesystemPathString', Sort.desc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy> thenByIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.asc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy> thenByIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.desc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy> thenByPinned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinned', Sort.asc);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QAfterSortBy> thenByPinnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinned', Sort.desc);
    });
  }
}

extension VaultEntityQueryWhereDistinct
    on QueryBuilder<VaultEntity, VaultEntity, QDistinct> {
  QueryBuilder<VaultEntity, VaultEntity, QDistinct> distinctByEncrypted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'encrypted');
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QDistinct>
      distinctByFilesystemPathString({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'filesystemPathString',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QDistinct> distinctByIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'index');
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VaultEntity, VaultEntity, QDistinct> distinctByPinned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pinned');
    });
  }
}

extension VaultEntityQueryProperty
    on QueryBuilder<VaultEntity, VaultEntity, QQueryProperty> {
  QueryBuilder<VaultEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VaultEntity, bool, QQueryOperations> encryptedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'encrypted');
    });
  }

  QueryBuilder<VaultEntity, String, QQueryOperations>
      filesystemPathStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filesystemPathString');
    });
  }

  QueryBuilder<VaultEntity, int, QQueryOperations> indexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'index');
    });
  }

  QueryBuilder<VaultEntity, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<VaultEntity, bool, QQueryOperations> pinnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pinned');
    });
  }
}

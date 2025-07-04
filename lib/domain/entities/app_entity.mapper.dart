// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'app_entity.dart';

class AppEntityMapper extends ClassMapperBase<AppEntity> {
  AppEntityMapper._();

  static AppEntityMapper? _instance;
  static AppEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppEntityMapper._());
      MapperContainer.globals.useAll([UriDataMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'AppEntity';

  static String _$name(AppEntity v) => v.name;
  static const Field<AppEntity, String> _f$name = Field('name', _$name);
  static UriData _$icon(AppEntity v) => v.icon;
  static const Field<AppEntity, UriData> _f$icon = Field('icon', _$icon);
  static String _$target(AppEntity v) => v.target;
  static const Field<AppEntity, String> _f$target = Field('target', _$target);

  @override
  final MappableFields<AppEntity> fields = const {
    #name: _f$name,
    #icon: _f$icon,
    #target: _f$target,
  };
  @override
  final bool ignoreNull = true;

  static AppEntity _instantiate(DecodingData data) {
    return AppEntity(
        name: data.dec(_f$name),
        icon: data.dec(_f$icon),
        target: data.dec(_f$target));
  }

  @override
  final Function instantiate = _instantiate;

  static AppEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppEntity>(map);
  }

  static AppEntity fromJson(String json) {
    return ensureInitialized().decodeJson<AppEntity>(json);
  }
}

mixin AppEntityMappable {
  String toJson() {
    return AppEntityMapper.ensureInitialized()
        .encodeJson<AppEntity>(this as AppEntity);
  }

  Map<String, dynamic> toMap() {
    return AppEntityMapper.ensureInitialized()
        .encodeMap<AppEntity>(this as AppEntity);
  }

  AppEntityCopyWith<AppEntity, AppEntity, AppEntity> get copyWith =>
      _AppEntityCopyWithImpl<AppEntity, AppEntity>(
          this as AppEntity, $identity, $identity);
  @override
  String toString() {
    return AppEntityMapper.ensureInitialized()
        .stringifyValue(this as AppEntity);
  }

  @override
  bool operator ==(Object other) {
    return AppEntityMapper.ensureInitialized()
        .equalsValue(this as AppEntity, other);
  }

  @override
  int get hashCode {
    return AppEntityMapper.ensureInitialized().hashValue(this as AppEntity);
  }
}

extension AppEntityValueCopy<$R, $Out> on ObjectCopyWith<$R, AppEntity, $Out> {
  AppEntityCopyWith<$R, AppEntity, $Out> get $asAppEntity =>
      $base.as((v, t, t2) => _AppEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppEntityCopyWith<$R, $In extends AppEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, UriData? icon, String? target});
  AppEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AppEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppEntity, $Out>
    implements AppEntityCopyWith<$R, AppEntity, $Out> {
  _AppEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppEntity> $mapper =
      AppEntityMapper.ensureInitialized();
  @override
  $R call({String? name, UriData? icon, String? target}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (icon != null) #icon: icon,
        if (target != null) #target: target
      }));
  @override
  AppEntity $make(CopyWithData data) => AppEntity(
      name: data.get(#name, or: $value.name),
      icon: data.get(#icon, or: $value.icon),
      target: data.get(#target, or: $value.target));

  @override
  AppEntityCopyWith<$R2, AppEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AppEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

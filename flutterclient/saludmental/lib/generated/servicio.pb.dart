///
//  Generated code. Do not modify.
//  source: servicio.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class Encuesta extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Encuesta', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'desinteresDiversion')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fracasado')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'irritado')
    ..hasRequiredFields = false
  ;

  Encuesta._() : super();
  factory Encuesta({
    $fixnum.Int64? desinteresDiversion,
    $fixnum.Int64? fracasado,
    $fixnum.Int64? irritado,
  }) {
    final _result = create();
    if (desinteresDiversion != null) {
      _result.desinteresDiversion = desinteresDiversion;
    }
    if (fracasado != null) {
      _result.fracasado = fracasado;
    }
    if (irritado != null) {
      _result.irritado = irritado;
    }
    return _result;
  }
  factory Encuesta.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Encuesta.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Encuesta clone() => Encuesta()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Encuesta copyWith(void Function(Encuesta) updates) => super.copyWith((message) => updates(message as Encuesta)) as Encuesta; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Encuesta create() => Encuesta._();
  Encuesta createEmptyInstance() => create();
  static $pb.PbList<Encuesta> createRepeated() => $pb.PbList<Encuesta>();
  @$core.pragma('dart2js:noInline')
  static Encuesta getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Encuesta>(create);
  static Encuesta? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get desinteresDiversion => $_getI64(0);
  @$pb.TagNumber(1)
  set desinteresDiversion($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDesinteresDiversion() => $_has(0);
  @$pb.TagNumber(1)
  void clearDesinteresDiversion() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get fracasado => $_getI64(1);
  @$pb.TagNumber(2)
  set fracasado($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFracasado() => $_has(1);
  @$pb.TagNumber(2)
  void clearFracasado() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get irritado => $_getI64(2);
  @$pb.TagNumber(3)
  set irritado($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIrritado() => $_has(2);
  @$pb.TagNumber(3)
  void clearIrritado() => clearField(3);
}

class EncuestaConfirmation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EncuestaConfirmation', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'prediccion')
    ..hasRequiredFields = false
  ;

  EncuestaConfirmation._() : super();
  factory EncuestaConfirmation({
    $fixnum.Int64? prediccion,
  }) {
    final _result = create();
    if (prediccion != null) {
      _result.prediccion = prediccion;
    }
    return _result;
  }
  factory EncuestaConfirmation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EncuestaConfirmation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EncuestaConfirmation clone() => EncuestaConfirmation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EncuestaConfirmation copyWith(void Function(EncuestaConfirmation) updates) => super.copyWith((message) => updates(message as EncuestaConfirmation)) as EncuestaConfirmation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EncuestaConfirmation create() => EncuestaConfirmation._();
  EncuestaConfirmation createEmptyInstance() => create();
  static $pb.PbList<EncuestaConfirmation> createRepeated() => $pb.PbList<EncuestaConfirmation>();
  @$core.pragma('dart2js:noInline')
  static EncuestaConfirmation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EncuestaConfirmation>(create);
  static EncuestaConfirmation? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get prediccion => $_getI64(0);
  @$pb.TagNumber(1)
  set prediccion($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPrediccion() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrediccion() => clearField(1);
}

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Empty', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Empty._() : super();
  factory Empty() => create();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}


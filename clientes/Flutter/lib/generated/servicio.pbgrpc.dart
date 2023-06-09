///
//  Generated code. Do not modify.
//  source: servicio.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'servicio.pb.dart' as $0;
export 'servicio.pb.dart';

class SaludMentalClient extends $grpc.Client {
  static final _$isReady = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/SaludMental/IsReady',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$registerEncuesta =
      $grpc.ClientMethod<$0.Encuesta, $0.EncuestaConfirmation>(
          '/SaludMental/RegisterEncuesta',
          ($0.Encuesta value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.EncuestaConfirmation.fromBuffer(value));

  SaludMentalClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Empty> isReady($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$isReady, request, options: options);
  }

  $grpc.ResponseFuture<$0.EncuestaConfirmation> registerEncuesta(
      $0.Encuesta request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$registerEncuesta, request, options: options);
  }
}

abstract class SaludMentalServiceBase extends $grpc.Service {
  $core.String get $name => 'SaludMental';

  SaludMentalServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'IsReady',
        isReady_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Encuesta, $0.EncuestaConfirmation>(
        'RegisterEncuesta',
        registerEncuesta_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Encuesta.fromBuffer(value),
        ($0.EncuestaConfirmation value) => value.writeToBuffer()));
  }

  $async.Future<$0.Empty> isReady_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return isReady(call, await request);
  }

  $async.Future<$0.EncuestaConfirmation> registerEncuesta_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Encuesta> request) async {
    return registerEncuesta(call, await request);
  }

  $async.Future<$0.Empty> isReady($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.EncuestaConfirmation> registerEncuesta(
      $grpc.ServiceCall call, $0.Encuesta request);
}

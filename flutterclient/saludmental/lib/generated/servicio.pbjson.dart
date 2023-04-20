///
//  Generated code. Do not modify.
//  source: servicio.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use encuestaDescriptor instead')
const Encuesta$json = const {
  '1': 'Encuesta',
  '2': const [
    const {'1': 'desinteres_diversion', '3': 1, '4': 1, '5': 3, '10': 'desinteresDiversion'},
    const {'1': 'fracasado', '3': 2, '4': 1, '5': 3, '10': 'fracasado'},
    const {'1': 'irritado', '3': 3, '4': 1, '5': 3, '10': 'irritado'},
  ],
};

/// Descriptor for `Encuesta`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List encuestaDescriptor = $convert.base64Decode('CghFbmN1ZXN0YRIxChRkZXNpbnRlcmVzX2RpdmVyc2lvbhgBIAEoA1ITZGVzaW50ZXJlc0RpdmVyc2lvbhIcCglmcmFjYXNhZG8YAiABKANSCWZyYWNhc2FkbxIaCghpcnJpdGFkbxgDIAEoA1IIaXJyaXRhZG8=');
@$core.Deprecated('Use encuestaConfirmationDescriptor instead')
const EncuestaConfirmation$json = const {
  '1': 'EncuestaConfirmation',
  '2': const [
    const {'1': 'prediccion', '3': 1, '4': 1, '5': 3, '10': 'prediccion'},
  ],
};

/// Descriptor for `EncuestaConfirmation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List encuestaConfirmationDescriptor = $convert.base64Decode('ChRFbmN1ZXN0YUNvbmZpcm1hdGlvbhIeCgpwcmVkaWNjaW9uGAEgASgDUgpwcmVkaWNjaW9u');
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eQ==');

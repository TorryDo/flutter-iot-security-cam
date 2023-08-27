import 'dart:typed_data';

import 'package:flutter_iot_security_cam/src/domain/qr_access/model/qrdata.dart';

abstract class QrAccessRepository{

  Future<ByteData> createQrData(QrData qrData);

  Future<bool> deleteQrData(String code);

  Future<bool> updateQrData(QrData qrData);

  Stream<List<QrData>> subscribeQrDataList();

}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authoriz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthrizData _$AuthrizDataFromJson(Map<String, dynamic> json) {
  return AuthrizData(
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AuthrizDataToJson(AuthrizData instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      activeLearning: json['activeLearning'] as int,
      showCellerPhone: json['showCellerPhone'] as int,
      enableBaseFunc: json['enableBaseFunc'] as int,
      httpPort: json['httpPort'] as String,
      loginRange: json['loginRange'] as int,
      roleID: json['roleID'] as int,
      isFlow: json['isFlow'] as int,
      isFlowVipBinding: json['isFlowVipBinding'] as int,
      userCode: json['userCode'] as String,
      cellerShopRights: json['cellerShopRights'] == null
          ? null
          : CellerShopRights.fromJson(
              json['cellerShopRights'] as Map<String, dynamic>),
      fineReport: json['fineReport'] == null
          ? null
          : FineReport.fromJson(json['fineReport'] as Map<String, dynamic>),
      onlySelfInfo: json['onlySelfInfo'] == null
          ? null
          : OnlySelfInfo.fromJson(json['onlySelfInfo'] as Map<String, dynamic>),
      notify: json['notify'] == null
          ? null
          : Notify.fromJson(json['notify'] as Map<String, dynamic>),
      allowLogin: json['allowLogin'] as int,
      msg: json['msg']);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'activeLearning': instance.activeLearning,
      'showCellerPhone': instance.showCellerPhone,
      'enableBaseFunc': instance.enableBaseFunc,
      'httpPort': instance.httpPort,
      'loginRange': instance.loginRange,
      'roleID': instance.roleID,
      'isFlow': instance.isFlow,
      'isFlowVipBinding': instance.isFlowVipBinding,
      'userCode': instance.userCode,
      'cellerShopRights': instance.cellerShopRights,
      'fineReport': instance.fineReport,
      'onlySelfInfo': instance.onlySelfInfo,
      'notify': instance.notify,
      'allowLogin': instance.allowLogin,
      'msg': instance.msg
    };

FineReport _$FineReportFromJson(Map<String, dynamic> json) {
  return FineReport(
      enabledFineReport: json['enabledFineReport'] as int,
      fineReportUrl: json['fineReportUrl'] as String,
      isERPAshore: json['isERPAshore'] as int);
}

Map<String, dynamic> _$FineReportToJson(FineReport instance) =>
    <String, dynamic>{
      'enabledFineReport': instance.enabledFineReport,
      'fineReportUrl': instance.fineReportUrl,
      'isERPAshore': instance.isERPAshore
    };

OnlySelfInfo _$OnlySelfInfoFromJson(Map<String, dynamic> json) {
  return OnlySelfInfo(
      eRPMTarget: json['eRPMTarget'] as int,
      eRPMTheClerkPerformance: json['eRPMTheClerkPerformance'] as int,
      eRPMTheDDsales: json['eRPMTheDDsales'] as int);
}

Map<String, dynamic> _$OnlySelfInfoToJson(OnlySelfInfo instance) =>
    <String, dynamic>{
      'eRPMTarget': instance.eRPMTarget,
      'eRPMTheClerkPerformance': instance.eRPMTheClerkPerformance,
      'eRPMTheDDsales': instance.eRPMTheDDsales
    };

Notify _$NotifyFromJson(Map<String, dynamic> json) {
  return Notify(
      shoud: json['shoud'] as int,
      items: (json['items'] as List)
          ?.map((e) =>
              e == null ? null : Items.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$NotifyToJson(Notify instance) =>
    <String, dynamic>{'shoud': instance.shoud, 'items': instance.items};

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(
      productId: json['productId'] as int,
      status: json['status'] as int,
      display: json['display'] as String);
}

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'productId': instance.productId,
      'status': instance.status,
      'display': instance.display
    };

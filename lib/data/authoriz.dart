import "package:json_annotation/json_annotation.dart";
part 'authoriz.g.dart';
@JsonSerializable()
class AuthrizData  {
  Status status;
  Data data;

   @JsonKey(nullable: false)
  AuthrizData({this.status, this.data});

  AuthrizData.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}
class Status {
  int code;
  Null message;

  Status({this.code, this.message});

  Status.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}
@JsonSerializable()
class Data {
  int activeLearning;
  int showCellerPhone;
  int enableBaseFunc;
  String httpPort;
  int loginRange;
  int roleID;
  int isFlow;
  int isFlowVipBinding;
  String userCode;
  CellerShopRights cellerShopRights;
  FineReport fineReport;
  OnlySelfInfo onlySelfInfo;
  Notify notify;
  int allowLogin;
  dynamic msg;

  Data(
      {this.activeLearning,
      this.showCellerPhone,
      this.enableBaseFunc,
      this.httpPort,
      this.loginRange,
      this.roleID,
      this.isFlow,
      this.isFlowVipBinding,
      this.userCode,
      this.cellerShopRights,
      this.fineReport,
      this.onlySelfInfo,
      this.notify,
      this.allowLogin,
      this.msg});

  Data.fromJson(Map<String, dynamic> json) {
    activeLearning = json['ActiveLearning'];
    showCellerPhone = json['ShowCellerPhone'];
    enableBaseFunc = json['EnableBaseFunc'];
    httpPort = json['HttpPort'];
    loginRange = json['LoginRange'];
    roleID = json['RoleID'];
    isFlow = json['IsFlow'];
    isFlowVipBinding = json['IsFlowVipBinding'];
    userCode = json['UserCode'];
    cellerShopRights = json['CellerShopRights'] != null
        ? new CellerShopRights.fromJson(json['CellerShopRights'])
        : null;
    fineReport = json['FineReport'] != null
        ? new FineReport.fromJson(json['FineReport'])
        : null;
    onlySelfInfo = json['OnlySelfInfo'] != null
        ? new OnlySelfInfo.fromJson(json['OnlySelfInfo'])
        : null;
    notify =
        json['Notify'] != null ? new Notify.fromJson(json['Notify']) : null;
    allowLogin = json['AllowLogin'];
    msg = json['Msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ActiveLearning'] = this.activeLearning;
    data['ShowCellerPhone'] = this.showCellerPhone;
    data['EnableBaseFunc'] = this.enableBaseFunc;
    data['HttpPort'] = this.httpPort;
    data['LoginRange'] = this.loginRange;
    data['RoleID'] = this.roleID;
    data['IsFlow'] = this.isFlow;
    data['IsFlowVipBinding'] = this.isFlowVipBinding;
    data['UserCode'] = this.userCode;
    if (this.cellerShopRights != null) {
      data['CellerShopRights'] = this.cellerShopRights.toJson();
    }
    if (this.fineReport != null) {
      data['FineReport'] = this.fineReport.toJson();
    }
    if (this.onlySelfInfo != null) {
      data['OnlySelfInfo'] = this.onlySelfInfo.toJson();
    }
    if (this.notify != null) {
      data['Notify'] = this.notify.toJson();
    }
    data['AllowLogin'] = this.allowLogin;
    data['Msg'] = this.msg;
    return data;
  }
}

class CellerShopRights {
  int celler;
  int goodRanking;
  int ranking;
  int specialTarget;

  CellerShopRights(
      {this.celler, this.goodRanking, this.ranking, this.specialTarget});

  CellerShopRights.fromJson(Map<String, dynamic> json) {
    celler = json['Celler'];
    goodRanking = json['Good_ranking'];
    ranking = json['Ranking'];
    specialTarget = json['SpecialTarget'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Celler'] = this.celler;
    data['Good_ranking'] = this.goodRanking;
    data['Ranking'] = this.ranking;
    data['SpecialTarget'] = this.specialTarget;
    return data;
  }
}
@JsonSerializable()
class FineReport {
  int enabledFineReport;
  String fineReportUrl;
  int isERPAshore;

  FineReport({this.enabledFineReport, this.fineReportUrl, this.isERPAshore});

  FineReport.fromJson(Map<String, dynamic> json) {
    enabledFineReport = json['EnabledFineReport'];
    fineReportUrl = json['FineReportUrl'];
    isERPAshore = json['IsERPAshore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EnabledFineReport'] = this.enabledFineReport;
    data['FineReportUrl'] = this.fineReportUrl;
    data['IsERPAshore'] = this.isERPAshore;
    return data;
  }
}
@JsonSerializable()
class OnlySelfInfo {
  int eRPMTarget;
  int eRPMTheClerkPerformance;
  int eRPMTheDDsales;

  OnlySelfInfo(
      {this.eRPMTarget, this.eRPMTheClerkPerformance, this.eRPMTheDDsales});

  OnlySelfInfo.fromJson(Map<String, dynamic> json) {
    eRPMTarget = json['ERPM_Target'];
    eRPMTheClerkPerformance = json['ERPM_TheClerkPerformance'];
    eRPMTheDDsales = json['ERPM_TheDDsales'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ERPM_Target'] = this.eRPMTarget;
    data['ERPM_TheClerkPerformance'] = this.eRPMTheClerkPerformance;
    data['ERPM_TheDDsales'] = this.eRPMTheDDsales;
    return data;
  }
}
@JsonSerializable()
class Notify {
  int shoud;
  List<Items> items;

  Notify({this.shoud, this.items});

  Notify.fromJson(Map<String, dynamic> json) {
    shoud = json['Shoud'];
    if (json['Items'] != null) {
      items = new List<Items>();
      json['Items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Shoud'] = this.shoud;
    if (this.items != null) {
      data['Items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
@JsonSerializable()
class Items {
  int productId;
  int status;
  String display;

  Items({this.productId, this.status, this.display});

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['ProductId'];
    status = json['Status'];
    display = json['Display'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductId'] = this.productId;
    data['Status'] = this.status;
    data['Display'] = this.display;
    return data;
  }
}




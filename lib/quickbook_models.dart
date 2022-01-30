import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quickbook_models.g.dart';

@JsonSerializable(includeIfNull: false)
class Account {

  @JsonKey(name: 'Id', required: true)
  final String? id;

  @JsonKey(name: "Name", required: true)
  final String? name;

  @JsonKey(name: "SyncToken")
  final String? syncToken;

  @JsonKey(name: "AcctNum")
  final String? acctNum;

  @JsonKey(name: "CurrencyRef")
  final CurrencyRefType? currencyRef;

  @JsonKey(name: "ParentRef")
  final ReferenceType? parentRef;

  @JsonKey(name: "Description")
  final String? description;

  @JsonKey(name: "Active")
  final bool? active;

  @JsonKey(name: "MetaData")
  final ModificationMetaData? metaData;

  @JsonKey(name: "CreateTime")
  final DateTime? createTime;

  @JsonKey(name: "LastUpdatedTime")
  final DateTime? lastUpdatedTime;

  @JsonKey(name: "SubAccount")
  final bool? subAccount;

  @JsonKey(name: "Classification")
  final String? classification;

  @JsonKey(name: "FullyQualifiedName")
  final String? fullyQualifiedName;

  @JsonKey(name: "TxnLocationType")
  final String? txnLocationType;

  @JsonKey(name: "AccountType")
  final String? accountType;

  @JsonKey(name: "CurrentBalanceWithSubAccounts")
  final double? currentBalanceWithSubAccounts;

  @JsonKey(name: "AccountAlias")
  final String? accountAlias;

  @JsonKey(name: "TaxCodeRef")
  final ReferenceType? taxCodeRef;

  @JsonKey(name: "AccountSubType")
  final String? accountSubType;

  @JsonKey(name: "CurrentBalance")
  double? currentBalance;



  Account({this.id, this.name,
    this.accountAlias, this.accountSubType,
    this.accountType, this.acctNum, this.active,
    this.classification, this.createTime, this.currencyRef,
  this.currentBalance, this.currentBalanceWithSubAccounts, this.description,
    this.fullyQualifiedName, this.lastUpdatedTime, this.metaData,
    this.parentRef, this.subAccount, this.syncToken, this.taxCodeRef,
    this.txnLocationType
  });

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CurrencyRefType {

  final String value;

  final String? name;

  CurrencyRefType({required this.value, this.name});

  factory CurrencyRefType.fromJson(Map<String, dynamic> json) => _$CurrencyRefTypeFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyRefTypeToJson(this);
}

@JsonSerializable(includeIfNull: false)
class ReferenceType{

  final String value;

  final String? name;

  ReferenceType({required this.value, this.name});

  factory ReferenceType.fromJson(Map<String, dynamic> json) => _$ReferenceTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ReferenceTypeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

@JsonSerializable(includeIfNull: false)
class ModificationMetaData {

  @JsonKey(name: "SubAccount")
  final bool? subAccount;

  @JsonKey(name: "Classification")
  final String? classification;

  @JsonKey(name: "FullyQualifiedName")
  final String? fullyQualifiedName;

  ModificationMetaData({this.subAccount, this.classification, this.fullyQualifiedName});

  factory ModificationMetaData.fromJson(Map<String, dynamic> json) => _$ModificationMetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$ModificationMetaDataToJson(this);

}

@JsonSerializable(includeIfNull: false)
class DateTime {

    final String dateTime;

    DateTime({required this.dateTime});

    factory DateTime.fromJson(Map<String, dynamic> json) => _$DateTimeFromJson(json);

    Map<String, dynamic> toJson() => _$DateTimeToJson(this);

}

/* TODO
enum AccountTypeEnum {

}

 */

@JsonSerializable(includeIfNull: false)
class Bill {

    @JsonKey(name: "Id")
    final String? id;

    @JsonKey(name: "VendorRef")
    final ReferenceType? vendorRef;

    @JsonKey(name: "Line")
    @_LineConverter()
    final List<Line>? line;

    @JsonKey(name: "SyncToken")
    final String? syncToken;

    @JsonKey(name: "CurrencyRef")
    final CurrencyRefType? currencyRef;

    @JsonKey(name: "TxnDate")
    final String? txnDate;

    @JsonKey(name: "APAccountRef")
    final ReferenceType? aPAccountRef;

    @JsonKey(name: "SalesTermRef")
    final ReferenceType? salesTermRef;

    @JsonKey(name: "LinkedTxn")
    final List<LinkedTxn>? linkedTxn;

    @JsonKey(name: "GlobalTaxCalculation")
    final GlobalTaxCalculationEnum? globalTaxCalculation;

    @JsonKey(name: "TotalAmt")
    final double? totalAmt;

    @JsonKey(name: "TransactionLocationType")
    final String? transactionLocationType;

    @JsonKey(name: "DueDate")
    final String? dueDate;

    @JsonKey(name: "MetaData")
    final ModificationMetaData ? metaData;

    @JsonKey(name: "DocNumber")
    final String? docNumber;

    @JsonKey(name: "PrivateNote")
    final String? privateNote;

    @JsonKey(name: "TxnTaxDetail")
    final TxnTaxDetail? txnTaxDetail;

    @JsonKey(name: "ExchangeRate")
    final double? exchangeRate;

    @JsonKey(name: "DepartmentRef")
    final ReferenceType? departmentRef;

    @JsonKey(name: "IncludeInAnnualTPAR")
    final bool? includeInAnnualTPAR;

    @JsonKey(name: "HomeBalance")
    final double? homeBalance;

    @JsonKey(name: "RecurDataRef")
    final ReferenceType? recurDataRef;

    @JsonKey(name: "Balance")
    final double? balance;

    Bill({this.txnDate, this.linkedTxn, this.aPAccountRef,
      this.currencyRef, this.syncToken, this.id, this.metaData,
      this.balance, this.departmentRef,
    this.docNumber, this.dueDate, this.exchangeRate, this.globalTaxCalculation,
    this.homeBalance, this.includeInAnnualTPAR, this.line, this.privateNote, this.recurDataRef,
      this.salesTermRef, this.totalAmt, this.transactionLocationType, this.txnTaxDetail,
      this.vendorRef
    });

    factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);

    Map<String, dynamic> toJson() => _$BillToJson(this);

    @override
  String toString() {
    return toJson().toString();
  }
}

class _LineConverter implements JsonConverter<Line, Object?> {
  const _LineConverter();

  @override
  Line fromJson(Object? json) {
    if (json is Map<String, dynamic> &&
        json.containsKey('DetailType')) {
      if (json["DetailType"] == "ItemBasedExpenseLineDetail") {
        return ItemBasedExpenseLine.fromJson(json);
      }
      else if (json["DetailType"] == "AccountBasedExpenseLineDetail") {
        return AccountBasedExpenseLine.fromJson(json);
      }
      else if (json["DetailType"] == "SalesItemLineDetail") {
        return SalesItemLine.fromJson(json);
      }
      else if (json["DetailType"] == "GroupLineDetail") {
        return GroupLine.fromJson(json);
      }
      else if (json["DetailType"] == "DescriptionOnly") {
        return DescriptionOnlyLine.fromJson(json);
      }
      else if (json["DetailType"] == "DiscountLineDetail") {
        return DiscountLine.fromJson(json);
      }
      else if (json["DetailType"] == "SubTotalLineDetail") {
        return SubTotalLine.fromJson(json);
      }

      print ("Unable to parse $json - ${json["DetailType"] }");
    }


    print ("Unable to parse $json }");
    // This will only work if `json` is a native JSON type:
    //   num, String, bool, null, etc
    // *and* is assignable to `T`.
    return Line();
  }

  // This will only work if `object` is a native JSON type:
  //   num, String, bool, null, etc
  // Or if it has a `toJson()` function`.
  @override
  Object? toJson(Line? object) {
    if (object is ItemBasedExpenseLine) {
      return object.toJson();
    }
    else if (object is AccountBasedExpenseLine) {
      return object.toJson();
    }
    else if (object is SalesItemLine) {
      return object.toJson();
    }
    else if (object is GroupLine) {
      return object.toJson();
    }
    else if (object is DescriptionOnlyLine) {
      return object.toJson();
    }
    else if (object is DiscountLine) {
      return object.toJson();
    }
    else if (object is SubTotalLine) {
      return object.toJson();
    }
    print ("Unable to convert $object");
    return null;
  }
}


class Line {

}

@JsonSerializable(includeIfNull: false)
class ItemBasedExpenseLine implements Line {

  @JsonKey(name: "Id")
  final String? id;

  @JsonKey(name: "ItemBasedExpenseLineDetail")
  final ItemBasedExpenseLineDetail? itemBasedExpenseLineDetail;

  @JsonKey(name: "Amount")
  final double? amount;

  @JsonKey(name: "DetailType")
  final String? detailType;

  // TODO : Missing from specs
  //LinkedTxn

  @JsonKey(name: "Description")
  final String? description;

  @JsonKey(name: "LineNum")
  final double? lineNum;

  ItemBasedExpenseLine({this.description, this.amount,
    this.detailType, this.id,
    this.itemBasedExpenseLineDetail,
    this.lineNum
  });

  factory ItemBasedExpenseLine.fromJson(Map<String, dynamic> json) => _$ItemBasedExpenseLineFromJson(json);

  Map<String, dynamic> toJson() => _$ItemBasedExpenseLineToJson(this);


}

@JsonSerializable(includeIfNull: false)
class ItemBasedExpenseLineDetail {
  // TODO
  @JsonKey(name: "TaxInclusiveAmt")
  final double? taxInclusiveAmt;

  @JsonKey(name: "ItemRef")
  final ReferenceType? itemRef;

  @JsonKey(name: "CustomerRef")
  final ReferenceType? customerRef;

  @JsonKey(name: "PriceLevelRef")
  final ReferenceType? priceLevelRef;

  @JsonKey(name: "ClassRef")
  final ReferenceType? classRef;

  @JsonKey(name: "TaxCodeRef")
  final ReferenceType? taxCodeRef;

  @JsonKey(name: "MarkupInfo")
  final MarkupInfo? markupInfo;

  @JsonKey(name: "BillableStatus")
  final BillableStatusEnum? billableStatus;

  @JsonKey(name: "Qty")
  final double? qty;

  @JsonKey(name: "UnitPrice")
  final double? unitPrice;

  ItemBasedExpenseLineDetail({this.taxCodeRef, this.billableStatus, this.classRef,
  this.customerRef, this.itemRef, this.markupInfo, this.priceLevelRef, this.qty,
  this.taxInclusiveAmt, this.unitPrice});

  factory ItemBasedExpenseLineDetail.fromJson(Map<String, dynamic> json) => _$ItemBasedExpenseLineDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ItemBasedExpenseLineDetailToJson(this);


}


@JsonSerializable(includeIfNull: false)
class AccountBasedExpenseLine implements Line {

  @JsonKey(name: "Id")
  final String? id;

  // Set to AccountBasedExpenseLineDetail for this type of line.
  @JsonKey(name: "DetailType")
  final String detailType;

  @JsonKey(name: "Amount")
  final double? amount;

  @JsonKey(name: "AccountBasedExpenseLineDetail")
  final AccountBasedExpense? accountBasedExpenseLineDetail;

  // TODO LinkedTxn

  @JsonKey(name: "Description")
  final String? description;

  @JsonKey(name: "Decimal")
  final int? decimal;


  AccountBasedExpenseLine({
    this.id, required this.detailType, this.amount, this.description, this.accountBasedExpenseLineDetail,
    this.decimal
});

  factory AccountBasedExpenseLine.fromJson(Map<String, dynamic> json) => _$AccountBasedExpenseLineFromJson(json);

  Map<String, dynamic> toJson() => _$AccountBasedExpenseLineToJson(this);

}

@JsonSerializable(includeIfNull: false)
class SalesItemLine implements Line {

  @JsonKey(name: "Id")
  final String? id;

  @JsonKey(name: "DetailType")
  final String? detailType; //SalesItemLineDetailfor

  @JsonKey(name: "SalesItemLineDetail")
  final SalesItemLineDetail? salesItemLineDetail;

  @JsonKey(name: "Amount")
  final double? amount;

  @JsonKey(name: "Description")
  final String? description;

  @JsonKey(name: "LineNum")
  final int? lineNum;

  SalesItemLine({
    this.id, this.detailType, this.amount, this.description,
    this.lineNum, this.salesItemLineDetail
  });

  factory SalesItemLine.fromJson(Map<String, dynamic> json) => _$SalesItemLineFromJson(json);

  Map<String, dynamic> toJson() => _$SalesItemLineToJson(this);

}

@JsonSerializable(includeIfNull: false)
class SalesItemLineDetail {

  @JsonKey(name: "TaxInclusiveAmt")
  final double? taxInclusiveAmt;

  @JsonKey(name: "DiscountAmt")
  final double? discountAmt;

  @JsonKey(name: "ItemRef")
  final ReferenceType? itemRef;

  @JsonKey(name: "ClassRef")
  final ReferenceType? classRef;

  @JsonKey(name: "TaxCodeRef")
  final ReferenceType? taxCodeRef;

  @JsonKey(name: "MarkupInfo")
  final MarkupInfo? markupInfo;

  @JsonKey(name: "ItemAccountRef")
  final ReferenceType? itemAccountRef;

  @JsonKey(name: "ServiceDate")
  final String? serviceDate;

  @JsonKey(name: "DiscountRate")
  final double? discountRate;

  @JsonKey(name: "Qty")
  final double? qty;

  @JsonKey(name: "UnitPrice")
  final double? unitPrice;

  @JsonKey(name: "TaxClassificationRef")
  final ReferenceType? taxClassificationRef;

  SalesItemLineDetail({
    this.classRef, this.taxCodeRef, this.markupInfo, this.taxInclusiveAmt,
    this.unitPrice, this.qty, this.itemRef, this.discountAmt,
    this.discountRate, this.itemAccountRef, this.serviceDate,
    this.taxClassificationRef
  });

  factory SalesItemLineDetail.fromJson(Map<String, dynamic> json) => _$SalesItemLineDetailFromJson(json);

  Map<String, dynamic> toJson() => _$SalesItemLineDetailToJson(this);
}

@JsonSerializable(includeIfNull: false)
class GroupLine implements Line {

  @JsonKey(name: "Id")
  final String? id;

  @JsonKey(name: "GroupLineDetail")
  final GroupLineDetail? groupLineDetail;

  @JsonKey(name: "DetailType")
  final String detailType; // GroupLineDetail

  @JsonKey(name: "LineNum")
  final int? lineNum;

  @JsonKey(name: "Description")
  final String? description;

  GroupLine({
    this.lineNum, this.description, required this.detailType,
    this.id, this.groupLineDetail
  });

  factory GroupLine.fromJson(Map<String, dynamic> json) => _$GroupLineFromJson(json);

  Map<String, dynamic> toJson() => _$GroupLineToJson(this);
}

@JsonSerializable(includeIfNull: false)
class GroupLineDetail {

  @JsonKey(name: "Quantity")
  final double? quantity;

  @JsonKey(name: "Line")
  @_LineConverter()
  final List<Line>? line;

  @JsonKey(name: "GroupItemRef")
  final ReferenceType? groupItemRef;

  GroupLineDetail({
    this.line, this.groupItemRef, this.quantity
  });

  factory GroupLineDetail.fromJson(Map<String, dynamic> json) => _$GroupLineDetailFromJson(json);

  Map<String, dynamic> toJson() => _$GroupLineDetailToJson(this);
}

@JsonSerializable(includeIfNull: false)
class DescriptionOnlyLine implements Line {

  @JsonKey(name: "Id")
  final String? id;

  @JsonKey(name: "DetailType")
  final String? detailType; //DescriptionOnly

  @JsonKey(name: "DescriptionLineDetail")
  final DescriptionLineDetail? descriptionLineDetail;

  @JsonKey(name: "Description")
  final String? description;

  @JsonKey(name: "LineNum")
  final int? lineNum;

  @JsonKey(name: "Amount")
  final double? amount;

  DescriptionOnlyLine({
    this.detailType, this.description, this.lineNum,
    this.amount, this.descriptionLineDetail, this.id
  });

  factory DescriptionOnlyLine.fromJson(Map<String, dynamic> json) => _$DescriptionOnlyLineFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionOnlyLineToJson(this);

}

@JsonSerializable(includeIfNull: false)
class DescriptionLineDetail {

  @JsonKey(name: "TaxCodeRef")
  final ReferenceType? taxCodeRef;

  @JsonKey(name: "ServiceDate")
  final String? serviceDate;

  DescriptionLineDetail({
    this.serviceDate, this.taxCodeRef
  });

  factory DescriptionLineDetail.fromJson(Map<String, dynamic> json) => _$DescriptionLineDetailFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionLineDetailToJson(this);
}

@JsonSerializable(includeIfNull: false)
class DiscountLine implements Line {

  @JsonKey(name: "Id")
  final String? id;

  @JsonKey(name: "DiscountLineDetail")
  final DiscountLineDetail? discountLineDetail;

  @JsonKey(name: "DetailType")
  final String? DetailType; // DiscountLineDetail

  @JsonKey(name: "Amount")
  final double? amount;

  @JsonKey(name: "Description")
  final String? description;

  @JsonKey(name: "LineNum")
  final int? lineNum;

  DiscountLine({
    this.amount, this.lineNum, this.description, this.id,
    this.DetailType, this.discountLineDetail
  });

  factory DiscountLine.fromJson(Map<String, dynamic> json) => _$DiscountLineFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountLineToJson(this);
}

@JsonSerializable(includeIfNull: false)
class DiscountLineDetail {

  @JsonKey(name: "ClassRef")
  final ReferenceType? classRef;

  @JsonKey(name: "TaxCodeRef")
  final ReferenceType? taxCodeRef;

  @JsonKey(name: "DiscountAccountRef")
  final ReferenceType? discountAccountRef;

  @JsonKey(name: "PercentBased")
  final bool? percentBased;

  @JsonKey(name: "DiscountPercent")
  final double? discountPercent;

  DiscountLineDetail({
    this.taxCodeRef, this.classRef, this.percentBased, this.discountAccountRef,
    this.discountPercent
  });

  factory DiscountLineDetail.fromJson(Map<String, dynamic> json) => _$DiscountLineDetailFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountLineDetailToJson(this);
}

@JsonSerializable(includeIfNull: false)
class SubTotalLine implements Line {

  @JsonKey(name: "Id")
  final String? id;

  //@JsonKey(name: "SubTotalLineDetail")
  //final SubtotalLineDetail? subtotalLineDetail;

  @JsonKey(name: "DetailType")
  final String? detailType; //SubtotalLineDetail

  @JsonKey(name: "Amount")
  final double? amount;

  @JsonKey(name: "Description")
  final String? description;

  @JsonKey(name: "LineNum")
  final int? lineNum;

  SubTotalLine({
    this.id, this.description, this.lineNum, this.amount, this.detailType,
    //this.subtotalLineDetail
  });

  factory SubTotalLine.fromJson(Map<String, dynamic> json) => _$SubTotalLineFromJson(json);

  Map<String, dynamic> toJson() => _$SubTotalLineToJson(this);
}

@JsonSerializable(includeIfNull: false, )
class SubtotalLineDetail {

  @JsonKey(name: "ItemRef")
  final ReferenceType? itemRef;

  SubtotalLineDetail({
    this.itemRef
  });

  factory SubtotalLineDetail.fromJson(Map<String, dynamic> json) => _$SubtotalLineDetailFromJson(json);

  Map<String, dynamic> toJson() => _$SubtotalLineDetailToJson(this);
}

@JsonSerializable(includeIfNull: false)
class AccountBasedExpense {

  @JsonKey(name: "AccountRef")
  final ReferenceType accountRef;

  @JsonKey(name: "TaxAmount")
  final double? taxAmount;

  @JsonKey(name: "TaxInclusiveAmt")
  final double? taxInclusiveAmt;

  @JsonKey(name: "ClassRef")
  final ReferenceType? classRef;

  @JsonKey(name: "TaxCodeRef")
  final ReferenceType? taxCodeRef;

  @JsonKey(name: "MarkupInfo")
  final MarkupInfo? markupInfo;

  @JsonKey(name: "BillableStatus")
  final BillableStatusEnum? billableStatus;

  @JsonKey(name: "CustomerRef")
  final ReferenceType? customerRef;

  AccountBasedExpense({
    this.taxInclusiveAmt, this.markupInfo, this.customerRef, this.classRef,
    this.billableStatus, this.taxCodeRef, required this.accountRef, this.taxAmount
  });

  factory AccountBasedExpense.fromJson(Map<String, dynamic> json) => _$AccountBasedExpenseFromJson(json);

  Map<String, dynamic> toJson() => _$AccountBasedExpenseToJson(this);
}

@JsonSerializable(includeIfNull: false)
class MarkupInfo {

  @JsonKey(name: "PriceLevelRef")
  final ReferenceType? priceLevelRef;

  @JsonKey(name: "Percent")
  final double? percent;

  @JsonKey(name: "MarkUpIncomeAccountRef")
  final ReferenceType? markUpIncomeAccountRef;

  MarkupInfo({
    this.priceLevelRef, this.markUpIncomeAccountRef, this.percent
  });

  factory MarkupInfo.fromJson(Map<String, dynamic> json) => _$MarkupInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MarkupInfoToJson(this);
}

@JsonSerializable(includeIfNull: null)
class LinkedTxn {

  @JsonKey(name: "TxnId")
  final String txnId;

  @JsonKey(name: "TxnType")
  final String txnType;

  @JsonKey(name: "TxnLineId")
  final String? txnLineId;

  LinkedTxn({required this.txnId, this.txnLineId, required this.txnType});

  factory LinkedTxn.fromJson(Map<String, dynamic> json) => _$LinkedTxnFromJson(json);

  Map<String, dynamic> toJson() => _$LinkedTxnToJson(this);

}

@JsonSerializable(includeIfNull: false)
class TxnTaxDetail {

  @JsonKey(name: "TxnTaxCodeRef")
  final ReferenceType? txnTaxCodeRef;

  @JsonKey(name: "TotalTax")
  final double? totalTax;

  final List<TaxLine>? line;

  TxnTaxDetail({
    this.line, this.totalTax, this.txnTaxCodeRef
  });

  factory TxnTaxDetail.fromJson(Map<String, dynamic> json) => _$TxnTaxDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TxnTaxDetailToJson(this);

}

@JsonSerializable(includeIfNull: false)
class TaxLine {

  @JsonKey(name: "DetailType")
  final String detailType;

  @JsonKey(name: "TaxLineDetail")
  final TaxLineDetail taxLineDetail;

  @JsonKey(name: "Amount")
  final double? amount;

  TaxLine({
    this.amount, required this.detailType, required this.taxLineDetail
  });

  factory TaxLine.fromJson(Map<String, dynamic> json) => _$TaxLineFromJson(json);

  Map<String, dynamic> toJson() => _$TaxLineToJson(this);

}

@JsonSerializable(includeIfNull: false)
class TaxLineDetail {

  @JsonKey(name: "TaxRateRef")
  final ReferenceType taxRateRef;

  @JsonKey(name: "NetAmountTaxable")
  final double ? netAmountTaxable;

  @JsonKey(name: "PercentBased")
  final bool ? percentBased;

  @JsonKey(name: "TaxInclusiveAmount")
  final double? taxInclusiveAmount;

  @JsonKey(name: "OverrideDeltaAmount")
  final double? overrideDeltaAmount;

  @JsonKey(name: "TaxPercent")
  final double? taxPercent;

  TaxLineDetail({
    this.netAmountTaxable, this.overrideDeltaAmount, this.percentBased,
    this.taxInclusiveAmount, this.taxPercent, required this.taxRateRef
  });

  factory TaxLineDetail.fromJson(Map<String, dynamic> json) => _$TaxLineDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TaxLineDetailToJson(this);
}

@JsonSerializable(includeIfNull: false)
class CompanyInfo {

  @JsonKey(name: "Id")
  final String? id;

  @JsonKey(name: "SyncToken")
  final String? syncToken;

  @JsonKey(name: "CompanyName")
  final String? companyName;

  @JsonKey(name: "CompanyAddr")
  final PhysicalAddress? companyAddr;

  @JsonKey(name: "LegalAddr")
  final PhysicalAddress? legalAddr;

  @JsonKey(name: "SupportedLanguages")
  final String? supportedLanguages;

  @JsonKey(name: "Country")
  final String? country;

  @JsonKey(name: "Email")
  final EmailAddress? email;

  @JsonKey(name: "WebAddr")
  final WebSiteAddress? webAddr;

  final List<NameValue>? pairs;

  @JsonKey(name: "FiscalYearStartMonth")
  final String? fiscalYearStartMonth;

  @JsonKey(name: "CustomerCommunicationAddr")
  final PhysicalAddress? customerCommunicationAddr;

  @JsonKey(name: "PrimaryPhone")
  final TelephoneNumber? primaryPhone;

  @JsonKey(name: "LegalName")
  final String? legalName;

  @JsonKey(name: "MetaData")
  final ModificationMetaData? MetaData;

  @JsonKey(name: "CompanyStartDate")
  final String? companyStartDate;

  CompanyInfo({
    this.id, this.syncToken, this.companyAddr, this.companyName,
    this.companyStartDate, this.country, this.customerCommunicationAddr,
    this.email, this.fiscalYearStartMonth, this.legalAddr, this.legalName,
    this.MetaData, this.pairs, this.primaryPhone, this.supportedLanguages,
    this.webAddr
  });

  factory CompanyInfo.fromJson(Map<String, dynamic> json) => _$CompanyInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyInfoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class PhysicalAddress {

  @JsonKey(name:"Id")
  final String? id;

  @JsonKey(name: "PostalCode")
  final String? postalCode;

  @JsonKey(name: "City")
  final String? city;

  @JsonKey(name: "Country")
  final String? country;

  @JsonKey(name: "Line5")
  final String? line5;

  @JsonKey(name: "Line4")
  final String? line4;

  @JsonKey(name: "Line3")
  final String? line3;

  @JsonKey(name: "Line2")
  final String? line2;

  @JsonKey(name: "Line1")
  final String? line1;

  @JsonKey(name: "Lat")
  final String? lat;

  @JsonKey(name: "Long")
  final String? long;

  @JsonKey(name: "CountrySubDivisionCode")
  final String? countrySubDivisionCode;

  PhysicalAddress({
    this.country, this.id, this.city, this.countrySubDivisionCode, this.lat,
    this.line1, this.line2, this.line3, this.line4, this.line5, this.long,
    this.postalCode
  });

  factory PhysicalAddress.fromJson(Map<String, dynamic> json) => _$PhysicalAddressFromJson(json);

  Map<String, dynamic> toJson() => _$PhysicalAddressToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class EmailAddress {

  @JsonKey(name: "Address")
  final String? address;

  EmailAddress({
    this.address
  });

  factory EmailAddress.fromJson(Map<String, dynamic> json) => _$EmailAddressFromJson(json);

  Map<String, dynamic> toJson() => _$EmailAddressToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class WebSiteAddress {

  @JsonKey(name: "URI")
  final String? uri;

  WebSiteAddress({
    this.uri
  });

  factory WebSiteAddress.fromJson(Map<String, dynamic> json) => _$WebSiteAddressFromJson(json);

  Map<String, dynamic> toJson() => _$WebSiteAddressToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class NameValue {

  @JsonKey(name: "Name")
  final String? name;

  @JsonKey(name: "Value")
  final String? value;

  NameValue({
    this.name,
    this.value
  });

  factory NameValue.fromJson(Map<String, dynamic> json) => _$NameValueFromJson(json);

  Map<String, dynamic> toJson() => _$NameValueToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

@JsonSerializable(includeIfNull: false)
class TelephoneNumber {

  @JsonKey(name: "FreeFormNumber")
  final String? freeFormNumber;

  TelephoneNumber({
    this.freeFormNumber
  });

  factory TelephoneNumber.fromJson(Map<String, dynamic> json) => _$TelephoneNumberFromJson(json);

  Map<String, dynamic> toJson() => _$TelephoneNumberToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

@JsonSerializable(includeIfNull: false)
class Customer {

  @JsonKey(name: "Id")
  final String? id;

  @JsonKey(name: "SyncToken")
  final String? syncToken;

  @JsonKey(name: "DisplayName")
  final String? displayName;

  @JsonKey(name: "Title")
  final String? title;

  @JsonKey(name: "GivenName")
  final String? givenName;

  @JsonKey(name: "MiddleName")
  final String? middleName;

  @JsonKey(name: "Suffix")
  final String? suffix;

  @JsonKey(name: "FamilyName")
  final String? familyName;

  @JsonKey(name: "PrimaryEmailAddr")
  final EmailAddress? primaryEmailAddr;

  @JsonKey(name: "ResaleNum")
  final String? resaleNum;

  @JsonKey(name: "SecondaryTaxIdentifier")
  final String? secondaryTaxIdentifier;

  @JsonKey(name: "ARAccountRef")
  final ReferenceType? aRAccountRef;

  @JsonKey(name: "DefaultTaxCodeRef")
  final ReferenceType? defaultTaxCodeRef;

  @JsonKey(name: "PreferredDeliveryMethod")
  final String? preferredDeliveryMethod;

  @JsonKey(name: "GSTIN")
  final String? gSTIN;

  @JsonKey(name: "SalesTermRef")
  final ReferenceType? salesTermRef;

  @JsonKey(name: "CustomerTypeRef")
  final String? customerTypeRef;

  @JsonKey(name: "Fax")
  final TelephoneNumber? fax;

  @JsonKey(name: "BusinessNumber")
  final String? businessNumber;

  @JsonKey(name: "BillWithParent")
  final bool? billWithParent;

  @JsonKey(name: "CurrencyRef")
  final CurrencyRefType? currencyRef;

  @JsonKey(name: "Mobile")
  final TelephoneNumber? mobile;

  @JsonKey(name: "Job")
  final bool? job;

  @JsonKey(name: "BalanceWithJobs")
  final double? balanceWithJobs;

  @JsonKey(name: "PrimaryPhone")
  final TelephoneNumber? primaryPhone;

  @JsonKey(name: "OpenBalanceDate")
  final String? openBalanceDate;

  @JsonKey(name: "Taxable")
  final bool? taxable;

  @JsonKey(name: "AlternatePhone")
  final TelephoneNumber? alternatePhone;

  @JsonKey(name: "MetaData")
  final ModificationMetaData? metaData;

  @JsonKey(name: "ParentRef")
  final ReferenceType? parentRef;

  @JsonKey(name: "Notes")
  final String? notes;

  @JsonKey(name: "WebAddr")
  final WebSiteAddress? webAddr;

  @JsonKey(name: "Active")
  final bool? active;

  @JsonKey(name: "CompanyName")
  final String? companyName;

  @JsonKey(name: "Balance")
  final double? balance;

  @JsonKey(name: "ShipAddr")
  final PhysicalAddress? shipAddr;

  @JsonKey(name: "PaymentMethodRef")
  final ReferenceType? paymentMethodRef;

  @JsonKey(name: "IsProject")
  final bool? isProject;

  @JsonKey(name: "Source")
  final String? source;

  @JsonKey(name: "PrimaryTaxIdentifier")
  final String? primaryTaxIdentifier;

  @JsonKey(name: "GSTRegistrationType")
  final String? gSTRegistrationType;

  @JsonKey(name: "PrintOnCheckName")
  final String? printOnCheckName;

  @JsonKey(name: "BillAddr")
  final PhysicalAddress? billAddr;

  @JsonKey(name: "FullyQualifiedName")
  final String? fullyQualifiedName;

  @JsonKey(name: "Level")
  final int? level;

  @JsonKey(name: "TaxExemptionReasonId")
  final int? TaxExemptionReasonId;

  Customer({
    this.id, this.webAddr, this.primaryPhone, this.companyName,
    this.syncToken, this.salesTermRef, this.balance, this.metaData,
    this.currencyRef, this.fullyQualifiedName, this.parentRef,
    this.active, this.alternatePhone, this.aRAccountRef,
    this.balanceWithJobs, this.billAddr, this.billWithParent,
    this.businessNumber, this.customerTypeRef, this.defaultTaxCodeRef,
    this.displayName, this.familyName, this.fax,
    this.givenName, this.gSTIN, this.gSTRegistrationType, this.isProject,
    this.job, this.level, this.middleName, this.mobile,
    this.notes, this.openBalanceDate, this.paymentMethodRef,
    this.preferredDeliveryMethod, this.primaryEmailAddr, this.primaryTaxIdentifier,
    this.printOnCheckName, this.resaleNum, this.secondaryTaxIdentifier,
    this.shipAddr, this.source, this.suffix, this.taxable, this.TaxExemptionReasonId,
    this.title
  });

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class Employee {

  @JsonKey(name: "Id")
  final String? id;

  @JsonKey(name: "SyncToken")
  final String? syncToken;

  @JsonKey(name: "PrimaryAddr")
  final PhysicalAddress? primaryAddr;

  @JsonKey(name: "PrimaryEmailAddr")
  final EmailAddress? primaryEmailAddr;

  @JsonKey(name:"DisplayName")
  final String? displayName;

  @JsonKey(name: "Title")
  final String? title;

  @JsonKey(name: "BillableTime")
  final bool? billableTime;

  @JsonKey(name: "GivenName")
  final String? givenName;

  @JsonKey(name: "BirthDate")
  final String? birthDate;

  @JsonKey(name: "MiddleName")
  final String? middleName;

  @JsonKey(name: "SSN")
  final String? ssn;

  @JsonKey(name: "PrimaryPhone")
  final TelephoneNumber? primaryPhone;

  @JsonKey(name:"Active")
  final bool? active;

  @JsonKey(name: "ReleasedDate")
  final String? releasedDate;

  @JsonKey(name: "MetaData")
  final ModificationMetaData? metaData;

  @JsonKey(name: "CostRate")
  final double? costRate;

  @JsonKey(name: "Mobile")
  final TelephoneNumber? mobile;

  @JsonKey(name: "Gender")
  final String? gender;

  @JsonKey(name: "HiredDate")
  final String? hiredDate;

  @JsonKey(name: "BillRate")
  final double? billRate;

  @JsonKey(name: "Organization")
  final bool? Organization;

  @JsonKey(name: "Suffix")
  final String? suffix;

  @JsonKey(name: "FamilyName")
  final String? familyName;

  @JsonKey(name: "PrintOnCheckName")
  final String? printOnCheckName;

  @JsonKey(name: "EmployeeNumber")
  final String? employeeNumber;

  @JsonKey(name: "V4IDPseudonym")
  final String? v4IDPseudonym;

  Employee({
    this.title, this.suffix, this.printOnCheckName, this.primaryEmailAddr,
    this.mobile, this.middleName, this.givenName, this.familyName,
    this.displayName, this.active, this.metaData, this.syncToken,
    this.primaryPhone, this.id, this.billableTime, this.billRate,
    this.birthDate, this.costRate, this.employeeNumber, this.gender,
    this.hiredDate, this.Organization, this.primaryAddr, this.releasedDate,
    this.ssn, this.v4IDPseudonym
  });

  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

///
/// he Estimate represents a proposal for a financial transaction from a
/// business to a customer for goods or services
/// proposed to be sold, including proposed pricing.
@JsonSerializable(includeIfNull: false)
class Estimate {

  @JsonKey(name: "Id")
  final String? id;

  @JsonKey(name: "CustomerRef")
  final ReferenceType? customerRef;

  @JsonKey(name: "SyncToken")
  final String? syncToken;

  @JsonKey(name: "CurrencyRef")
  final CurrencyRefType? currencyRef;

  @JsonKey(name: "BillEmail")
  final EmailAddress? billEmail;

  @JsonKey(name: "TxnDate")
  final String? txnDate;

  @JsonKey(name: "ShipFromAddr")
  final PhysicalAddress? shipFromAddr;

  @JsonKey(name: "ShipDate")
  final Date? shipDate;

  @JsonKey(name: "ClassRef")
  final ReferenceType? classRef;

  @JsonKey(name: "PrintStatus")
  final String? printStatus;

  @JsonKey(name: "CustomField")
  final List<CustomField>? customField;

  @JsonKey(name: "SalesTermRef")
  final ReferenceType? salesTermRef;

  @JsonKey(name: "TxnStatus")
  final String? txnStatus;

  @JsonKey(name: "LinkedTxn")
  final List<LinkedTxn>? linkedTxn;

  @JsonKey(name: "GlobalTaxCalculation")
  final GlobalTaxCalculationEnum? globalTaxCalculation;

  @JsonKey(name: "AcceptedDate")
  final Date? acceptedDate;

  @JsonKey(name: "ExpirationDate")
  final Date? expirationDate;

  @JsonKey(name: "TransactionLocationType")
  final String? transactionLocationType;

  @JsonKey(name: "DueDate")
  final Date? dueDate;

  @JsonKey(name: "MetaData")
  final ModificationMetaData? metaData;

  @JsonKey(name: "DocNumber")
  final String? docNumber;

  @JsonKey(name: "PrivateNote")
  final String? privateNote;

  @JsonKey(name: "Line")
  @_LineConverter()
  final List<Line>? line;

  @JsonKey(name: "CustomerMemo")
  final MemoRef? customerMemo;

  @JsonKey(name: "EmailStatus")
  final String? emailStatus;

  @JsonKey(name: "TxnTaxDetail")
  final TxnTaxDetail? txnTaxDetail;

  @JsonKey(name: "AcceptedBy")
  final String? acceptedBy;

  @JsonKey(name: "ExchangeRate")
  final double? exchangeRate;

  @JsonKey(name: "ShipAddr")
  final PhysicalAddress? shipAddr;

  @JsonKey(name: "DepartmentRef")
  final ReferenceType? departmentRef;

  @JsonKey(name: "ShipMethodRef")
  final ReferenceType? shipMethodRef;

  @JsonKey(name: "BillAddr")
  final PhysicalAddress? billAddr;

  @JsonKey(name: "ApplyTaxAfterDiscount")
  final bool? applyTaxAfterDiscount;

  @JsonKey(name: "TotalAmt")
  final double? totalAmt;

  @JsonKey(name: "RecurDataRef")
  final ReferenceType? recurDataRef;

  @JsonKey(name: "TaxExemptionRef")
  final ReferenceType? taxExemptionRef;

  @JsonKey(name: "HomeTotalAmt")
  final double? homeTotalAmt;

  @JsonKey(name: "FreeFormAddress")
  final bool? freeFormAddress;

  Estimate({
    this.id, this.syncToken, this.metaData, this.shipAddr,
    this.billAddr, this.currencyRef, this.salesTermRef, this.line,
    this.classRef, this.customerRef, this.txnTaxDetail, this.transactionLocationType,
    this.totalAmt, this.privateNote, this.globalTaxCalculation,
    this.exchangeRate, this.dueDate, this.docNumber, this.departmentRef,
    this.linkedTxn, this.txnDate, this.acceptedBy, this.acceptedDate,
    this.applyTaxAfterDiscount, this.billEmail, this.customerMemo,
    this.customField, this.emailStatus, this.expirationDate,
    this.freeFormAddress, this.homeTotalAmt, this.printStatus,
    this.recurDataRef, this.shipDate,
    this.shipFromAddr, this.shipMethodRef, this.taxExemptionRef,
    this.txnStatus
  });

  factory Estimate.fromJson(Map<String, dynamic> json) => _$EstimateFromJson(json);

  Map<String, dynamic> toJson() => _$EstimateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CustomField {

  @JsonKey(name: "DefinitionId")
  final String? definitionId;

  @JsonKey(name: "BooleanValue")
  final bool? booleanValue;

  @JsonKey(name: "StringValue")
  final String? stringValue;

  @JsonKey(name: "Name")
  final String? name;

  @JsonKey(name: "Type")
  final CustomFieldTypeEnum? type;

  CustomField({
    this.name, required this.definitionId, this.stringValue, this.type,
    this.booleanValue
  });

  factory CustomField.fromJson(Map<String, dynamic> json) => _$CustomFieldFromJson(json);

  Map<String, dynamic> toJson() => _$CustomFieldToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class MemoRef {

  final String? value;

  MemoRef({
    this.value
  });

  factory MemoRef.fromJson(Map<String, dynamic> json) => _$MemoRefFromJson(json);

  Map<String, dynamic> toJson() => _$MemoRefToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

///
/// An Invoice represents a sales form where the customer pays for a product or service later.
@JsonSerializable(includeIfNull: false)
class Invoice {

  @JsonKey(name: "Id")
  final String? id;

  @JsonKey(name: "Line")
  @_LineConverter()
  final List<Line>? line;

  @JsonKey(name: "CustomerRef")
  final ReferenceType? customerRef;

  @JsonKey(name: "SyncToken")
  final String? syncToken;

  @JsonKey(name: "CurrencyRef")
  final CurrencyRefType? currencyRef;

  @JsonKey(name: "DocNumber")
  final String? docNumber;

  @JsonKey(name: "BillEmail")
  final EmailAddress? billEmail;

  @JsonKey(name: "TxnDate")
  final String? txnDate;

  @JsonKey(name: "ShipFromAddr")
  final PhysicalAddress? shipFromAddr;

  @JsonKey(name: "ShipDate")
  final String? shipDate;

  @JsonKey(name: "TrackingNum")
  final String? trackingNum;

  @JsonKey(name: "ClassRef")
  final ReferenceType? classRef;

  @JsonKey(name: "PrintStatus")
  final String? printStatus;

  @JsonKey(name: "SalesTermRef")
  final ReferenceType? salesTermRef;

  @JsonKey(name: "TxnSource")
  final String? txnSource;

  @JsonKey(name: "LinkedTxn")
  final List<LinkedTxn>? linkedTxn;

  @JsonKey(name: "DepositToAccountRef")
  final ReferenceType? depositToAccountRef;

  @JsonKey(name: "GlobalTaxCalculation")
  final GlobalTaxCalculationEnum? globalTaxCalculation;

  @JsonKey(name: "AllowOnlineACHPayment")
  final bool? allowOnlineACHPayment;

  @JsonKey(name: "TransactionLocationType")
  final String? transactionLocationType;

  @JsonKey(name: "DueDate")
  final String? dueDate;

  @JsonKey(name: "MetaData")
  final ModificationMetaData? metaData;

  @JsonKey(name: "PrivateNote")
  final String? privateNote;

  @JsonKey(name: "BillEmailCc")
  final EmailAddress? billEmailCc;

  @JsonKey(name: "CustomerMemo")
  final MemoRef? customerMemo;

  @JsonKey(name: "EmailStatus")
  final String? emailStatus;

  @JsonKey(name: "ExchangeRate")
  final double? exchangeRate;

  @JsonKey(name: "Deposit")
  final double? deposit;

  @JsonKey(name: "TxnTaxDetail")
  final TxnTaxDetail? txnTaxDetail;

  @JsonKey(name: "AllowOnlineCreditCardPayment")
  final bool? allowOnlineCreditCardPayment;

  @JsonKey(name: "CustomField")
  final List<CustomField>? customField;

  @JsonKey(name: "ShipAddr")
  final PhysicalAddress? shipAddr;

  @JsonKey(name: "DepartmentRef")
  final ReferenceType? departmentRef;

  @JsonKey(name: "BillEmailBcc")
  final EmailAddress? billEmailBcc;
  
  @JsonKey(name: "ShipMethodRef")
  final ReferenceType? shipMethodRef;

  @JsonKey(name: "BillAddr")
  final PhysicalAddress? BillAddr;

  @JsonKey(name: "ApplyTaxAfterDiscount")
  final bool? applyTaxAfterDiscount;

  @JsonKey(name: "HomeBalance")
  final double? homeBalance;

  @JsonKey(name: "DeliveryInfo")
  final DeliveryInfo? deliveryInfo;

  @JsonKey(name: "TotalAmt")
  final double? totalAmt;

  @JsonKey(name: "InvoiceLink")
  final String? invoiceLink;

  @JsonKey(name: "RecurDataRef")
  final ReferenceType? recurDataRef;

  @JsonKey(name: "TaxExemptionRef")
  final ReferenceType? TaxExemptionRef;

  @JsonKey(name: "Balance")
  final double? balance;

  @JsonKey(name: "HomeTotalAmt")
  final double? homeTotalAmt;

  @JsonKey(name: "FreeFormAddress")
  final bool? freeFormAddress;

  @JsonKey(name: "AllowOnlinePayment")
  final bool? allowOnlinePayment;

  @JsonKey(name: "AllowIPNPayment")
  final bool? allowIPNPayment;

  Invoice({
    this.id, this.classRef, this.shipMethodRef, this.shipFromAddr,
    this.shipDate, this.recurDataRef, this.printStatus, this.homeTotalAmt,
    this.freeFormAddress, this.emailStatus, this.customField,
    this.customerMemo, this.billEmail, this.applyTaxAfterDiscount,
    this.txnDate, this.linkedTxn, this.departmentRef,
    this.docNumber, this.dueDate, this.exchangeRate, this.globalTaxCalculation,
    this.privateNote, this.totalAmt, this.transactionLocationType,
    this.txnTaxDetail, this.customerRef, this.line, this.salesTermRef,
    this.currencyRef, this.shipAddr, this.metaData, this.syncToken,
    this.balance, this.homeBalance, this.allowIPNPayment, this.allowOnlineACHPayment,
    this.allowOnlineCreditCardPayment, this.allowOnlinePayment,
    this.BillAddr, this.billEmailBcc, this.billEmailCc, this.deliveryInfo,
    this.deposit, this.depositToAccountRef, this.invoiceLink, this.TaxExemptionRef,
    this.trackingNum, this.txnSource
  });

  factory Invoice.fromJson(Map<String, dynamic> json) => _$InvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class DeliveryInfo {

  @JsonKey(name: "DeliveryType")
  final String? deliveryType;

  @JsonKey(name: "DeliveryTime")
  final String? deliveryTime;

  DeliveryInfo({
    this.deliveryTime, this.deliveryType
  });

  factory DeliveryInfo.fromJson(Map<String, dynamic> json) => _$DeliveryInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryInfoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// An item is a thing that your company buys, sells, or re-sells,
/// such as products and services. An item is shown as a line on an
/// invoice or other sales form.
@JsonSerializable(includeIfNull: false)
class Item {

  @JsonKey(name: "Id")
  final String? id;

  @JsonKey(name: "ItemCategoryType")
  final String? itemCategoryType;

  @JsonKey(name: "Name")
  final String? name;

  @JsonKey(name: "SyncToken")
  final String? syncToken;

  @JsonKey(name: "InvStartDate")
  final String? invStartDate;

  @JsonKey(name: "Type")
  final String? type;

  @JsonKey(name: "QtyOnHand")
  final double? qtyOnHand;

  @JsonKey(name: "AssetAccountRef")
  final ReferenceType? assetAccountRef;

  @JsonKey(name: "Sku")
  final String? sku;

  @JsonKey(name: "SalesTaxIncluded")
  final bool? salesTaxIncluded;

  @JsonKey(name: "TrackQtyOnHand")
  final bool? trackQtyOnHand;

  @JsonKey(name: "SalesTaxCodeRef")
  final ReferenceType? salesTaxCodeRef;

  @JsonKey(name: "ClassRef")
  final ReferenceType? classRef;

  @JsonKey(name: "Source")
  final String? source;

  @JsonKey(name: "PurchaseTaxIncluded")
  final bool? purchaseTaxIncluded;

  @JsonKey(name: "Description")
  final String? description;

  @JsonKey(name: "AbatementRate")
  final double? abatementRate;

  @JsonKey(name: "SubItem")
  final bool? subItem;

  @JsonKey(name: "Taxable")
  final bool? taxable;

  @JsonKey(name: "UQCDisplayText")
  final String? uQCDisplayText;

  @JsonKey(name: "ReorderPoint")
  final double? reorderPoint;

  @JsonKey(name: "PurchaseDesc")
  final String? purchaseDesc;

  @JsonKey(name: "MetaData")
  final ModificationMetaData? metaData;

  @JsonKey(name: "PrefVendorRef")
  final ReferenceType? prefVendorRef;

  @JsonKey(name: "Active")
  final bool? active;

  @JsonKey(name: "UQCId")
  final String? uQCId;

  @JsonKey(name: "ReverseChargeRate")
  final double? reverseChargeRate;

  @JsonKey(name: "PurchaseTaxCodeRef")
  final ReferenceType? purchaseTaxCodeRef;

  @JsonKey(name: "ServiceType")
  final String? serviceType;

  @JsonKey(name: "PurchaseCost")
  final double? purchaseCost;

  @JsonKey(name: "ParentRef")
  final ReferenceType? parentRef;

  @JsonKey(name: "UnitPrice")
  final double? unitPrice;

  @JsonKey(name: "FullyQualifiedName")
  final String? fullyQualifiedName;

  @JsonKey(name: "ExpenseAccountRef")
  final ReferenceType? expenseAccountRef;

  @JsonKey(name: "Level")
  final int? level;

  @JsonKey(name: "IncomeAccountRef")
  final ReferenceType? incomeAccountRef;

  @JsonKey(name: "TaxClassificationRef")
  final ReferenceType? taxClassificationRef;

  Item({
    this.syncToken, this.metaData, this.classRef, this.id,
    this.description, this.taxClassificationRef, this.unitPrice,
    this.type, this.name, this.active, this.taxable,
    this.source, this.level, this.parentRef, this.fullyQualifiedName,
    this.abatementRate, this.assetAccountRef, this.expenseAccountRef,
    this.incomeAccountRef, this.invStartDate, this.itemCategoryType,
    this.prefVendorRef, this.purchaseCost, this.purchaseDesc,
    this.purchaseTaxCodeRef, this.purchaseTaxIncluded, this.qtyOnHand,
    this.reorderPoint, this.reverseChargeRate, this.salesTaxCodeRef,
    this.salesTaxIncluded, this.serviceType, this.sku,
    this.subItem, this.trackQtyOnHand, this.uQCDisplayText,
    this.uQCId
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class Date {

  final String? date;

  Date({
    this.date
  });
  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);

  Map<String, dynamic> toJson() => _$DateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// A Payment object records a payment in QuickBooks.
/// The payment can be applied for a particular customer
/// against multiple Invoices and Credit Memos. It can also
/// be created without any Invoice or Credit Memo, by just
/// specifying an amount.
@JsonSerializable(includeIfNull: false)
class Payment {

  @JsonKey(name: "Id")
  final String? id;

  @JsonKey(name: "TotalAmt")
  final double? totalAmt;

  @JsonKey(name: "CustomerRef")
  final ReferenceType? customerRef;

  @JsonKey(name: "SyncToken")
  final String? syncToken;

  @JsonKey(name: "CurrencyRef")
  final CurrencyRefType? currencyRef;

  @JsonKey(name: "PrivateNote")
  final String? privateNote;

  @JsonKey(name: "PaymentMethodRef")
  final ReferenceType? paymentMethodRef;

  @JsonKey(name: "UnappliedAmt")
  final double? unappliedAmt;

  @JsonKey(name: "DepositToAccountRef")
  final ReferenceType? depositToAccountRef;

  @JsonKey(name: "ExchangeRate")
  final double? exchangeRate;

  // TODO Add
  //@JsonKey(name: "Line")
  //@_LineConverter()
  //final List<Line>? line;

  @JsonKey(name: "TxnSource")
  final String? txnSource;

  @JsonKey(name: "ARAccountRef")
  final ReferenceType? aRAccountRef;

  @JsonKey(name: "TxnDate")
  final String? txnDate;

  @JsonKey(name: "CreditCardPayment")
  final CreditCardPayment? creditCardPayment;

  @JsonKey(name: "TransactionLocationType")
  final String? transactionLocationType;

  @JsonKey(name: "MetaData")
  final ModificationMetaData? metaData;

  @JsonKey(name: "PaymentRefNum")
  final String? paymentRefNum;

  @JsonKey(name: "TaxExemptionRef")
  final ReferenceType? taxExemptionRef;

  Payment({
    this.id, this.metaData, this.syncToken, this.txnSource,
    this.depositToAccountRef, this.customerRef, this.transactionLocationType,
    this.totalAmt, this.privateNote, this.exchangeRate,
    this.txnDate, this.currencyRef, this.taxExemptionRef, this.paymentMethodRef,
    this.aRAccountRef, this.creditCardPayment, this.paymentRefNum,
    this.unappliedAmt
  });
  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CreditCardPayment {

  @JsonKey(name: "CreditChargeResponse")
  final CreditChargeResponse? creditChargeResponse;

  @JsonKey(name: "CreditChargeInfo")
  final CreditChargeInfo? creditChargeInfo;

  CreditCardPayment({
    this.creditChargeInfo, this.creditChargeResponse
  });
  factory CreditCardPayment.fromJson(Map<String, dynamic> json) => _$CreditCardPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$CreditCardPaymentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CreditChargeResponse {

  @JsonKey(name: "Status")
  final CCPaymentStatusEnum? status;

  @JsonKey(name: "AuthCode")
  final String? authCode;

  @JsonKey(name: "TxnAuthorizationTime")
  final DateTime? txnAuthorizationTime;

  @JsonKey(name: "CCTransId")
  final String? cCTransId;

  CreditChargeResponse({
    this.authCode, this.cCTransId, this.status, this.txnAuthorizationTime
  });
  factory CreditChargeResponse.fromJson(Map<String, dynamic> json) => _$CreditChargeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreditChargeResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CreditChargeInfo {

  @JsonKey(name: "CcExpiryMonth")
  final int? CcExpiryMonth;

  @JsonKey(name: "ProcessPayment")
  final bool? processPayment;

  @JsonKey(name: "PostalCode")
  final String? postalCode;

  @JsonKey(name: "Amount")
  final double? amount;

  @JsonKey(name: "NameOnAcct")
  final String? nameOnAcct;

  @JsonKey(name: "CcExpiryYear")
  final int? ccExpiryYear;

  @JsonKey(name: "Type")
  final String? type;

  @JsonKey(name: "BillAddrStreet")
  final String? billAddrStreet;

  CreditChargeInfo({
    this.type, this.amount, this.postalCode, this.billAddrStreet, this.CcExpiryMonth,
    this.ccExpiryYear, this.nameOnAcct, this.processPayment
  });
  factory CreditChargeInfo.fromJson(Map<String, dynamic> json) => _$CreditChargeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CreditChargeInfoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// The Preferences resource represents a set of company preferences
/// that control application behavior in QuickBooks Online.
/// They are mostly exposed as read-only through the Preferences
/// endpoint with only a very small subset of them available as writable.
/// Preferences are not necessarily honored when making requests via the
/// QuickBooks API because a lot of them control UI behavior in the application
/// and may not be applicable for apps.
@JsonSerializable(includeIfNull: false)
class Preferences {

  @JsonKey(name: "Id")
  final String? id;

  @JsonKey(name: "SyncToken")
  final String? syncToken;

  @JsonKey(name: "MetaData")
  final ModificationMetaData? metaData;

  @JsonKey(name: "EmailMessagesPrefs")
  final EmailMessagesPrefs? emailMessagesPrefs;

  @JsonKey(name: "ProductAndServicesPrefs")
  final ProductAndServicesPrefs? productAndServicesPrefs;

  @JsonKey(name: "ReportPrefs")
  final ReportPrefs? reportPrefs;

  @JsonKey(name: "AccountingInfoPrefs")
  final AccountingInfoPrefs? accountingInfoPrefs;

  @JsonKey(name: "SalesFormsPrefs")
  final SalesFormsPrefs? salesFormsPrefs;

  @JsonKey(name: "VendorAndPurchasesPrefs")
  final VendorAndPurchasesPrefs? vendorAndPurchasesPrefs;

  @JsonKey (name: "TaxPrefs")
  final TaxPrefs? taxPrefs;

  @JsonKey(name: "OtherPrefs")
  final OtherPrefs? otherPrefs;

  @JsonKey(name: "TimeTrackingPrefs")
  final TimeTrackingPrefs? timeTrackingPrefs;

  @JsonKey(name: "CurrencyPrefs")
  final CurrencyPrefs? currencyPrefs;

  Preferences({
  this.syncToken, this.metaData, this.id, this.accountingInfoPrefs,
    this.currencyPrefs, this.emailMessagesPrefs, this.otherPrefs,
    this.productAndServicesPrefs, this.reportPrefs, this.salesFormsPrefs,
    this.taxPrefs, this.timeTrackingPrefs, this.vendorAndPurchasesPrefs
  });
  factory Preferences.fromJson(Map<String, dynamic> json) => _$PreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$PreferencesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class EmailMessagesPrefs {

  @JsonKey(name: "InvoiceMessage")
  EmailMessageType? invoiceMessage;

  @JsonKey(name: "EstimateMessage")
  EmailMessageType? estimateMessage;

  @JsonKey(name: "SalesReceiptMessage")
  EmailMessageType? salesReceiptMessage;

  @JsonKey(name: "StatementMessage")
  EmailMessageType? statementMessage;

  EmailMessagesPrefs({
    this.estimateMessage, this.invoiceMessage, this.salesReceiptMessage,
    this.statementMessage
  });
  factory EmailMessagesPrefs.fromJson(Map<String, dynamic> json) => _$EmailMessagesPrefsFromJson(json);

  Map<String, dynamic> toJson() => _$EmailMessagesPrefsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class EmailMessageType {

  @JsonKey(name: "Message")
  final String? message;

  @JsonKey(name: "Subject")
  final String? subject;

  EmailMessageType({
    this.message, this.subject
  });
  factory EmailMessageType.fromJson(Map<String, dynamic> json) => _$EmailMessageTypeFromJson(json);

  Map<String, dynamic> toJson() => _$EmailMessageTypeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ProductAndServicesPrefs {

  @JsonKey(name: "QuantityWithPriceAndRate")
  final bool? quantityWithPriceAndRate;

  @JsonKey(name: "ForPurchase")
  final bool? forPurchase;

  @JsonKey(name: "QuantityOnHand")
  final bool? quantityOnHand;

  @JsonKey(name: "ForSales")
  final bool? forSales;
  
  ProductAndServicesPrefs({
    this.forPurchase, this.forSales, this.quantityOnHand,
    this.quantityWithPriceAndRate
  });
  factory ProductAndServicesPrefs.fromJson(Map<String, dynamic> json) => _$ProductAndServicesPrefsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAndServicesPrefsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ReportPrefs {

  @JsonKey(name: "ReportBasis")
  final String? reportBasis;

  @JsonKey(name:"CalcAgingReportFromTxnDate")
  final bool? calcAgingReportFromTxnDate;

  ReportPrefs({
    this.reportBasis, this.calcAgingReportFromTxnDate
  });
  factory ReportPrefs.fromJson(Map<String, dynamic> json) => _$ReportPrefsFromJson(json);

  Map<String, dynamic> toJson() => _$ReportPrefsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class AccountingInfoPrefs {

  @JsonKey(name: "FirstMonthOfFiscalYear")
  final String? firstMonthOfFiscalYear;

  @JsonKey(name: "UseAccountNumbers")
  final bool? useAccountNumbers;

  @JsonKey(name: "TaxYearMonth")
  final String? taxYearMonth;

  @JsonKey(name: "ClassTrackingPerTxn")
  final bool? classTrackingPerTxn;

  @JsonKey(name: "TrackDepartments")
  final bool? trackDepartments;

  @JsonKey(name: "TaxForm")
  final String? taxForm;

  @JsonKey(name: "CustomerTerminology")
  final String? customerTerminology;

  @JsonKey(name: "BookCloseDate")
  final String? bookCloseDate;

  @JsonKey(name: "DepartmentTerminology")
  final String? departmentTerminology;

  @JsonKey(name: "ClassTrackingPerTxnLine")
  final bool? classTrackingPerTxnLine;


  AccountingInfoPrefs({
    this.bookCloseDate, this.classTrackingPerTxn, this.classTrackingPerTxnLine,
    this.customerTerminology, this.departmentTerminology,
    this.firstMonthOfFiscalYear, this.taxForm, this.taxYearMonth,
    this.trackDepartments, this.useAccountNumbers
  });
  factory AccountingInfoPrefs.fromJson(Map<String, dynamic> json) => _$AccountingInfoPrefsFromJson(json);

  Map<String, dynamic> toJson() => _$AccountingInfoPrefsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class SalesFormsPrefs {

  @JsonKey(name: "SalesEmailBcc")
  final EmailAddress? salesEmailBcc;

  @JsonKey(name: "SalesEmailCc")
  final EmailAddress? salesEmailCc;

  @JsonKey(name: "UsingProgressInvoicing")
  final bool? usingProgressInvoicing;

  @JsonKey(name: "CustomField")
  final List<CustomField>? customFields;

  @JsonKey(name: "AllowServiceDate")
  final bool? allowServiceDate;

  @JsonKey(name: "EstimateMessage")
  final String? estimateMessage;

  @JsonKey(name: "EmailCopyToCompany")
  final bool? emailCopyToCompany;

  @JsonKey(name: "DefaultCustomerMessage")
  final String? defaultCustomerMessage;

  @JsonKey(name:"AllowShipping")
  final bool? allowShipping;
  
  @JsonKey(name: "DefaultDiscountAccount")
  final String? defaultDiscountAccount;

  @JsonKey(name: "IPNSupportEnabled")
  final bool? iPNSupportEnabled;

  @JsonKey(name: "ETransactionPaymentEnabled")
  final bool? eTransactionPaymentEnabled;

  @JsonKey(name: "DefaultTerms")
  final ReferenceType? defaultTerms;
  
  @JsonKey(name:" AllowDeposit")
  final bool? allowDeposit;
  
  @JsonKey(name: "UsingPriceLevels")
  final bool? usingPriceLevels;

  @JsonKey(name: "DefaultShippingAccount")
  final bool? defaultShippingAccount;
  
  @JsonKey(name: "ETransactionAttachPDF")
  final bool? eTransactionAttachPDF;

  @JsonKey(name: "CustomTxnNumbers")
  final bool? customTxnNumbers;

  @JsonKey(name: "ETransactionEnabledStatus")
  final String? eTransactionEnabledStatus;

  @JsonKey(name: "AllowEstimates")
  final bool? allowEstimates;

  @JsonKey(name: "AllowDiscount")
  final bool? allowDiscount;

  @JsonKey(name: "AutoApplyCredit")
  final bool? autoApplyCredit;

  SalesFormsPrefs({
    this.estimateMessage, this.customFields, this.allowDeposit,
    this.allowDiscount, this.allowEstimates, this.allowServiceDate,
    this.allowShipping, this.autoApplyCredit, this.customTxnNumbers,
    this.defaultCustomerMessage, this.defaultDiscountAccount, this.defaultShippingAccount,
    this.defaultTerms, this.emailCopyToCompany, this.eTransactionAttachPDF,
    this.eTransactionEnabledStatus, this.eTransactionPaymentEnabled,
    this.iPNSupportEnabled, this.salesEmailBcc, this.salesEmailCc,
    this.usingPriceLevels, this.usingProgressInvoicing
  });
  factory SalesFormsPrefs.fromJson(Map<String, dynamic> json) => _$SalesFormsPrefsFromJson(json);

  Map<String, dynamic> toJson() => _$SalesFormsPrefsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class VendorAndPurchasesPrefs {

  @JsonKey(name: "POCustomField")
  final List<CustomField>? pOCustomFields;

  @JsonKey(name: "DefaultMarkupAccount")
  final ReferenceType? defaultMarkupAccount;

  @JsonKey(name: "TrackingByCustomer")
  final bool? trackingByCustomer;

  @JsonKey(name: "DefaultTerms")
  final ReferenceType? defaultTerms;

  @JsonKey(name: "BillableExpenseTracking")
  final bool? billableExpenseTracking;

  @JsonKey(name: "DefaultMarkup")
  final double? defaultMarkup;

  @JsonKey(name: "TPAREnabled")
  final bool? tPAREnabled;

  VendorAndPurchasesPrefs({
    this.defaultTerms, this.billableExpenseTracking, this.defaultMarkup,
    this.defaultMarkupAccount, this.pOCustomFields,
    this.tPAREnabled, this.trackingByCustomer
  });
  factory VendorAndPurchasesPrefs.fromJson(Map<String, dynamic> json) => _$VendorAndPurchasesPrefsFromJson(json);

  Map<String, dynamic> toJson() => _$VendorAndPurchasesPrefsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class TaxPrefs {

  @JsonKey(name: "PartnerTaxEnabled")
  final bool? partnerTaxEnabled;

  @JsonKey(name: "TaxGroupCodeRef")
  final ReferenceType? taxGroupCodeRef;

  @JsonKey(name: "UsingSalesTax")
  final bool? usingSalesTax;

  TaxPrefs({
    this.partnerTaxEnabled, this.taxGroupCodeRef, this.usingSalesTax
  });
  factory TaxPrefs.fromJson(Map<String, dynamic> json) => _$TaxPrefsFromJson(json);

  Map<String, dynamic> toJson() => _$TaxPrefsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class OtherPrefs {

  @JsonKey(name: "NameValue")
  final List<NameValue>? nameValues;
  
  OtherPrefs({
    this.nameValues
  });
  factory OtherPrefs.fromJson(Map<String, dynamic> json) => _$OtherPrefsFromJson(json);

  Map<String, dynamic> toJson() => _$OtherPrefsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class TimeTrackingPrefs {

  @JsonKey(name:"WorkWeekStartDate")
  final String? workWeekStartDate;

  @JsonKey(name: "MarkTimeEntriesBillable")
  final bool? markTimeEntriesBillable;

  @JsonKey(name:"ShowBillRateToAll")
  final bool? showBillRateToAll;

  @JsonKey(name: "UsingSalesTax")
  final bool? usingSalesTax;

  @JsonKey(name: "BillCustomers")
  final bool? billCustomers;

  TimeTrackingPrefs({
    this.usingSalesTax, this.billCustomers, this.markTimeEntriesBillable,
    this.showBillRateToAll, this.workWeekStartDate
  });
  factory TimeTrackingPrefs.fromJson(Map<String, dynamic> json) => _$TimeTrackingPrefsFromJson(json);

  Map<String, dynamic> toJson() => _$TimeTrackingPrefsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CurrencyPrefs {

  @JsonKey(name: "HomeCurrency")
  final ReferenceType? homeCurrency;

  @JsonKey(name: "MultiCurrencyEnabled")
  final bool? multiCurrencyEnabled;

  CurrencyPrefs({
    this.homeCurrency, this.multiCurrencyEnabled
  });
  factory CurrencyPrefs.fromJson(Map<String, dynamic> json) => _$CurrencyPrefsFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyPrefsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ProfitAndLoss {

  @JsonKey(name: "Header")
  final ProfitHeader? header;

  @JsonKey(name: "Rows")
  final ProfitRows? rows;

  @JsonKey(name: "Columns")
  final ProfitColumns? columns;

  ProfitAndLoss({
    this.columns, this.header, this.rows
  });
  factory ProfitAndLoss.fromJson(Map<String, dynamic> json) => _$ProfitAndLossFromJson(json);

  Map<String, dynamic> toJson() => _$ProfitAndLossToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ProfitColumns {

  @JsonKey(name: "Column")
  final List<ProfitColumn>? columns;

  ProfitColumns({
    this.columns
  });
  factory ProfitColumns.fromJson(Map<String, dynamic> json) => _$ProfitColumnsFromJson(json);

  Map<String, dynamic> toJson() => _$ProfitColumnsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ProfitHeader {

  @JsonKey(name: "Customer")
  final String? customer;

  @JsonKey(name: "ReportName")
  final String? reportName;
  
  @JsonKey(name: "Vendor")
  final String? vendor;

  @JsonKey(name: "Option")
  final List<Option>? options;

  @JsonKey(name: "Item")
  final String? item;

  @JsonKey(name: "Employee")
  final String? employee;

  @JsonKey(name: "ReportBasis")
  final String? reportBasis;

  @JsonKey(name: "StartPeriod")
  final String? startPeriod;

  @JsonKey(name: "Class")
  final String? className;

  @JsonKey(name: "Currency")
  final String? currency;

  @JsonKey(name: "EndPeriod")
  final String? endPeriod;

  @JsonKey(name: "Time")
  final String? time;

  @JsonKey(name: "Department")
  final String? department;

  @JsonKey(name: "SummarizeColumnsBy")
  final String? summarizeColumnsBy;

  ProfitHeader({
    this.className, this.currency, this.customer, this.department,
    this.employee, this.endPeriod, this.item, this.options,
    this.reportBasis, this.reportName, this.startPeriod,
    this.summarizeColumnsBy, this.time, this.vendor
  });
  factory ProfitHeader.fromJson(Map<String, dynamic> json) => _$ProfitHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$ProfitHeaderToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class Option {

  final String? name;

  final String? value;

  Option({
    this.name, this.value
  });
  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  Map<String, dynamic> toJson() => _$OptionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ProfitRows {

  @JsonKey(name: "Row")
  final List<ProfitRow>? rows;

  ProfitRows({
    this.rows
  });
  factory ProfitRows.fromJson(Map<String, dynamic> json) => _$ProfitRowsFromJson(json);

  Map<String, dynamic> toJson() => _$ProfitRowsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ProfitRow {

  @JsonKey(name: "Header")
  final RowHeader? header;

  @JsonKey(name: "Rows")
  final List<ProfitRow>? rows;

  @JsonKey(name: "Columns")
  final List<ProfitColumn>? columns;

  ProfitRow({
    this.rows, this.header, this.columns
  });
  factory ProfitRow.fromJson(Map<String, dynamic> json) => _$ProfitRowFromJson(json);

  Map<String, dynamic> toJson() => _$ProfitRowToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class RowHeader {
  @JsonKey(name: "ColData")
  final List<ColData>? colData;

  RowHeader({
    this.colData
  });
  factory RowHeader.fromJson(Map<String, dynamic> json) => _$RowHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$RowHeaderToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ColData {

  final String? id;

  final String? value;

  final String? href;

  ColData({
    this.value, this.id, this.href
  });
  factory ColData.fromJson(Map<String, dynamic> json) => _$ColDataFromJson(json);

  Map<String, dynamic> toJson() => _$ColDataToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ProfitColumn {

  @JsonKey(name: "ColType")
  final String? colType;

  @JsonKey(name: "ColTitle")
  final String? colTitle;

  ProfitColumn({
    this.colTitle, this.colType
  });
  factory ProfitColumn.fromJson(Map<String, dynamic> json) => _$ProfitColumnFromJson(json);

  Map<String, dynamic> toJson() => _$ProfitColumnToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// A TaxAgency object is associated with a tax rate and
/// identifies the agency to which that tax rate applies,
/// that is, the entity that collects those taxes.
@JsonSerializable(includeIfNull: false)
class TaxAgency {

  @JsonKey(name: "Id")
  final String? id;

  @JsonKey(name: "DisplayName")
  final String? displayName;

  @JsonKey(name: "SyncToken")
  final String? syncToken;

  @JsonKey(name: "TaxTrackedOnSales")
  final bool? taxTrackedOnSales;

  @JsonKey(name: "TaxTrackedOnPurchases")
  final bool? taxTrackedOnPurchases;

  @JsonKey(name: "LastFileDate")
  final String? lastFileDate;

  @JsonKey(name: "TaxRegistrationNumber")
  final String? taxRegistrationNumber;

  @JsonKey(name: "MetaData")
  final ModificationMetaData? metaData;

  @JsonKey(name: "TaxAgencyConfig")
  final String? taxAgencyConfig;

  TaxAgency({
    this.id, this.metaData, this.syncToken, this.displayName,
    this.lastFileDate, this.taxAgencyConfig, this.taxRegistrationNumber,
    this.taxTrackedOnPurchases, this.taxTrackedOnSales
  });
  factory TaxAgency.fromJson(Map<String, dynamic> json) => _$TaxAgencyFromJson(json);

  Map<String, dynamic> toJson() => _$TaxAgencyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// The Vendor object represents the seller from whom
/// your company purchases any service or product.
@JsonSerializable(includeIfNull: false)
class Vendor {

  @JsonKey(name: "Id")
  final String? id;

  @JsonKey(name: "SyncToken")
  final String? syncToken;

  @JsonKey(name: "Title")
  final String? title;

  @JsonKey(name: "GivenName")
  final String? givenName;

  @JsonKey(name: "MiddleName")
  final String? middleName;

  @JsonKey(name: "Suffix")
  final String? suffix;

  @JsonKey(name: "FamilyName")
  final String? familyName;

  @JsonKey(name: "PrimaryEmailAddr")
  final EmailAddress? primaryEmailAddr;

  @JsonKey(name: "DisplayName")
  final String? displayName;

  @JsonKey(name: "OtherContactInfo")
  final ContactInfo? otherContactInfo;

  @JsonKey(name: "APAccountRef")
  final ReferenceType? aPAccountRef;
  
  @JsonKey(name: "TermRef")
  final ReferenceType? termRef;
  
  @JsonKey(name: "Source")
  final String? source;
  
  @JsonKey(name: "GSTIN")
  final String? gSTIN;

  @JsonKey(name: "T4AEligible")
  final bool? t4AEligible;

  @JsonKey(name: "Fax")
  final TelephoneNumber? fax;
  
  @JsonKey(name: "BusinessNumber")
  final String? businessNumber;

  @JsonKey(name: "CurrencyRef")
  final CurrencyRefType? currencyRef;

  @JsonKey(name: "HasTPAR")
  final bool? hasTPAR;
  
  @JsonKey(name: "TaxReportingBasis")
  final String? taxReportingBasis;

  @JsonKey(name: "Mobile")
  final TelephoneNumber? mobile;

  @JsonKey(name: "PrimaryPhone")
  final TelephoneNumber? primaryPhone;

  @JsonKey(name: "Active")
  final bool? active;

  @JsonKey(name: "AlternatePhone")
  final TelephoneNumber? alternatePhone;

  @JsonKey(name: "MetaData")
  final ModificationMetaData? metaData;

  @JsonKey(name: "Vendor1099")
  final bool? vendor1099;

  @JsonKey(name: "CostRate")
  final double? costRate;

  @JsonKey(name: "BillRate")
  final double? billRate;

  @JsonKey(name: "WebAddr")
  final WebSiteAddress? webAddr;

  @JsonKey(name: "T5018Eligible")
  final bool? t5018Eligible;

  @JsonKey(name: "CompanyName")
  final String? companyName;
  
  @JsonKey(name: "VendorPaymentBankDetail")
  final VendorPaymentBankDetail? vendorPaymentBankDetail;

  @JsonKey(name: "TaxIdentifier")
  final String? taxIdentifier;

  @JsonKey(name: "AcctNum")
  final String? acctNum;
  
  @JsonKey(name: "GSTRegistrationType")
  final String? gSTRegistrationType;
  
  @JsonKey(name: "PrintOnCheckName")
  final String? printOnCheckName;

  @JsonKey(name: "BillAddr")
  final PhysicalAddress? billAddr;

  @JsonKey(name: "Balance")
  final double? balance;


  Vendor({
    this.displayName, this.syncToken, this.metaData, this.id,
    this.source, this.active, this.balance, this.currencyRef, this.billAddr,
    this.costRate, this.billRate, this.primaryPhone, this.familyName,
    this.givenName, this.middleName, this.mobile, this.primaryEmailAddr,
    this.printOnCheckName, this.suffix, this.title, this.gSTRegistrationType,
    this.gSTIN, this.fax, this.businessNumber, this.alternatePhone,
    this.companyName, this.webAddr, this.aPAccountRef, this.acctNum,
    this.hasTPAR, this.otherContactInfo, this.t4AEligible, this.t5018Eligible,
    this.taxIdentifier, this.taxReportingBasis, this.termRef,
    this.vendor1099, this.vendorPaymentBankDetail
  });
  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);

  Map<String, dynamic> toJson() => _$VendorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ContactInfo{

  @JsonKey(name: "Type")
  final String? type;
  
  @JsonKey(name: "Telephone")
  final TelephoneNumber? telephone;

  ContactInfo({
    this.type, this.telephone
  });
  factory ContactInfo.fromJson(Map<String, dynamic> json) => _$ContactInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ContactInfoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class VendorPaymentBankDetail {

  @JsonKey(name: "BankAccountName")
  final String? bankAccountName;

  @JsonKey(name: "BankBranchIdentifier")
  final String? bankBranchIdentifier;
  
  @JsonKey(name: "BankAccountNumber")
  final String? bankAccountNumber;

  @JsonKey(name: "StatementText")
  final String? statementText;

  VendorPaymentBankDetail({
    this.bankAccountName, this.bankAccountNumber, this.bankBranchIdentifier,
    this.statementText
  });
  factory VendorPaymentBankDetail.fromJson(Map<String, dynamic> json) => _$VendorPaymentBankDetailFromJson(json);

  Map<String, dynamic> toJson() => _$VendorPaymentBankDetailToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// Quickbooks - Payments
@JsonSerializable(includeIfNull: false)
class BankAccount {

  final String? id;

  final String? name;

  final String? accountNumber;

  final String? phone;

  final BankAccountTypeEnum? accountType;

  final String? routingNumber;

  final String? updated;

  @JsonKey(name: "default")
  final bool? isDefault;

  final String? country;

  final String? inputType;
  
  final String? entityType;

  final String? created;

  final String? bankCode;

  final String? entityId;

  BankAccount({
    this.id, this.name, this.country, this.accountType, this.accountNumber,
    this.bankCode, this.created, this.isDefault, this.entityId,
    this.entityType, this.inputType, this.phone, this.routingNumber,
    this.updated
  });
  factory BankAccount.fromJson(Map<String, dynamic> json) => _$BankAccountFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}


@JsonSerializable(includeIfNull: false)
class Card {

  final String? id;

  final String? number;

  final String? expMonth;

  final String? expYear;

  final String? cvc;

  final String? updated;

  final CardTypeEnum? cardType;

  final String? name;

  @JsonKey(name: "default")
  final bool? isDefault;

  final String? commercialCardCode;

  final Address? address;

  final bool? isBusiness;

  final bool? isLevel3Eligible;

  final String? created;

  final String? entityType;

  final String? entityId;

  final ZeroDollarVerification? zeroDollarVerification;


  Card({
    this.updated, this.entityType, this.entityId, this.created,
    this.name, this.id, this.address, this.cardType, this.commercialCardCode,
    this.cvc, this.expMonth, this.expYear, this.isBusiness, this.isDefault,
    this.isLevel3Eligible, this.number, this.zeroDollarVerification
  });
  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  Map<String, dynamic> toJson() => _$CardToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class Address {

  final String? city;

  final String? streetAddress;

  final String? country;

  final String? postalCode;

  final String? region;

  Address({
    this.country, this.postalCode, this.city, this.region, this.streetAddress
  });
  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ZeroDollarVerification {

  final String? transactionId;

  final String? type;

  final String? status;

  ZeroDollarVerification({
    this.type, this.status, this.transactionId
  });
  factory ZeroDollarVerification.fromJson(Map<String, dynamic> json) => _$ZeroDollarVerificationFromJson(json);

  Map<String, dynamic> toJson() => _$ZeroDollarVerificationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class Charge {

  final String? id;

  final String? currency;

  final double? amount;

  final PaymentContext? context;

  final Card? card;

  final bool? capture;

  final String? description;

  final String? authCode;

  // TODO refundDetail

  final ChargeStatusEnum? status;

  final String? created;

  final CaptureDetail? captureDetail;

  final String? avsZip;

  final String? token;

  final String? cardSecurityCodeMatch;

  final String? avsStreet;

  Charge({
    this.status, this.id, this.created, this.currency, this.amount,
    this.authCode, this.description, this.avsStreet, this.avsZip,
    this.capture, this.captureDetail, this.card, this.cardSecurityCodeMatch,
    this.context, this.token
  });
  factory Charge.fromJson(Map<String, dynamic> json) => _$ChargeFromJson(json);

  Map<String, dynamic> toJson() => _$ChargeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CaptureDetail{

  final double? amount;

  final String? description;

  final PaymentContext? context;

  final String? created;

  CaptureDetail({
    this.context, this.description, this.amount, this.created
  });
  factory CaptureDetail.fromJson(Map<String, dynamic> json) => _$CaptureDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CaptureDetailToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class PaymentContext {

  final bool? mobile;

  final bool? isEcommerce;

  final double? tax;

  final DeviceInfo? deviceInfo;

  final bool? recurring;

  final Restaurant? restaurant;

  final Lodging? lodging;

  PaymentContext({
    this.mobile, this.deviceInfo, this.isEcommerce, this.lodging,
    this.recurring, this.restaurant, this.tax
  });
  factory PaymentContext.fromJson(Map<String, dynamic> json) => _$PaymentContextFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentContextToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class DeviceInfo {

  final String? id;

  final String? macAddress;

  final bool? encrypted;

  final String? ipAddress;

  final String? longitude;

  final String? phoneNumber;

  final String? latitude;

  final String? type;

  DeviceInfo({
    this.id, this.type, this.encrypted, this.ipAddress,
    this.latitude, this.longitude, this.macAddress, this.phoneNumber
  });
  factory DeviceInfo.fromJson(Map<String, dynamic> json) => _$DeviceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceInfoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class Restaurant {

  final double? beverageAmount;

  final String? serverID;

  final double? taxAmount;

  final double? foodAmount;

  final double? tipAmount;

  Restaurant({
    this.taxAmount, this.beverageAmount, this.foodAmount, this.serverID,
    this.tipAmount
  });
  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class Lodging {

  final double? lengthOfStay;

  final String? checkInDate;

  final double? roomRate;

  final SpecialProgramEnum? specialProgram;

  final ChargeTypeEnum? chargeType;

  final String? folioID;

  final List<String>? extraCharges;

  final String? checkOutDate;

  final double? totalAuthAmount;

  Lodging({
    this.chargeType, this.checkInDate, this.checkOutDate, this.extraCharges,
    this.folioID, this.lengthOfStay, this.roomRate, this.specialProgram,
    this.totalAuthAmount
  });
  factory Lodging.fromJson(Map<String, dynamic> json) => _$LodgingFromJson(json);

  Map<String, dynamic> toJson() => _$LodgingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull:  false)
class ECheck {

  final String? id;

  final String? paymentMode;

  final double? amount;

  final String? description;

  final String? checkNumber;

  final String? authCode;

  final PaymentContext? context;

  final ECheckStatus? status;

  final BankAccount? bankAccount;

  final String? created;

  final String? token;

  final String? bankAccountOnFile;

  ECheck({
    this.id, this.created, this.amount, this.description,
    this.context, this.token, this.authCode, this.status,
    this.bankAccount, this.bankAccountOnFile, this.checkNumber,
    this.paymentMode
  });
  factory ECheck.fromJson(Map<String, dynamic> json) => _$ECheckFromJson(json);

  Map<String, dynamic> toJson() => _$ECheckToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class UrlDiscovery {

  final String? issuer;

  final String authorization_endpoint;

  final String token_endpoint;

  final String userinfo_endpoint;

  final String revocation_endpoint;

  final String jwks_uri;
  
  final List<String> response_types_supported;

  final List<String> subject_types_supported;

  final List<String> id_token_signing_alg_values_supported;

  final List<String> scopes_supported;

  final List<String> token_endpoint_auth_methods_supported;

  final List<String> claims_supported;

  UrlDiscovery({
    required this.authorization_endpoint, required this.claims_supported,
    required this.id_token_signing_alg_values_supported,
    required this.issuer, required this.jwks_uri,
    required this.response_types_supported,
    required this.revocation_endpoint,
    required this.scopes_supported, required this.subject_types_supported,
    required this.token_endpoint, required this.token_endpoint_auth_methods_supported,
    required this.userinfo_endpoint
  });
  factory UrlDiscovery.fromJson(Map<String, dynamic> json) => _$UrlDiscoveryFromJson(json);

  Map<String, dynamic> toJson() => _$UrlDiscoveryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}


class Scope {
  final _id;
  final scope;

  Scope._(this._id, this.scope);

  static final Invalid = Scope._("invalid", "");
  static final OpenId = Scope._("openid", "openid");
  static final Email = Scope._("email", "email");
  static final Profile = Scope._("profile", "profile");
  static final Phone = Scope._("phone", "phone");
  static final Address= Scope._("address", "address");
  static final Accounting = Scope._("payment", "com.intuit.quickbooks.accounting");
  static final Payments = Scope._("payment", "com.intuit.quickbooks.payment");

  static final _values = [
    Accounting,
    Address,
    Email,
    Payments,
    Phone,
    Profile,
    Invalid,
    OpenId
  ];

  static Scope findById(String id) {
    Scope found = Invalid;

    for (var scope in _values) {
      if (scope._id == id) {
        return scope;
      }
    }
    return found;
  }
}

@JsonSerializable(includeIfNull: false)
class TokenResponse {

  final String? refresh_token;
  final String? access_token;
  final int? expires_in;
  final int? x_refresh_token_expires_in;
  final String? idToken;

  TokenResponse({this.refresh_token,
   this.access_token, this.expires_in,
  this.idToken, this.x_refresh_token_expires_in});

  factory TokenResponse.fromJson(Map<String, dynamic> json) => _$TokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class QueryResponse {
  
  @JsonKey(name: "Account")
  final List<Account>? account;
  
  @JsonKey(name: "CompanyInfo")
  final List<CompanyInfo>? companyInfo;

  @JsonKey(name: "Bill")
  final List<Bill>? bill;

  @JsonKey(name:"Customer")
  List<Customer>? customer;

  @JsonKey(name:"Employee")
  List<Employee>? employee;

  @JsonKey(name: "Estimate")
  List<Estimate>? estimate;

  @JsonKey(name: "Invoice")
  List<Invoice>? invoice;

  @JsonKey(name: "Item")
  List<Item>? item;

  @JsonKey(name: "Payment")
  List<Payment>? payment;

  @JsonKey(name: "Preferences")
  List<Preferences>? preferences;

  final int? startPosition;

  final int? maxResults;

  QueryResponse({
    this.account,
    this.companyInfo,
    this.bill,
    this.customer,
    this.employee,
    this.estimate,
    this.invoice,
    this.item,
    this.payment,
    this.preferences,
    this.maxResults,
    this.startPosition
  });

  factory QueryResponse.fromJson(Map<String, dynamic> json) => _$QueryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QueryResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class DeleteResponse {
  final String? status;
  final String? domain;

  @JsonKey(name: "Id")
  final String? id;

  DeleteResponse({
    this.status,
    this.domain,
    this.id
  });

  factory DeleteResponse.fromJson(Map<String, dynamic> json) => _$DeleteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ProfitAndLossQuery {

  final String? customer;

  final String? qzurl;

  final String? accounting_method;

  final String? end_date;

  final String? date_macro;
  
  final String? adjusted_gain_loss;

  @JsonKey(name: "class")
  final String? reportClass;

  final String? item;

  final String? sort_order;

  final String? summarize_column_by;

  final String? department;

  final String? vendor;

  final String? start_date;

  ProfitAndLossQuery({
    this.customer, this.vendor, this.item, this.department,
    this.accounting_method, this.adjusted_gain_loss, this.date_macro,
    this.end_date, this.qzurl, this.reportClass, this.sort_order,
    this.start_date, this.summarize_column_by
  });

  factory ProfitAndLossQuery.fromJson(Map<String, dynamic> json) => _$ProfitAndLossQueryFromJson(json);

  Map<String, dynamic> toJson() => _$ProfitAndLossQueryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
enum GlobalTaxCalculationEnum {
  TaxExcluded,
  TaxInclusive,
  NotApplicable
}

enum BillableStatusEnum {
  Billable,
  NotBillable,
  HasBeenBilled
}

enum CustomFieldTypeEnum {
  StringType,
}

enum CCPaymentStatusEnum {
  Completed,
  Unknown
}

enum BankAccountTypeEnum {
  PERSONAL_CHECKING,
  PERSONAL_SAVINGS,
  BUSINESS_CHECKING
}

enum CardTypeEnum {
  VISA,
  MC,
  AMEX,
  DISC,
  DINERS,
  JCB,

}

enum ChargeStatusEnum {

  AUTHORIZED,
  DECLINED,
  CAPTURED,
  CANCELLED,
  SETTLED,
  REFUNDED,

}

enum SpecialProgramEnum {
  AdvanceDeposit,
  AssuredReservation,
  DelayedCharge,
  ExpressService,
  NormalCharge,
  NoShowCharge,

}

enum ChargeTypeEnum {
  ConventionFees,
  GiftShop,
  Golf,
  HealthClub,
  Hotel,
  Restaurant,
  Salon,
  Tennis,

}

enum ECheckStatus {
  PENDING,
  SUCCEEDED,
  DECLINED,
  VOIDED,
  REFUNDED,

}
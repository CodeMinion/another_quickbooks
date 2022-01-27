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



  Account({required this.id, required this.name,
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
    final ReferenceType? currencyRef;

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
      else if (json["DetailType"] == "SubtotalLineDetail") {
        return SubTotalLine.fromJson(json);
      }
    }
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
  final int? qty;

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

  @JsonKey(name: "SubtotalLineDetail")
  final SubtotalLineDetail? subtotalLineDetail;

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
    this.subtotalLineDetail
  });

  factory SubTotalLine.fromJson(Map<String, dynamic> json) => _$SubTotalLineFromJson(json);

  Map<String, dynamic> toJson() => _$SubTotalLineToJson(this);
}

@JsonSerializable(includeIfNull: false)
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
  final String? shipDate;

  @JsonKey(name: "ClassRef")
  final ReferenceType? classRef;

  @JsonKey(name: "PrintStatus")
  final String? printStatus;

  @JsonKey(name: "CustomField")
  final CustomField? customField;

  @JsonKey(name: "SalesTermRef")
  final ReferenceType? salesTermRef;

  @JsonKey(name: "TxnStatus")
  final String? txnStatus;

  @JsonKey(name: "LinkedTxn")
  final List<LinkedTxn>? linkedTxn;

  @JsonKey(name: "GlobalTaxCalculation")
  final GlobalTaxCalculationEnum? globalTaxCalculation;

  @JsonKey(name: "AcceptedDate")
  final String? acceptedDate;

  @JsonKey(name: "ExpirationDate")
  final String? expirationDate;

  @JsonKey(name: "TransactionLocationType")
  final String? transactionLocationType;

  @JsonKey(name: "DueDate")
  final String? dueDate;

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
}

@JsonSerializable(includeIfNull: false)
class CustomField {

  @JsonKey(name: "DefinitionId")
  final String definitionId;

  @JsonKey(name: "StringValue")
  final String? stringValue;

  @JsonKey(name: "Name")
  final String? name;

  @JsonKey(name: "Type")
  final CustomFieldTypeEnum? type;

  CustomField({
    this.name, required this.definitionId, this.stringValue, this.type
  });

  factory CustomField.fromJson(Map<String, dynamic> json) => _$CustomFieldFromJson(json);

  Map<String, dynamic> toJson() => _$CustomFieldToJson(this);

}

@JsonSerializable(includeIfNull: false)
class MemoRef {

  final String? value;

  MemoRef({
    this.value
  });

  factory MemoRef.fromJson(Map<String, dynamic> json) => _$MemoRefFromJson(json);

  Map<String, dynamic> toJson() => _$MemoRefToJson(this);

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
  final CustomField? customField;

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
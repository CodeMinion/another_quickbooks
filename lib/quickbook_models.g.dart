// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quickbook_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      accountAlias: json['AccountAlias'] as String?,
      accountSubType: json['AccountSubType'] as String?,
      accountType: json['AccountType'] as String?,
      acctNum: json['AcctNum'] as String?,
      active: json['Active'] as bool?,
      classification: json['Classification'] as String?,
      createTime: json['CreateTime'] == null
          ? null
          : DateTime.fromJson(json['CreateTime'] as Map<String, dynamic>),
      currencyRef: json['CurrencyRef'] == null
          ? null
          : CurrencyRefType.fromJson(
              json['CurrencyRef'] as Map<String, dynamic>),
      currentBalance: (json['CurrentBalance'] as num?)?.toDouble(),
      currentBalanceWithSubAccounts:
          (json['CurrentBalanceWithSubAccounts'] as num?)?.toDouble(),
      description: json['Description'] as String?,
      fullyQualifiedName: json['FullyQualifiedName'] as String?,
      lastUpdatedTime: json['LastUpdatedTime'] == null
          ? null
          : DateTime.fromJson(json['LastUpdatedTime'] as Map<String, dynamic>),
      metaData: json['MetaData'] == null
          ? null
          : ModificationMetaData.fromJson(
              json['MetaData'] as Map<String, dynamic>),
      parentRef: json['ParentRef'] == null
          ? null
          : ReferenceType.fromJson(json['ParentRef'] as Map<String, dynamic>),
      subAccount: json['SubAccount'] as bool?,
      syncToken: json['SyncToken'] as String?,
      taxCodeRef: json['TaxCodeRef'] == null
          ? null
          : ReferenceType.fromJson(json['TaxCodeRef'] as Map<String, dynamic>),
      txnLocationType: json['TxnLocationType'] as String?,
    );

Map<String, dynamic> _$AccountToJson(Account instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Name', instance.name);
  writeNotNull('SyncToken', instance.syncToken);
  writeNotNull('AcctNum', instance.acctNum);
  writeNotNull('CurrencyRef', instance.currencyRef);
  writeNotNull('ParentRef', instance.parentRef);
  writeNotNull('Description', instance.description);
  writeNotNull('Active', instance.active);
  writeNotNull('MetaData', instance.metaData);
  writeNotNull('CreateTime', instance.createTime);
  writeNotNull('LastUpdatedTime', instance.lastUpdatedTime);
  writeNotNull('SubAccount', instance.subAccount);
  writeNotNull('Classification', instance.classification);
  writeNotNull('FullyQualifiedName', instance.fullyQualifiedName);
  writeNotNull('TxnLocationType', instance.txnLocationType);
  writeNotNull('AccountType', instance.accountType);
  writeNotNull(
      'CurrentBalanceWithSubAccounts', instance.currentBalanceWithSubAccounts);
  writeNotNull('AccountAlias', instance.accountAlias);
  writeNotNull('TaxCodeRef', instance.taxCodeRef);
  writeNotNull('AccountSubType', instance.accountSubType);
  writeNotNull('CurrentBalance', instance.currentBalance);
  return val;
}

CurrencyRefType _$CurrencyRefTypeFromJson(Map<String, dynamic> json) =>
    CurrencyRefType(
      value: json['value'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CurrencyRefTypeToJson(CurrencyRefType instance) {
  final val = <String, dynamic>{
    'value': instance.value,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  return val;
}

ReferenceType _$ReferenceTypeFromJson(Map<String, dynamic> json) =>
    ReferenceType(
      value: json['value'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ReferenceTypeToJson(ReferenceType instance) {
  final val = <String, dynamic>{
    'value': instance.value,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  return val;
}

ModificationMetaData _$ModificationMetaDataFromJson(
        Map<String, dynamic> json) =>
    ModificationMetaData(
      subAccount: json['SubAccount'] as bool?,
      classification: json['Classification'] as String?,
      fullyQualifiedName: json['FullyQualifiedName'] as String?,
    );

Map<String, dynamic> _$ModificationMetaDataToJson(
    ModificationMetaData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SubAccount', instance.subAccount);
  writeNotNull('Classification', instance.classification);
  writeNotNull('FullyQualifiedName', instance.fullyQualifiedName);
  return val;
}

DateTime _$DateTimeFromJson(Map<String, dynamic> json) => DateTime(
      dateTime: json['dateTime'] as String,
    );

Map<String, dynamic> _$DateTimeToJson(DateTime instance) => <String, dynamic>{
      'dateTime': instance.dateTime,
    };

Bill _$BillFromJson(Map<String, dynamic> json) => Bill(
      txnDate: json['TxnDate'] as String?,
      linkedTxn: (json['LinkedTxn'] as List<dynamic>?)
          ?.map((e) => LinkedTxn.fromJson(e as Map<String, dynamic>))
          .toList(),
      aPAccountRef: json['APAccountRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['APAccountRef'] as Map<String, dynamic>),
      currencyRef: json['CurrencyRef'] == null
          ? null
          : CurrencyRefType.fromJson(
              json['CurrencyRef'] as Map<String, dynamic>),
      syncToken: json['SyncToken'] as String?,
      id: json['Id'] as String?,
      metaData: json['MetaData'] == null
          ? null
          : ModificationMetaData.fromJson(
              json['MetaData'] as Map<String, dynamic>),
      balance: (json['Balance'] as num?)?.toDouble(),
      departmentRef: json['DepartmentRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['DepartmentRef'] as Map<String, dynamic>),
      docNumber: json['DocNumber'] as String?,
      dueDate: json['DueDate'] as String?,
      exchangeRate: (json['ExchangeRate'] as num?)?.toDouble(),
      globalTaxCalculation: $enumDecodeNullable(
          _$GlobalTaxCalculationEnumEnumMap, json['GlobalTaxCalculation']),
      homeBalance: (json['HomeBalance'] as num?)?.toDouble(),
      includeInAnnualTPAR: json['IncludeInAnnualTPAR'] as bool?,
      line: (json['Line'] as List<dynamic>?)
          ?.map(const _LineConverter().fromJson)
          .toList(),
      privateNote: json['PrivateNote'] as String?,
      recurDataRef: json['RecurDataRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['RecurDataRef'] as Map<String, dynamic>),
      salesTermRef: json['SalesTermRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['SalesTermRef'] as Map<String, dynamic>),
      totalAmt: (json['TotalAmt'] as num?)?.toDouble(),
      transactionLocationType: json['TransactionLocationType'] as String?,
      txnTaxDetail: json['TxnTaxDetail'] == null
          ? null
          : TxnTaxDetail.fromJson(json['TxnTaxDetail'] as Map<String, dynamic>),
      vendorRef: json['VendorRef'] == null
          ? null
          : ReferenceType.fromJson(json['VendorRef'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BillToJson(Bill instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('VendorRef', instance.vendorRef);
  writeNotNull(
      'Line', instance.line?.map(const _LineConverter().toJson).toList());
  writeNotNull('SyncToken', instance.syncToken);
  writeNotNull('CurrencyRef', instance.currencyRef);
  writeNotNull('TxnDate', instance.txnDate);
  writeNotNull('APAccountRef', instance.aPAccountRef);
  writeNotNull('SalesTermRef', instance.salesTermRef);
  writeNotNull('LinkedTxn', instance.linkedTxn);
  writeNotNull('GlobalTaxCalculation',
      _$GlobalTaxCalculationEnumEnumMap[instance.globalTaxCalculation]);
  writeNotNull('TotalAmt', instance.totalAmt);
  writeNotNull('TransactionLocationType', instance.transactionLocationType);
  writeNotNull('DueDate', instance.dueDate);
  writeNotNull('MetaData', instance.metaData);
  writeNotNull('DocNumber', instance.docNumber);
  writeNotNull('PrivateNote', instance.privateNote);
  writeNotNull('TxnTaxDetail', instance.txnTaxDetail);
  writeNotNull('ExchangeRate', instance.exchangeRate);
  writeNotNull('DepartmentRef', instance.departmentRef);
  writeNotNull('IncludeInAnnualTPAR', instance.includeInAnnualTPAR);
  writeNotNull('HomeBalance', instance.homeBalance);
  writeNotNull('RecurDataRef', instance.recurDataRef);
  writeNotNull('Balance', instance.balance);
  return val;
}

const _$GlobalTaxCalculationEnumEnumMap = {
  GlobalTaxCalculationEnum.TaxExcluded: 'TaxExcluded',
  GlobalTaxCalculationEnum.TaxInclusive: 'TaxInclusive',
  GlobalTaxCalculationEnum.NotApplicable: 'NotApplicable',
};

ItemBasedExpenseLine _$ItemBasedExpenseLineFromJson(
        Map<String, dynamic> json) =>
    ItemBasedExpenseLine(
      description: json['Description'] as String?,
      amount: (json['Amount'] as num?)?.toDouble(),
      detailType: json['DetailType'] as String?,
      id: json['Id'] as String?,
      itemBasedExpenseLineDetail: json['ItemBasedExpenseLineDetail'] == null
          ? null
          : ItemBasedExpenseLineDetail.fromJson(
              json['ItemBasedExpenseLineDetail'] as Map<String, dynamic>),
      lineNum: (json['LineNum'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ItemBasedExpenseLineToJson(
    ItemBasedExpenseLine instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull(
      'ItemBasedExpenseLineDetail', instance.itemBasedExpenseLineDetail);
  writeNotNull('Amount', instance.amount);
  writeNotNull('DetailType', instance.detailType);
  writeNotNull('Description', instance.description);
  writeNotNull('LineNum', instance.lineNum);
  return val;
}

ItemBasedExpenseLineDetail _$ItemBasedExpenseLineDetailFromJson(
        Map<String, dynamic> json) =>
    ItemBasedExpenseLineDetail(
      taxCodeRef: json['TaxCodeRef'] == null
          ? null
          : ReferenceType.fromJson(json['TaxCodeRef'] as Map<String, dynamic>),
      billableStatus: $enumDecodeNullable(
          _$BillableStatusEnumEnumMap, json['BillableStatus']),
      classRef: json['ClassRef'] == null
          ? null
          : ReferenceType.fromJson(json['ClassRef'] as Map<String, dynamic>),
      customerRef: json['CustomerRef'] == null
          ? null
          : ReferenceType.fromJson(json['CustomerRef'] as Map<String, dynamic>),
      itemRef: json['ItemRef'] == null
          ? null
          : ReferenceType.fromJson(json['ItemRef'] as Map<String, dynamic>),
      markupInfo: json['MarkupInfo'] == null
          ? null
          : MarkupInfo.fromJson(json['MarkupInfo'] as Map<String, dynamic>),
      priceLevelRef: json['PriceLevelRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['PriceLevelRef'] as Map<String, dynamic>),
      qty: (json['Qty'] as num?)?.toDouble(),
      taxInclusiveAmt: (json['TaxInclusiveAmt'] as num?)?.toDouble(),
      unitPrice: (json['UnitPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ItemBasedExpenseLineDetailToJson(
    ItemBasedExpenseLineDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TaxInclusiveAmt', instance.taxInclusiveAmt);
  writeNotNull('ItemRef', instance.itemRef);
  writeNotNull('CustomerRef', instance.customerRef);
  writeNotNull('PriceLevelRef', instance.priceLevelRef);
  writeNotNull('ClassRef', instance.classRef);
  writeNotNull('TaxCodeRef', instance.taxCodeRef);
  writeNotNull('MarkupInfo', instance.markupInfo);
  writeNotNull(
      'BillableStatus', _$BillableStatusEnumEnumMap[instance.billableStatus]);
  writeNotNull('Qty', instance.qty);
  writeNotNull('UnitPrice', instance.unitPrice);
  return val;
}

const _$BillableStatusEnumEnumMap = {
  BillableStatusEnum.Billable: 'Billable',
  BillableStatusEnum.NotBillable: 'NotBillable',
  BillableStatusEnum.HasBeenBilled: 'HasBeenBilled',
};

AccountBasedExpenseLine _$AccountBasedExpenseLineFromJson(
        Map<String, dynamic> json) =>
    AccountBasedExpenseLine(
      id: json['Id'] as String?,
      detailType: json['DetailType'] as String,
      amount: (json['Amount'] as num?)?.toDouble(),
      description: json['Description'] as String?,
      accountBasedExpenseLineDetail: json['AccountBasedExpenseLineDetail'] ==
              null
          ? null
          : AccountBasedExpense.fromJson(
              json['AccountBasedExpenseLineDetail'] as Map<String, dynamic>),
      decimal: json['Decimal'] as int?,
    );

Map<String, dynamic> _$AccountBasedExpenseLineToJson(
    AccountBasedExpenseLine instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  val['DetailType'] = instance.detailType;
  writeNotNull('Amount', instance.amount);
  writeNotNull(
      'AccountBasedExpenseLineDetail', instance.accountBasedExpenseLineDetail);
  writeNotNull('Description', instance.description);
  writeNotNull('Decimal', instance.decimal);
  return val;
}

SalesItemLine _$SalesItemLineFromJson(Map<String, dynamic> json) =>
    SalesItemLine(
      id: json['Id'] as String?,
      detailType: json['DetailType'] as String?,
      amount: (json['Amount'] as num?)?.toDouble(),
      description: json['Description'] as String?,
      lineNum: json['LineNum'] as int?,
      salesItemLineDetail: json['SalesItemLineDetail'] == null
          ? null
          : SalesItemLineDetail.fromJson(
              json['SalesItemLineDetail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SalesItemLineToJson(SalesItemLine instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('DetailType', instance.detailType);
  writeNotNull('SalesItemLineDetail', instance.salesItemLineDetail);
  writeNotNull('Amount', instance.amount);
  writeNotNull('Description', instance.description);
  writeNotNull('LineNum', instance.lineNum);
  return val;
}

SalesItemLineDetail _$SalesItemLineDetailFromJson(Map<String, dynamic> json) =>
    SalesItemLineDetail(
      classRef: json['ClassRef'] == null
          ? null
          : ReferenceType.fromJson(json['ClassRef'] as Map<String, dynamic>),
      taxCodeRef: json['TaxCodeRef'] == null
          ? null
          : ReferenceType.fromJson(json['TaxCodeRef'] as Map<String, dynamic>),
      markupInfo: json['MarkupInfo'] == null
          ? null
          : MarkupInfo.fromJson(json['MarkupInfo'] as Map<String, dynamic>),
      taxInclusiveAmt: (json['TaxInclusiveAmt'] as num?)?.toDouble(),
      unitPrice: (json['UnitPrice'] as num?)?.toDouble(),
      qty: (json['Qty'] as num?)?.toDouble(),
      itemRef: json['ItemRef'] == null
          ? null
          : ReferenceType.fromJson(json['ItemRef'] as Map<String, dynamic>),
      discountAmt: (json['DiscountAmt'] as num?)?.toDouble(),
      discountRate: (json['DiscountRate'] as num?)?.toDouble(),
      itemAccountRef: json['ItemAccountRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['ItemAccountRef'] as Map<String, dynamic>),
      serviceDate: json['ServiceDate'] as String?,
      taxClassificationRef: json['TaxClassificationRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['TaxClassificationRef'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SalesItemLineDetailToJson(SalesItemLineDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TaxInclusiveAmt', instance.taxInclusiveAmt);
  writeNotNull('DiscountAmt', instance.discountAmt);
  writeNotNull('ItemRef', instance.itemRef);
  writeNotNull('ClassRef', instance.classRef);
  writeNotNull('TaxCodeRef', instance.taxCodeRef);
  writeNotNull('MarkupInfo', instance.markupInfo);
  writeNotNull('ItemAccountRef', instance.itemAccountRef);
  writeNotNull('ServiceDate', instance.serviceDate);
  writeNotNull('DiscountRate', instance.discountRate);
  writeNotNull('Qty', instance.qty);
  writeNotNull('UnitPrice', instance.unitPrice);
  writeNotNull('TaxClassificationRef', instance.taxClassificationRef);
  return val;
}

GroupLine _$GroupLineFromJson(Map<String, dynamic> json) => GroupLine(
      lineNum: json['LineNum'] as int?,
      description: json['Description'] as String?,
      detailType: json['DetailType'] as String,
      id: json['Id'] as String?,
      groupLineDetail: json['GroupLineDetail'] == null
          ? null
          : GroupLineDetail.fromJson(
              json['GroupLineDetail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GroupLineToJson(GroupLine instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('GroupLineDetail', instance.groupLineDetail);
  val['DetailType'] = instance.detailType;
  writeNotNull('LineNum', instance.lineNum);
  writeNotNull('Description', instance.description);
  return val;
}

GroupLineDetail _$GroupLineDetailFromJson(Map<String, dynamic> json) =>
    GroupLineDetail(
      line: (json['Line'] as List<dynamic>?)
          ?.map(const _LineConverter().fromJson)
          .toList(),
      groupItemRef: json['GroupItemRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['GroupItemRef'] as Map<String, dynamic>),
      quantity: (json['Quantity'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GroupLineDetailToJson(GroupLineDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Quantity', instance.quantity);
  writeNotNull(
      'Line', instance.line?.map(const _LineConverter().toJson).toList());
  writeNotNull('GroupItemRef', instance.groupItemRef);
  return val;
}

DescriptionOnlyLine _$DescriptionOnlyLineFromJson(Map<String, dynamic> json) =>
    DescriptionOnlyLine(
      detailType: json['DetailType'] as String?,
      description: json['Description'] as String?,
      lineNum: json['LineNum'] as int?,
      amount: (json['Amount'] as num?)?.toDouble(),
      descriptionLineDetail: json['DescriptionLineDetail'] == null
          ? null
          : DescriptionLineDetail.fromJson(
              json['DescriptionLineDetail'] as Map<String, dynamic>),
      id: json['Id'] as String?,
    );

Map<String, dynamic> _$DescriptionOnlyLineToJson(DescriptionOnlyLine instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('DetailType', instance.detailType);
  writeNotNull('DescriptionLineDetail', instance.descriptionLineDetail);
  writeNotNull('Description', instance.description);
  writeNotNull('LineNum', instance.lineNum);
  writeNotNull('Amount', instance.amount);
  return val;
}

DescriptionLineDetail _$DescriptionLineDetailFromJson(
        Map<String, dynamic> json) =>
    DescriptionLineDetail(
      serviceDate: json['ServiceDate'] as String?,
      taxCodeRef: json['TaxCodeRef'] == null
          ? null
          : ReferenceType.fromJson(json['TaxCodeRef'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DescriptionLineDetailToJson(
    DescriptionLineDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TaxCodeRef', instance.taxCodeRef);
  writeNotNull('ServiceDate', instance.serviceDate);
  return val;
}

DiscountLine _$DiscountLineFromJson(Map<String, dynamic> json) => DiscountLine(
      amount: (json['Amount'] as num?)?.toDouble(),
      lineNum: json['LineNum'] as int?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      DetailType: json['DetailType'] as String?,
      discountLineDetail: json['DiscountLineDetail'] == null
          ? null
          : DiscountLineDetail.fromJson(
              json['DiscountLineDetail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DiscountLineToJson(DiscountLine instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('DiscountLineDetail', instance.discountLineDetail);
  writeNotNull('DetailType', instance.DetailType);
  writeNotNull('Amount', instance.amount);
  writeNotNull('Description', instance.description);
  writeNotNull('LineNum', instance.lineNum);
  return val;
}

DiscountLineDetail _$DiscountLineDetailFromJson(Map<String, dynamic> json) =>
    DiscountLineDetail(
      taxCodeRef: json['TaxCodeRef'] == null
          ? null
          : ReferenceType.fromJson(json['TaxCodeRef'] as Map<String, dynamic>),
      classRef: json['ClassRef'] == null
          ? null
          : ReferenceType.fromJson(json['ClassRef'] as Map<String, dynamic>),
      percentBased: json['PercentBased'] as bool?,
      discountAccountRef: json['DiscountAccountRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['DiscountAccountRef'] as Map<String, dynamic>),
      discountPercent: (json['DiscountPercent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DiscountLineDetailToJson(DiscountLineDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClassRef', instance.classRef);
  writeNotNull('TaxCodeRef', instance.taxCodeRef);
  writeNotNull('DiscountAccountRef', instance.discountAccountRef);
  writeNotNull('PercentBased', instance.percentBased);
  writeNotNull('DiscountPercent', instance.discountPercent);
  return val;
}

SubTotalLine _$SubTotalLineFromJson(Map<String, dynamic> json) => SubTotalLine(
      id: json['Id'] as String?,
      description: json['Description'] as String?,
      lineNum: json['LineNum'] as int?,
      amount: (json['Amount'] as num?)?.toDouble(),
      detailType: json['DetailType'] as String?,
    );

Map<String, dynamic> _$SubTotalLineToJson(SubTotalLine instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('DetailType', instance.detailType);
  writeNotNull('Amount', instance.amount);
  writeNotNull('Description', instance.description);
  writeNotNull('LineNum', instance.lineNum);
  return val;
}

SubtotalLineDetail _$SubtotalLineDetailFromJson(Map<String, dynamic> json) =>
    SubtotalLineDetail(
      itemRef: json['ItemRef'] == null
          ? null
          : ReferenceType.fromJson(json['ItemRef'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubtotalLineDetailToJson(SubtotalLineDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ItemRef', instance.itemRef);
  return val;
}

AccountBasedExpense _$AccountBasedExpenseFromJson(Map<String, dynamic> json) =>
    AccountBasedExpense(
      taxInclusiveAmt: (json['TaxInclusiveAmt'] as num?)?.toDouble(),
      markupInfo: json['MarkupInfo'] == null
          ? null
          : MarkupInfo.fromJson(json['MarkupInfo'] as Map<String, dynamic>),
      customerRef: json['CustomerRef'] == null
          ? null
          : ReferenceType.fromJson(json['CustomerRef'] as Map<String, dynamic>),
      classRef: json['ClassRef'] == null
          ? null
          : ReferenceType.fromJson(json['ClassRef'] as Map<String, dynamic>),
      billableStatus: $enumDecodeNullable(
          _$BillableStatusEnumEnumMap, json['BillableStatus']),
      taxCodeRef: json['TaxCodeRef'] == null
          ? null
          : ReferenceType.fromJson(json['TaxCodeRef'] as Map<String, dynamic>),
      accountRef:
          ReferenceType.fromJson(json['AccountRef'] as Map<String, dynamic>),
      taxAmount: (json['TaxAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AccountBasedExpenseToJson(AccountBasedExpense instance) {
  final val = <String, dynamic>{
    'AccountRef': instance.accountRef,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TaxAmount', instance.taxAmount);
  writeNotNull('TaxInclusiveAmt', instance.taxInclusiveAmt);
  writeNotNull('ClassRef', instance.classRef);
  writeNotNull('TaxCodeRef', instance.taxCodeRef);
  writeNotNull('MarkupInfo', instance.markupInfo);
  writeNotNull(
      'BillableStatus', _$BillableStatusEnumEnumMap[instance.billableStatus]);
  writeNotNull('CustomerRef', instance.customerRef);
  return val;
}

MarkupInfo _$MarkupInfoFromJson(Map<String, dynamic> json) => MarkupInfo(
      priceLevelRef: json['PriceLevelRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['PriceLevelRef'] as Map<String, dynamic>),
      markUpIncomeAccountRef: json['MarkUpIncomeAccountRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['MarkUpIncomeAccountRef'] as Map<String, dynamic>),
      percent: (json['Percent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MarkupInfoToJson(MarkupInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PriceLevelRef', instance.priceLevelRef);
  writeNotNull('Percent', instance.percent);
  writeNotNull('MarkUpIncomeAccountRef', instance.markUpIncomeAccountRef);
  return val;
}

LinkedTxn _$LinkedTxnFromJson(Map<String, dynamic> json) => LinkedTxn(
      txnId: json['TxnId'] as String,
      txnLineId: json['TxnLineId'] as String?,
      txnType: json['TxnType'] as String,
    );

Map<String, dynamic> _$LinkedTxnToJson(LinkedTxn instance) => <String, dynamic>{
      'TxnId': instance.txnId,
      'TxnType': instance.txnType,
      'TxnLineId': instance.txnLineId,
    };

TxnTaxDetail _$TxnTaxDetailFromJson(Map<String, dynamic> json) => TxnTaxDetail(
      line: (json['line'] as List<dynamic>?)
          ?.map((e) => TaxLine.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalTax: (json['TotalTax'] as num?)?.toDouble(),
      txnTaxCodeRef: json['TxnTaxCodeRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['TxnTaxCodeRef'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TxnTaxDetailToJson(TxnTaxDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TxnTaxCodeRef', instance.txnTaxCodeRef);
  writeNotNull('TotalTax', instance.totalTax);
  writeNotNull('line', instance.line);
  return val;
}

TaxLine _$TaxLineFromJson(Map<String, dynamic> json) => TaxLine(
      amount: (json['Amount'] as num?)?.toDouble(),
      detailType: json['DetailType'] as String,
      taxLineDetail:
          TaxLineDetail.fromJson(json['TaxLineDetail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaxLineToJson(TaxLine instance) {
  final val = <String, dynamic>{
    'DetailType': instance.detailType,
    'TaxLineDetail': instance.taxLineDetail,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Amount', instance.amount);
  return val;
}

TaxLineDetail _$TaxLineDetailFromJson(Map<String, dynamic> json) =>
    TaxLineDetail(
      netAmountTaxable: (json['NetAmountTaxable'] as num?)?.toDouble(),
      overrideDeltaAmount: (json['OverrideDeltaAmount'] as num?)?.toDouble(),
      percentBased: json['PercentBased'] as bool?,
      taxInclusiveAmount: (json['TaxInclusiveAmount'] as num?)?.toDouble(),
      taxPercent: (json['TaxPercent'] as num?)?.toDouble(),
      taxRateRef:
          ReferenceType.fromJson(json['TaxRateRef'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaxLineDetailToJson(TaxLineDetail instance) {
  final val = <String, dynamic>{
    'TaxRateRef': instance.taxRateRef,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NetAmountTaxable', instance.netAmountTaxable);
  writeNotNull('PercentBased', instance.percentBased);
  writeNotNull('TaxInclusiveAmount', instance.taxInclusiveAmount);
  writeNotNull('OverrideDeltaAmount', instance.overrideDeltaAmount);
  writeNotNull('TaxPercent', instance.taxPercent);
  return val;
}

CompanyInfo _$CompanyInfoFromJson(Map<String, dynamic> json) => CompanyInfo(
      id: json['Id'] as String?,
      syncToken: json['SyncToken'] as String?,
      companyAddr: json['CompanyAddr'] == null
          ? null
          : PhysicalAddress.fromJson(
              json['CompanyAddr'] as Map<String, dynamic>),
      companyName: json['CompanyName'] as String?,
      companyStartDate: json['CompanyStartDate'] as String?,
      country: json['Country'] as String?,
      customerCommunicationAddr: json['CustomerCommunicationAddr'] == null
          ? null
          : PhysicalAddress.fromJson(
              json['CustomerCommunicationAddr'] as Map<String, dynamic>),
      email: json['Email'] == null
          ? null
          : EmailAddress.fromJson(json['Email'] as Map<String, dynamic>),
      fiscalYearStartMonth: json['FiscalYearStartMonth'] as String?,
      legalAddr: json['LegalAddr'] == null
          ? null
          : PhysicalAddress.fromJson(json['LegalAddr'] as Map<String, dynamic>),
      legalName: json['LegalName'] as String?,
      MetaData: json['MetaData'] == null
          ? null
          : ModificationMetaData.fromJson(
              json['MetaData'] as Map<String, dynamic>),
      pairs: (json['pairs'] as List<dynamic>?)
          ?.map((e) => NameValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      primaryPhone: json['PrimaryPhone'] == null
          ? null
          : TelephoneNumber.fromJson(
              json['PrimaryPhone'] as Map<String, dynamic>),
      supportedLanguages: json['SupportedLanguages'] as String?,
      webAddr: json['WebAddr'] == null
          ? null
          : WebSiteAddress.fromJson(json['WebAddr'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyInfoToJson(CompanyInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('SyncToken', instance.syncToken);
  writeNotNull('CompanyName', instance.companyName);
  writeNotNull('CompanyAddr', instance.companyAddr);
  writeNotNull('LegalAddr', instance.legalAddr);
  writeNotNull('SupportedLanguages', instance.supportedLanguages);
  writeNotNull('Country', instance.country);
  writeNotNull('Email', instance.email);
  writeNotNull('WebAddr', instance.webAddr);
  writeNotNull('pairs', instance.pairs);
  writeNotNull('FiscalYearStartMonth', instance.fiscalYearStartMonth);
  writeNotNull('CustomerCommunicationAddr', instance.customerCommunicationAddr);
  writeNotNull('PrimaryPhone', instance.primaryPhone);
  writeNotNull('LegalName', instance.legalName);
  writeNotNull('MetaData', instance.MetaData);
  writeNotNull('CompanyStartDate', instance.companyStartDate);
  return val;
}

PhysicalAddress _$PhysicalAddressFromJson(Map<String, dynamic> json) =>
    PhysicalAddress(
      country: json['Country'] as String?,
      id: json['Id'] as String?,
      city: json['City'] as String?,
      countrySubDivisionCode: json['CountrySubDivisionCode'] as String?,
      lat: json['Lat'] as String?,
      line1: json['Line1'] as String?,
      line2: json['Line2'] as String?,
      line3: json['Line3'] as String?,
      line4: json['Line4'] as String?,
      line5: json['Line5'] as String?,
      long: json['Long'] as String?,
      postalCode: json['PostalCode'] as String?,
    );

Map<String, dynamic> _$PhysicalAddressToJson(PhysicalAddress instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('PostalCode', instance.postalCode);
  writeNotNull('City', instance.city);
  writeNotNull('Country', instance.country);
  writeNotNull('Line5', instance.line5);
  writeNotNull('Line4', instance.line4);
  writeNotNull('Line3', instance.line3);
  writeNotNull('Line2', instance.line2);
  writeNotNull('Line1', instance.line1);
  writeNotNull('Lat', instance.lat);
  writeNotNull('Long', instance.long);
  writeNotNull('CountrySubDivisionCode', instance.countrySubDivisionCode);
  return val;
}

EmailAddress _$EmailAddressFromJson(Map<String, dynamic> json) => EmailAddress(
      address: json['Address'] as String?,
    );

Map<String, dynamic> _$EmailAddressToJson(EmailAddress instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Address', instance.address);
  return val;
}

WebSiteAddress _$WebSiteAddressFromJson(Map<String, dynamic> json) =>
    WebSiteAddress(
      uri: json['URI'] as String?,
    );

Map<String, dynamic> _$WebSiteAddressToJson(WebSiteAddress instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('URI', instance.uri);
  return val;
}

NameValue _$NameValueFromJson(Map<String, dynamic> json) => NameValue(
      name: json['Name'] as String?,
      value: json['Value'] as String?,
    );

Map<String, dynamic> _$NameValueToJson(NameValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Value', instance.value);
  return val;
}

TelephoneNumber _$TelephoneNumberFromJson(Map<String, dynamic> json) =>
    TelephoneNumber(
      freeFormNumber: json['FreeFormNumber'] as String?,
    );

Map<String, dynamic> _$TelephoneNumberToJson(TelephoneNumber instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FreeFormNumber', instance.freeFormNumber);
  return val;
}

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['Id'] as String?,
      webAddr: json['WebAddr'] == null
          ? null
          : WebSiteAddress.fromJson(json['WebAddr'] as Map<String, dynamic>),
      primaryPhone: json['PrimaryPhone'] == null
          ? null
          : TelephoneNumber.fromJson(
              json['PrimaryPhone'] as Map<String, dynamic>),
      companyName: json['CompanyName'] as String?,
      syncToken: json['SyncToken'] as String?,
      salesTermRef: json['SalesTermRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['SalesTermRef'] as Map<String, dynamic>),
      balance: (json['Balance'] as num?)?.toDouble(),
      metaData: json['MetaData'] == null
          ? null
          : ModificationMetaData.fromJson(
              json['MetaData'] as Map<String, dynamic>),
      currencyRef: json['CurrencyRef'] == null
          ? null
          : CurrencyRefType.fromJson(
              json['CurrencyRef'] as Map<String, dynamic>),
      fullyQualifiedName: json['FullyQualifiedName'] as String?,
      parentRef: json['ParentRef'] == null
          ? null
          : ReferenceType.fromJson(json['ParentRef'] as Map<String, dynamic>),
      active: json['Active'] as bool?,
      alternatePhone: json['AlternatePhone'] == null
          ? null
          : TelephoneNumber.fromJson(
              json['AlternatePhone'] as Map<String, dynamic>),
      aRAccountRef: json['ARAccountRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['ARAccountRef'] as Map<String, dynamic>),
      balanceWithJobs: (json['BalanceWithJobs'] as num?)?.toDouble(),
      billAddr: json['BillAddr'] == null
          ? null
          : PhysicalAddress.fromJson(json['BillAddr'] as Map<String, dynamic>),
      billWithParent: json['BillWithParent'] as bool?,
      businessNumber: json['BusinessNumber'] as String?,
      customerTypeRef: json['CustomerTypeRef'] as String?,
      defaultTaxCodeRef: json['DefaultTaxCodeRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['DefaultTaxCodeRef'] as Map<String, dynamic>),
      displayName: json['DisplayName'] as String?,
      familyName: json['FamilyName'] as String?,
      fax: json['Fax'] == null
          ? null
          : TelephoneNumber.fromJson(json['Fax'] as Map<String, dynamic>),
      givenName: json['GivenName'] as String?,
      gSTIN: json['GSTIN'] as String?,
      gSTRegistrationType: json['GSTRegistrationType'] as String?,
      isProject: json['IsProject'] as bool?,
      job: json['Job'] as bool?,
      level: json['Level'] as int?,
      middleName: json['MiddleName'] as String?,
      mobile: json['Mobile'] == null
          ? null
          : TelephoneNumber.fromJson(json['Mobile'] as Map<String, dynamic>),
      notes: json['Notes'] as String?,
      openBalanceDate: json['OpenBalanceDate'] as String?,
      paymentMethodRef: json['PaymentMethodRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['PaymentMethodRef'] as Map<String, dynamic>),
      preferredDeliveryMethod: json['PreferredDeliveryMethod'] as String?,
      primaryEmailAddr: json['PrimaryEmailAddr'] == null
          ? null
          : EmailAddress.fromJson(
              json['PrimaryEmailAddr'] as Map<String, dynamic>),
      primaryTaxIdentifier: json['PrimaryTaxIdentifier'] as String?,
      printOnCheckName: json['PrintOnCheckName'] as String?,
      resaleNum: json['ResaleNum'] as String?,
      secondaryTaxIdentifier: json['SecondaryTaxIdentifier'] as String?,
      shipAddr: json['ShipAddr'] == null
          ? null
          : PhysicalAddress.fromJson(json['ShipAddr'] as Map<String, dynamic>),
      source: json['Source'] as String?,
      suffix: json['Suffix'] as String?,
      taxable: json['Taxable'] as bool?,
      TaxExemptionReasonId: json['TaxExemptionReasonId'] as int?,
      title: json['Title'] as String?,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('SyncToken', instance.syncToken);
  writeNotNull('DisplayName', instance.displayName);
  writeNotNull('Title', instance.title);
  writeNotNull('GivenName', instance.givenName);
  writeNotNull('MiddleName', instance.middleName);
  writeNotNull('Suffix', instance.suffix);
  writeNotNull('FamilyName', instance.familyName);
  writeNotNull('PrimaryEmailAddr', instance.primaryEmailAddr);
  writeNotNull('ResaleNum', instance.resaleNum);
  writeNotNull('SecondaryTaxIdentifier', instance.secondaryTaxIdentifier);
  writeNotNull('ARAccountRef', instance.aRAccountRef);
  writeNotNull('DefaultTaxCodeRef', instance.defaultTaxCodeRef);
  writeNotNull('PreferredDeliveryMethod', instance.preferredDeliveryMethod);
  writeNotNull('GSTIN', instance.gSTIN);
  writeNotNull('SalesTermRef', instance.salesTermRef);
  writeNotNull('CustomerTypeRef', instance.customerTypeRef);
  writeNotNull('Fax', instance.fax);
  writeNotNull('BusinessNumber', instance.businessNumber);
  writeNotNull('BillWithParent', instance.billWithParent);
  writeNotNull('CurrencyRef', instance.currencyRef);
  writeNotNull('Mobile', instance.mobile);
  writeNotNull('Job', instance.job);
  writeNotNull('BalanceWithJobs', instance.balanceWithJobs);
  writeNotNull('PrimaryPhone', instance.primaryPhone);
  writeNotNull('OpenBalanceDate', instance.openBalanceDate);
  writeNotNull('Taxable', instance.taxable);
  writeNotNull('AlternatePhone', instance.alternatePhone);
  writeNotNull('MetaData', instance.metaData);
  writeNotNull('ParentRef', instance.parentRef);
  writeNotNull('Notes', instance.notes);
  writeNotNull('WebAddr', instance.webAddr);
  writeNotNull('Active', instance.active);
  writeNotNull('CompanyName', instance.companyName);
  writeNotNull('Balance', instance.balance);
  writeNotNull('ShipAddr', instance.shipAddr);
  writeNotNull('PaymentMethodRef', instance.paymentMethodRef);
  writeNotNull('IsProject', instance.isProject);
  writeNotNull('Source', instance.source);
  writeNotNull('PrimaryTaxIdentifier', instance.primaryTaxIdentifier);
  writeNotNull('GSTRegistrationType', instance.gSTRegistrationType);
  writeNotNull('PrintOnCheckName', instance.printOnCheckName);
  writeNotNull('BillAddr', instance.billAddr);
  writeNotNull('FullyQualifiedName', instance.fullyQualifiedName);
  writeNotNull('Level', instance.level);
  writeNotNull('TaxExemptionReasonId', instance.TaxExemptionReasonId);
  return val;
}

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      title: json['Title'] as String?,
      suffix: json['Suffix'] as String?,
      printOnCheckName: json['PrintOnCheckName'] as String?,
      primaryEmailAddr: json['PrimaryEmailAddr'] == null
          ? null
          : EmailAddress.fromJson(
              json['PrimaryEmailAddr'] as Map<String, dynamic>),
      mobile: json['Mobile'] == null
          ? null
          : TelephoneNumber.fromJson(json['Mobile'] as Map<String, dynamic>),
      middleName: json['MiddleName'] as String?,
      givenName: json['GivenName'] as String?,
      familyName: json['FamilyName'] as String?,
      displayName: json['DisplayName'] as String?,
      active: json['Active'] as bool?,
      metaData: json['MetaData'] == null
          ? null
          : ModificationMetaData.fromJson(
              json['MetaData'] as Map<String, dynamic>),
      syncToken: json['SyncToken'] as String?,
      primaryPhone: json['PrimaryPhone'] == null
          ? null
          : TelephoneNumber.fromJson(
              json['PrimaryPhone'] as Map<String, dynamic>),
      id: json['Id'] as String?,
      billableTime: json['BillableTime'] as bool?,
      billRate: (json['BillRate'] as num?)?.toDouble(),
      birthDate: json['BirthDate'] as String?,
      costRate: (json['CostRate'] as num?)?.toDouble(),
      employeeNumber: json['EmployeeNumber'] as String?,
      gender: json['Gender'] as String?,
      hiredDate: json['HiredDate'] as String?,
      Organization: json['Organization'] as bool?,
      primaryAddr: json['PrimaryAddr'] == null
          ? null
          : PhysicalAddress.fromJson(
              json['PrimaryAddr'] as Map<String, dynamic>),
      releasedDate: json['ReleasedDate'] as String?,
      ssn: json['SSN'] as String?,
      v4IDPseudonym: json['V4IDPseudonym'] as String?,
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('SyncToken', instance.syncToken);
  writeNotNull('PrimaryAddr', instance.primaryAddr);
  writeNotNull('PrimaryEmailAddr', instance.primaryEmailAddr);
  writeNotNull('DisplayName', instance.displayName);
  writeNotNull('Title', instance.title);
  writeNotNull('BillableTime', instance.billableTime);
  writeNotNull('GivenName', instance.givenName);
  writeNotNull('BirthDate', instance.birthDate);
  writeNotNull('MiddleName', instance.middleName);
  writeNotNull('SSN', instance.ssn);
  writeNotNull('PrimaryPhone', instance.primaryPhone);
  writeNotNull('Active', instance.active);
  writeNotNull('ReleasedDate', instance.releasedDate);
  writeNotNull('MetaData', instance.metaData);
  writeNotNull('CostRate', instance.costRate);
  writeNotNull('Mobile', instance.mobile);
  writeNotNull('Gender', instance.gender);
  writeNotNull('HiredDate', instance.hiredDate);
  writeNotNull('BillRate', instance.billRate);
  writeNotNull('Organization', instance.Organization);
  writeNotNull('Suffix', instance.suffix);
  writeNotNull('FamilyName', instance.familyName);
  writeNotNull('PrintOnCheckName', instance.printOnCheckName);
  writeNotNull('EmployeeNumber', instance.employeeNumber);
  writeNotNull('V4IDPseudonym', instance.v4IDPseudonym);
  return val;
}

Estimate _$EstimateFromJson(Map<String, dynamic> json) => Estimate(
      id: json['Id'] as String?,
      syncToken: json['SyncToken'] as String?,
      metaData: json['MetaData'] == null
          ? null
          : ModificationMetaData.fromJson(
              json['MetaData'] as Map<String, dynamic>),
      shipAddr: json['ShipAddr'] == null
          ? null
          : PhysicalAddress.fromJson(json['ShipAddr'] as Map<String, dynamic>),
      billAddr: json['BillAddr'] == null
          ? null
          : PhysicalAddress.fromJson(json['BillAddr'] as Map<String, dynamic>),
      currencyRef: json['CurrencyRef'] == null
          ? null
          : CurrencyRefType.fromJson(
              json['CurrencyRef'] as Map<String, dynamic>),
      salesTermRef: json['SalesTermRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['SalesTermRef'] as Map<String, dynamic>),
      line: (json['Line'] as List<dynamic>?)
          ?.map(const _LineConverter().fromJson)
          .toList(),
      classRef: json['ClassRef'] == null
          ? null
          : ReferenceType.fromJson(json['ClassRef'] as Map<String, dynamic>),
      customerRef: json['CustomerRef'] == null
          ? null
          : ReferenceType.fromJson(json['CustomerRef'] as Map<String, dynamic>),
      txnTaxDetail: json['TxnTaxDetail'] == null
          ? null
          : TxnTaxDetail.fromJson(json['TxnTaxDetail'] as Map<String, dynamic>),
      transactionLocationType: json['TransactionLocationType'] as String?,
      totalAmt: (json['TotalAmt'] as num?)?.toDouble(),
      privateNote: json['PrivateNote'] as String?,
      globalTaxCalculation: $enumDecodeNullable(
          _$GlobalTaxCalculationEnumEnumMap, json['GlobalTaxCalculation']),
      exchangeRate: (json['ExchangeRate'] as num?)?.toDouble(),
      dueDate: json['DueDate'] == null
          ? null
          : Date.fromJson(json['DueDate'] as Map<String, dynamic>),
      docNumber: json['DocNumber'] as String?,
      departmentRef: json['DepartmentRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['DepartmentRef'] as Map<String, dynamic>),
      linkedTxn: (json['LinkedTxn'] as List<dynamic>?)
          ?.map((e) => LinkedTxn.fromJson(e as Map<String, dynamic>))
          .toList(),
      txnDate: json['TxnDate'] as String?,
      acceptedBy: json['AcceptedBy'] as String?,
      acceptedDate: json['AcceptedDate'] == null
          ? null
          : Date.fromJson(json['AcceptedDate'] as Map<String, dynamic>),
      applyTaxAfterDiscount: json['ApplyTaxAfterDiscount'] as bool?,
      billEmail: json['BillEmail'] == null
          ? null
          : EmailAddress.fromJson(json['BillEmail'] as Map<String, dynamic>),
      customerMemo: json['CustomerMemo'] == null
          ? null
          : MemoRef.fromJson(json['CustomerMemo'] as Map<String, dynamic>),
      customField: (json['CustomField'] as List<dynamic>?)
          ?.map((e) => CustomField.fromJson(e as Map<String, dynamic>))
          .toList(),
      emailStatus: json['EmailStatus'] as String?,
      expirationDate: json['ExpirationDate'] == null
          ? null
          : Date.fromJson(json['ExpirationDate'] as Map<String, dynamic>),
      freeFormAddress: json['FreeFormAddress'] as bool?,
      homeTotalAmt: (json['HomeTotalAmt'] as num?)?.toDouble(),
      printStatus: json['PrintStatus'] as String?,
      recurDataRef: json['RecurDataRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['RecurDataRef'] as Map<String, dynamic>),
      shipDate: json['ShipDate'] == null
          ? null
          : Date.fromJson(json['ShipDate'] as Map<String, dynamic>),
      shipFromAddr: json['ShipFromAddr'] == null
          ? null
          : PhysicalAddress.fromJson(
              json['ShipFromAddr'] as Map<String, dynamic>),
      shipMethodRef: json['ShipMethodRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['ShipMethodRef'] as Map<String, dynamic>),
      taxExemptionRef: json['TaxExemptionRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['TaxExemptionRef'] as Map<String, dynamic>),
      txnStatus: json['TxnStatus'] as String?,
    );

Map<String, dynamic> _$EstimateToJson(Estimate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('CustomerRef', instance.customerRef);
  writeNotNull('SyncToken', instance.syncToken);
  writeNotNull('CurrencyRef', instance.currencyRef);
  writeNotNull('BillEmail', instance.billEmail);
  writeNotNull('TxnDate', instance.txnDate);
  writeNotNull('ShipFromAddr', instance.shipFromAddr);
  writeNotNull('ShipDate', instance.shipDate);
  writeNotNull('ClassRef', instance.classRef);
  writeNotNull('PrintStatus', instance.printStatus);
  writeNotNull('CustomField', instance.customField);
  writeNotNull('SalesTermRef', instance.salesTermRef);
  writeNotNull('TxnStatus', instance.txnStatus);
  writeNotNull('LinkedTxn', instance.linkedTxn);
  writeNotNull('GlobalTaxCalculation',
      _$GlobalTaxCalculationEnumEnumMap[instance.globalTaxCalculation]);
  writeNotNull('AcceptedDate', instance.acceptedDate);
  writeNotNull('ExpirationDate', instance.expirationDate);
  writeNotNull('TransactionLocationType', instance.transactionLocationType);
  writeNotNull('DueDate', instance.dueDate);
  writeNotNull('MetaData', instance.metaData);
  writeNotNull('DocNumber', instance.docNumber);
  writeNotNull('PrivateNote', instance.privateNote);
  writeNotNull(
      'Line', instance.line?.map(const _LineConverter().toJson).toList());
  writeNotNull('CustomerMemo', instance.customerMemo);
  writeNotNull('EmailStatus', instance.emailStatus);
  writeNotNull('TxnTaxDetail', instance.txnTaxDetail);
  writeNotNull('AcceptedBy', instance.acceptedBy);
  writeNotNull('ExchangeRate', instance.exchangeRate);
  writeNotNull('ShipAddr', instance.shipAddr);
  writeNotNull('DepartmentRef', instance.departmentRef);
  writeNotNull('ShipMethodRef', instance.shipMethodRef);
  writeNotNull('BillAddr', instance.billAddr);
  writeNotNull('ApplyTaxAfterDiscount', instance.applyTaxAfterDiscount);
  writeNotNull('TotalAmt', instance.totalAmt);
  writeNotNull('RecurDataRef', instance.recurDataRef);
  writeNotNull('TaxExemptionRef', instance.taxExemptionRef);
  writeNotNull('HomeTotalAmt', instance.homeTotalAmt);
  writeNotNull('FreeFormAddress', instance.freeFormAddress);
  return val;
}

CustomField _$CustomFieldFromJson(Map<String, dynamic> json) => CustomField(
      name: json['Name'] as String?,
      definitionId: json['DefinitionId'] as String?,
      stringValue: json['StringValue'] as String?,
      type: $enumDecodeNullable(_$CustomFieldTypeEnumEnumMap, json['Type']),
      booleanValue: json['BooleanValue'] as bool?,
    );

Map<String, dynamic> _$CustomFieldToJson(CustomField instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefinitionId', instance.definitionId);
  writeNotNull('BooleanValue', instance.booleanValue);
  writeNotNull('StringValue', instance.stringValue);
  writeNotNull('Name', instance.name);
  writeNotNull('Type', _$CustomFieldTypeEnumEnumMap[instance.type]);
  return val;
}

const _$CustomFieldTypeEnumEnumMap = {
  CustomFieldTypeEnum.StringType: 'StringType',
};

MemoRef _$MemoRefFromJson(Map<String, dynamic> json) => MemoRef(
      value: json['value'] as String?,
    );

Map<String, dynamic> _$MemoRefToJson(MemoRef instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value', instance.value);
  return val;
}

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
      id: json['Id'] as String?,
      classRef: json['ClassRef'] == null
          ? null
          : ReferenceType.fromJson(json['ClassRef'] as Map<String, dynamic>),
      shipMethodRef: json['ShipMethodRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['ShipMethodRef'] as Map<String, dynamic>),
      shipFromAddr: json['ShipFromAddr'] == null
          ? null
          : PhysicalAddress.fromJson(
              json['ShipFromAddr'] as Map<String, dynamic>),
      shipDate: json['ShipDate'] as String?,
      recurDataRef: json['RecurDataRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['RecurDataRef'] as Map<String, dynamic>),
      printStatus: json['PrintStatus'] as String?,
      homeTotalAmt: (json['HomeTotalAmt'] as num?)?.toDouble(),
      freeFormAddress: json['FreeFormAddress'] as bool?,
      emailStatus: json['EmailStatus'] as String?,
      customField: (json['CustomField'] as List<dynamic>?)
          ?.map((e) => CustomField.fromJson(e as Map<String, dynamic>))
          .toList(),
      customerMemo: json['CustomerMemo'] == null
          ? null
          : MemoRef.fromJson(json['CustomerMemo'] as Map<String, dynamic>),
      billEmail: json['BillEmail'] == null
          ? null
          : EmailAddress.fromJson(json['BillEmail'] as Map<String, dynamic>),
      applyTaxAfterDiscount: json['ApplyTaxAfterDiscount'] as bool?,
      txnDate: json['TxnDate'] as String?,
      linkedTxn: (json['LinkedTxn'] as List<dynamic>?)
          ?.map((e) => LinkedTxn.fromJson(e as Map<String, dynamic>))
          .toList(),
      departmentRef: json['DepartmentRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['DepartmentRef'] as Map<String, dynamic>),
      docNumber: json['DocNumber'] as String?,
      dueDate: json['DueDate'] as String?,
      exchangeRate: (json['ExchangeRate'] as num?)?.toDouble(),
      globalTaxCalculation: $enumDecodeNullable(
          _$GlobalTaxCalculationEnumEnumMap, json['GlobalTaxCalculation']),
      privateNote: json['PrivateNote'] as String?,
      totalAmt: (json['TotalAmt'] as num?)?.toDouble(),
      transactionLocationType: json['TransactionLocationType'] as String?,
      txnTaxDetail: json['TxnTaxDetail'] == null
          ? null
          : TxnTaxDetail.fromJson(json['TxnTaxDetail'] as Map<String, dynamic>),
      customerRef: json['CustomerRef'] == null
          ? null
          : ReferenceType.fromJson(json['CustomerRef'] as Map<String, dynamic>),
      line: (json['Line'] as List<dynamic>?)
          ?.map(const _LineConverter().fromJson)
          .toList(),
      salesTermRef: json['SalesTermRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['SalesTermRef'] as Map<String, dynamic>),
      currencyRef: json['CurrencyRef'] == null
          ? null
          : CurrencyRefType.fromJson(
              json['CurrencyRef'] as Map<String, dynamic>),
      shipAddr: json['ShipAddr'] == null
          ? null
          : PhysicalAddress.fromJson(json['ShipAddr'] as Map<String, dynamic>),
      metaData: json['MetaData'] == null
          ? null
          : ModificationMetaData.fromJson(
              json['MetaData'] as Map<String, dynamic>),
      syncToken: json['SyncToken'] as String?,
      balance: (json['Balance'] as num?)?.toDouble(),
      homeBalance: (json['HomeBalance'] as num?)?.toDouble(),
      allowIPNPayment: json['AllowIPNPayment'] as bool?,
      allowOnlineACHPayment: json['AllowOnlineACHPayment'] as bool?,
      allowOnlineCreditCardPayment:
          json['AllowOnlineCreditCardPayment'] as bool?,
      allowOnlinePayment: json['AllowOnlinePayment'] as bool?,
      BillAddr: json['BillAddr'] == null
          ? null
          : PhysicalAddress.fromJson(json['BillAddr'] as Map<String, dynamic>),
      billEmailBcc: json['BillEmailBcc'] == null
          ? null
          : EmailAddress.fromJson(json['BillEmailBcc'] as Map<String, dynamic>),
      billEmailCc: json['BillEmailCc'] == null
          ? null
          : EmailAddress.fromJson(json['BillEmailCc'] as Map<String, dynamic>),
      deliveryInfo: json['DeliveryInfo'] == null
          ? null
          : DeliveryInfo.fromJson(json['DeliveryInfo'] as Map<String, dynamic>),
      deposit: (json['Deposit'] as num?)?.toDouble(),
      depositToAccountRef: json['DepositToAccountRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['DepositToAccountRef'] as Map<String, dynamic>),
      invoiceLink: json['InvoiceLink'] as String?,
      TaxExemptionRef: json['TaxExemptionRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['TaxExemptionRef'] as Map<String, dynamic>),
      trackingNum: json['TrackingNum'] as String?,
      txnSource: json['TxnSource'] as String?,
    );

Map<String, dynamic> _$InvoiceToJson(Invoice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull(
      'Line', instance.line?.map(const _LineConverter().toJson).toList());
  writeNotNull('CustomerRef', instance.customerRef);
  writeNotNull('SyncToken', instance.syncToken);
  writeNotNull('CurrencyRef', instance.currencyRef);
  writeNotNull('DocNumber', instance.docNumber);
  writeNotNull('BillEmail', instance.billEmail);
  writeNotNull('TxnDate', instance.txnDate);
  writeNotNull('ShipFromAddr', instance.shipFromAddr);
  writeNotNull('ShipDate', instance.shipDate);
  writeNotNull('TrackingNum', instance.trackingNum);
  writeNotNull('ClassRef', instance.classRef);
  writeNotNull('PrintStatus', instance.printStatus);
  writeNotNull('SalesTermRef', instance.salesTermRef);
  writeNotNull('TxnSource', instance.txnSource);
  writeNotNull('LinkedTxn', instance.linkedTxn);
  writeNotNull('DepositToAccountRef', instance.depositToAccountRef);
  writeNotNull('GlobalTaxCalculation',
      _$GlobalTaxCalculationEnumEnumMap[instance.globalTaxCalculation]);
  writeNotNull('AllowOnlineACHPayment', instance.allowOnlineACHPayment);
  writeNotNull('TransactionLocationType', instance.transactionLocationType);
  writeNotNull('DueDate', instance.dueDate);
  writeNotNull('MetaData', instance.metaData);
  writeNotNull('PrivateNote', instance.privateNote);
  writeNotNull('BillEmailCc', instance.billEmailCc);
  writeNotNull('CustomerMemo', instance.customerMemo);
  writeNotNull('EmailStatus', instance.emailStatus);
  writeNotNull('ExchangeRate', instance.exchangeRate);
  writeNotNull('Deposit', instance.deposit);
  writeNotNull('TxnTaxDetail', instance.txnTaxDetail);
  writeNotNull(
      'AllowOnlineCreditCardPayment', instance.allowOnlineCreditCardPayment);
  writeNotNull('CustomField', instance.customField);
  writeNotNull('ShipAddr', instance.shipAddr);
  writeNotNull('DepartmentRef', instance.departmentRef);
  writeNotNull('BillEmailBcc', instance.billEmailBcc);
  writeNotNull('ShipMethodRef', instance.shipMethodRef);
  writeNotNull('BillAddr', instance.BillAddr);
  writeNotNull('ApplyTaxAfterDiscount', instance.applyTaxAfterDiscount);
  writeNotNull('HomeBalance', instance.homeBalance);
  writeNotNull('DeliveryInfo', instance.deliveryInfo);
  writeNotNull('TotalAmt', instance.totalAmt);
  writeNotNull('InvoiceLink', instance.invoiceLink);
  writeNotNull('RecurDataRef', instance.recurDataRef);
  writeNotNull('TaxExemptionRef', instance.TaxExemptionRef);
  writeNotNull('Balance', instance.balance);
  writeNotNull('HomeTotalAmt', instance.homeTotalAmt);
  writeNotNull('FreeFormAddress', instance.freeFormAddress);
  writeNotNull('AllowOnlinePayment', instance.allowOnlinePayment);
  writeNotNull('AllowIPNPayment', instance.allowIPNPayment);
  return val;
}

DeliveryInfo _$DeliveryInfoFromJson(Map<String, dynamic> json) => DeliveryInfo(
      deliveryTime: json['DeliveryTime'] as String?,
      deliveryType: json['DeliveryType'] as String?,
    );

Map<String, dynamic> _$DeliveryInfoToJson(DeliveryInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeliveryType', instance.deliveryType);
  writeNotNull('DeliveryTime', instance.deliveryTime);
  return val;
}

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      syncToken: json['SyncToken'] as String?,
      metaData: json['MetaData'] == null
          ? null
          : ModificationMetaData.fromJson(
              json['MetaData'] as Map<String, dynamic>),
      classRef: json['ClassRef'] == null
          ? null
          : ReferenceType.fromJson(json['ClassRef'] as Map<String, dynamic>),
      id: json['Id'] as String?,
      description: json['Description'] as String?,
      taxClassificationRef: json['TaxClassificationRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['TaxClassificationRef'] as Map<String, dynamic>),
      unitPrice: (json['UnitPrice'] as num?)?.toDouble(),
      type: json['Type'] as String?,
      name: json['Name'] as String?,
      active: json['Active'] as bool?,
      taxable: json['Taxable'] as bool?,
      source: json['Source'] as String?,
      level: json['Level'] as int?,
      parentRef: json['ParentRef'] == null
          ? null
          : ReferenceType.fromJson(json['ParentRef'] as Map<String, dynamic>),
      fullyQualifiedName: json['FullyQualifiedName'] as String?,
      abatementRate: (json['AbatementRate'] as num?)?.toDouble(),
      assetAccountRef: json['AssetAccountRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['AssetAccountRef'] as Map<String, dynamic>),
      expenseAccountRef: json['ExpenseAccountRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['ExpenseAccountRef'] as Map<String, dynamic>),
      incomeAccountRef: json['IncomeAccountRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['IncomeAccountRef'] as Map<String, dynamic>),
      invStartDate: json['InvStartDate'] as String?,
      itemCategoryType: json['ItemCategoryType'] as String?,
      prefVendorRef: json['PrefVendorRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['PrefVendorRef'] as Map<String, dynamic>),
      purchaseCost: (json['PurchaseCost'] as num?)?.toDouble(),
      purchaseDesc: json['PurchaseDesc'] as String?,
      purchaseTaxCodeRef: json['PurchaseTaxCodeRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['PurchaseTaxCodeRef'] as Map<String, dynamic>),
      purchaseTaxIncluded: json['PurchaseTaxIncluded'] as bool?,
      qtyOnHand: (json['QtyOnHand'] as num?)?.toDouble(),
      reorderPoint: (json['ReorderPoint'] as num?)?.toDouble(),
      reverseChargeRate: (json['ReverseChargeRate'] as num?)?.toDouble(),
      salesTaxCodeRef: json['SalesTaxCodeRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['SalesTaxCodeRef'] as Map<String, dynamic>),
      salesTaxIncluded: json['SalesTaxIncluded'] as bool?,
      serviceType: json['ServiceType'] as String?,
      sku: json['Sku'] as String?,
      subItem: json['SubItem'] as bool?,
      trackQtyOnHand: json['TrackQtyOnHand'] as bool?,
      uQCDisplayText: json['UQCDisplayText'] as String?,
      uQCId: json['UQCId'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('ItemCategoryType', instance.itemCategoryType);
  writeNotNull('Name', instance.name);
  writeNotNull('SyncToken', instance.syncToken);
  writeNotNull('InvStartDate', instance.invStartDate);
  writeNotNull('Type', instance.type);
  writeNotNull('QtyOnHand', instance.qtyOnHand);
  writeNotNull('AssetAccountRef', instance.assetAccountRef);
  writeNotNull('Sku', instance.sku);
  writeNotNull('SalesTaxIncluded', instance.salesTaxIncluded);
  writeNotNull('TrackQtyOnHand', instance.trackQtyOnHand);
  writeNotNull('SalesTaxCodeRef', instance.salesTaxCodeRef);
  writeNotNull('ClassRef', instance.classRef);
  writeNotNull('Source', instance.source);
  writeNotNull('PurchaseTaxIncluded', instance.purchaseTaxIncluded);
  writeNotNull('Description', instance.description);
  writeNotNull('AbatementRate', instance.abatementRate);
  writeNotNull('SubItem', instance.subItem);
  writeNotNull('Taxable', instance.taxable);
  writeNotNull('UQCDisplayText', instance.uQCDisplayText);
  writeNotNull('ReorderPoint', instance.reorderPoint);
  writeNotNull('PurchaseDesc', instance.purchaseDesc);
  writeNotNull('MetaData', instance.metaData);
  writeNotNull('PrefVendorRef', instance.prefVendorRef);
  writeNotNull('Active', instance.active);
  writeNotNull('UQCId', instance.uQCId);
  writeNotNull('ReverseChargeRate', instance.reverseChargeRate);
  writeNotNull('PurchaseTaxCodeRef', instance.purchaseTaxCodeRef);
  writeNotNull('ServiceType', instance.serviceType);
  writeNotNull('PurchaseCost', instance.purchaseCost);
  writeNotNull('ParentRef', instance.parentRef);
  writeNotNull('UnitPrice', instance.unitPrice);
  writeNotNull('FullyQualifiedName', instance.fullyQualifiedName);
  writeNotNull('ExpenseAccountRef', instance.expenseAccountRef);
  writeNotNull('Level', instance.level);
  writeNotNull('IncomeAccountRef', instance.incomeAccountRef);
  writeNotNull('TaxClassificationRef', instance.taxClassificationRef);
  return val;
}

Date _$DateFromJson(Map<String, dynamic> json) => Date(
      date: json['date'] as String?,
    );

Map<String, dynamic> _$DateToJson(Date instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('date', instance.date);
  return val;
}

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      id: json['Id'] as String?,
      metaData: json['MetaData'] == null
          ? null
          : ModificationMetaData.fromJson(
              json['MetaData'] as Map<String, dynamic>),
      syncToken: json['SyncToken'] as String?,
      txnSource: json['TxnSource'] as String?,
      depositToAccountRef: json['DepositToAccountRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['DepositToAccountRef'] as Map<String, dynamic>),
      customerRef: json['CustomerRef'] == null
          ? null
          : ReferenceType.fromJson(json['CustomerRef'] as Map<String, dynamic>),
      transactionLocationType: json['TransactionLocationType'] as String?,
      totalAmt: (json['TotalAmt'] as num?)?.toDouble(),
      privateNote: json['PrivateNote'] as String?,
      exchangeRate: (json['ExchangeRate'] as num?)?.toDouble(),
      txnDate: json['TxnDate'] as String?,
      currencyRef: json['CurrencyRef'] == null
          ? null
          : CurrencyRefType.fromJson(
              json['CurrencyRef'] as Map<String, dynamic>),
      taxExemptionRef: json['TaxExemptionRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['TaxExemptionRef'] as Map<String, dynamic>),
      paymentMethodRef: json['PaymentMethodRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['PaymentMethodRef'] as Map<String, dynamic>),
      aRAccountRef: json['ARAccountRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['ARAccountRef'] as Map<String, dynamic>),
      creditCardPayment: json['CreditCardPayment'] == null
          ? null
          : CreditCardPayment.fromJson(
              json['CreditCardPayment'] as Map<String, dynamic>),
      paymentRefNum: json['PaymentRefNum'] as String?,
      unappliedAmt: (json['UnappliedAmt'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('TotalAmt', instance.totalAmt);
  writeNotNull('CustomerRef', instance.customerRef);
  writeNotNull('SyncToken', instance.syncToken);
  writeNotNull('CurrencyRef', instance.currencyRef);
  writeNotNull('PrivateNote', instance.privateNote);
  writeNotNull('PaymentMethodRef', instance.paymentMethodRef);
  writeNotNull('UnappliedAmt', instance.unappliedAmt);
  writeNotNull('DepositToAccountRef', instance.depositToAccountRef);
  writeNotNull('ExchangeRate', instance.exchangeRate);
  writeNotNull('TxnSource', instance.txnSource);
  writeNotNull('ARAccountRef', instance.aRAccountRef);
  writeNotNull('TxnDate', instance.txnDate);
  writeNotNull('CreditCardPayment', instance.creditCardPayment);
  writeNotNull('TransactionLocationType', instance.transactionLocationType);
  writeNotNull('MetaData', instance.metaData);
  writeNotNull('PaymentRefNum', instance.paymentRefNum);
  writeNotNull('TaxExemptionRef', instance.taxExemptionRef);
  return val;
}

CreditCardPayment _$CreditCardPaymentFromJson(Map<String, dynamic> json) =>
    CreditCardPayment(
      creditChargeInfo: json['CreditChargeInfo'] == null
          ? null
          : CreditChargeInfo.fromJson(
              json['CreditChargeInfo'] as Map<String, dynamic>),
      creditChargeResponse: json['CreditChargeResponse'] == null
          ? null
          : CreditChargeResponse.fromJson(
              json['CreditChargeResponse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreditCardPaymentToJson(CreditCardPayment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreditChargeResponse', instance.creditChargeResponse);
  writeNotNull('CreditChargeInfo', instance.creditChargeInfo);
  return val;
}

CreditChargeResponse _$CreditChargeResponseFromJson(
        Map<String, dynamic> json) =>
    CreditChargeResponse(
      authCode: json['AuthCode'] as String?,
      cCTransId: json['CCTransId'] as String?,
      status: $enumDecodeNullable(_$CCPaymentStatusEnumEnumMap, json['Status']),
      txnAuthorizationTime: json['TxnAuthorizationTime'] == null
          ? null
          : DateTime.fromJson(
              json['TxnAuthorizationTime'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreditChargeResponseToJson(
    CreditChargeResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Status', _$CCPaymentStatusEnumEnumMap[instance.status]);
  writeNotNull('AuthCode', instance.authCode);
  writeNotNull('TxnAuthorizationTime', instance.txnAuthorizationTime);
  writeNotNull('CCTransId', instance.cCTransId);
  return val;
}

const _$CCPaymentStatusEnumEnumMap = {
  CCPaymentStatusEnum.Completed: 'Completed',
  CCPaymentStatusEnum.Unknown: 'Unknown',
};

CreditChargeInfo _$CreditChargeInfoFromJson(Map<String, dynamic> json) =>
    CreditChargeInfo(
      type: json['Type'] as String?,
      amount: (json['Amount'] as num?)?.toDouble(),
      postalCode: json['PostalCode'] as String?,
      billAddrStreet: json['BillAddrStreet'] as String?,
      CcExpiryMonth: json['CcExpiryMonth'] as int?,
      ccExpiryYear: json['CcExpiryYear'] as int?,
      nameOnAcct: json['NameOnAcct'] as String?,
      processPayment: json['ProcessPayment'] as bool?,
    );

Map<String, dynamic> _$CreditChargeInfoToJson(CreditChargeInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CcExpiryMonth', instance.CcExpiryMonth);
  writeNotNull('ProcessPayment', instance.processPayment);
  writeNotNull('PostalCode', instance.postalCode);
  writeNotNull('Amount', instance.amount);
  writeNotNull('NameOnAcct', instance.nameOnAcct);
  writeNotNull('CcExpiryYear', instance.ccExpiryYear);
  writeNotNull('Type', instance.type);
  writeNotNull('BillAddrStreet', instance.billAddrStreet);
  return val;
}

Preferences _$PreferencesFromJson(Map<String, dynamic> json) => Preferences(
      syncToken: json['SyncToken'] as String?,
      metaData: json['MetaData'] == null
          ? null
          : ModificationMetaData.fromJson(
              json['MetaData'] as Map<String, dynamic>),
      id: json['Id'] as String?,
      accountingInfoPrefs: json['AccountingInfoPrefs'] == null
          ? null
          : AccountingInfoPrefs.fromJson(
              json['AccountingInfoPrefs'] as Map<String, dynamic>),
      currencyPrefs: json['CurrencyPrefs'] == null
          ? null
          : CurrencyPrefs.fromJson(
              json['CurrencyPrefs'] as Map<String, dynamic>),
      emailMessagesPrefs: json['EmailMessagesPrefs'] == null
          ? null
          : EmailMessagesPrefs.fromJson(
              json['EmailMessagesPrefs'] as Map<String, dynamic>),
      otherPrefs: json['OtherPrefs'] == null
          ? null
          : OtherPrefs.fromJson(json['OtherPrefs'] as Map<String, dynamic>),
      productAndServicesPrefs: json['ProductAndServicesPrefs'] == null
          ? null
          : ProductAndServicesPrefs.fromJson(
              json['ProductAndServicesPrefs'] as Map<String, dynamic>),
      reportPrefs: json['ReportPrefs'] == null
          ? null
          : ReportPrefs.fromJson(json['ReportPrefs'] as Map<String, dynamic>),
      salesFormsPrefs: json['SalesFormsPrefs'] == null
          ? null
          : SalesFormsPrefs.fromJson(
              json['SalesFormsPrefs'] as Map<String, dynamic>),
      taxPrefs: json['TaxPrefs'] == null
          ? null
          : TaxPrefs.fromJson(json['TaxPrefs'] as Map<String, dynamic>),
      timeTrackingPrefs: json['TimeTrackingPrefs'] == null
          ? null
          : TimeTrackingPrefs.fromJson(
              json['TimeTrackingPrefs'] as Map<String, dynamic>),
      vendorAndPurchasesPrefs: json['VendorAndPurchasesPrefs'] == null
          ? null
          : VendorAndPurchasesPrefs.fromJson(
              json['VendorAndPurchasesPrefs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PreferencesToJson(Preferences instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('SyncToken', instance.syncToken);
  writeNotNull('MetaData', instance.metaData);
  writeNotNull('EmailMessagesPrefs', instance.emailMessagesPrefs);
  writeNotNull('ProductAndServicesPrefs', instance.productAndServicesPrefs);
  writeNotNull('ReportPrefs', instance.reportPrefs);
  writeNotNull('AccountingInfoPrefs', instance.accountingInfoPrefs);
  writeNotNull('SalesFormsPrefs', instance.salesFormsPrefs);
  writeNotNull('VendorAndPurchasesPrefs', instance.vendorAndPurchasesPrefs);
  writeNotNull('TaxPrefs', instance.taxPrefs);
  writeNotNull('OtherPrefs', instance.otherPrefs);
  writeNotNull('TimeTrackingPrefs', instance.timeTrackingPrefs);
  writeNotNull('CurrencyPrefs', instance.currencyPrefs);
  return val;
}

EmailMessagesPrefs _$EmailMessagesPrefsFromJson(Map<String, dynamic> json) =>
    EmailMessagesPrefs(
      estimateMessage: json['EstimateMessage'] == null
          ? null
          : EmailMessageType.fromJson(
              json['EstimateMessage'] as Map<String, dynamic>),
      invoiceMessage: json['InvoiceMessage'] == null
          ? null
          : EmailMessageType.fromJson(
              json['InvoiceMessage'] as Map<String, dynamic>),
      salesReceiptMessage: json['SalesReceiptMessage'] == null
          ? null
          : EmailMessageType.fromJson(
              json['SalesReceiptMessage'] as Map<String, dynamic>),
      statementMessage: json['StatementMessage'] == null
          ? null
          : EmailMessageType.fromJson(
              json['StatementMessage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmailMessagesPrefsToJson(EmailMessagesPrefs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InvoiceMessage', instance.invoiceMessage);
  writeNotNull('EstimateMessage', instance.estimateMessage);
  writeNotNull('SalesReceiptMessage', instance.salesReceiptMessage);
  writeNotNull('StatementMessage', instance.statementMessage);
  return val;
}

EmailMessageType _$EmailMessageTypeFromJson(Map<String, dynamic> json) =>
    EmailMessageType(
      message: json['Message'] as String?,
      subject: json['Subject'] as String?,
    );

Map<String, dynamic> _$EmailMessageTypeToJson(EmailMessageType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Message', instance.message);
  writeNotNull('Subject', instance.subject);
  return val;
}

ProductAndServicesPrefs _$ProductAndServicesPrefsFromJson(
        Map<String, dynamic> json) =>
    ProductAndServicesPrefs(
      forPurchase: json['ForPurchase'] as bool?,
      forSales: json['ForSales'] as bool?,
      quantityOnHand: json['QuantityOnHand'] as bool?,
      quantityWithPriceAndRate: json['QuantityWithPriceAndRate'] as bool?,
    );

Map<String, dynamic> _$ProductAndServicesPrefsToJson(
    ProductAndServicesPrefs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('QuantityWithPriceAndRate', instance.quantityWithPriceAndRate);
  writeNotNull('ForPurchase', instance.forPurchase);
  writeNotNull('QuantityOnHand', instance.quantityOnHand);
  writeNotNull('ForSales', instance.forSales);
  return val;
}

ReportPrefs _$ReportPrefsFromJson(Map<String, dynamic> json) => ReportPrefs(
      reportBasis: json['ReportBasis'] as String?,
      calcAgingReportFromTxnDate: json['CalcAgingReportFromTxnDate'] as bool?,
    );

Map<String, dynamic> _$ReportPrefsToJson(ReportPrefs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ReportBasis', instance.reportBasis);
  writeNotNull(
      'CalcAgingReportFromTxnDate', instance.calcAgingReportFromTxnDate);
  return val;
}

AccountingInfoPrefs _$AccountingInfoPrefsFromJson(Map<String, dynamic> json) =>
    AccountingInfoPrefs(
      bookCloseDate: json['BookCloseDate'] as String?,
      classTrackingPerTxn: json['ClassTrackingPerTxn'] as bool?,
      classTrackingPerTxnLine: json['ClassTrackingPerTxnLine'] as bool?,
      customerTerminology: json['CustomerTerminology'] as String?,
      departmentTerminology: json['DepartmentTerminology'] as String?,
      firstMonthOfFiscalYear: json['FirstMonthOfFiscalYear'] as String?,
      taxForm: json['TaxForm'] as String?,
      taxYearMonth: json['TaxYearMonth'] as String?,
      trackDepartments: json['TrackDepartments'] as bool?,
      useAccountNumbers: json['UseAccountNumbers'] as bool?,
    );

Map<String, dynamic> _$AccountingInfoPrefsToJson(AccountingInfoPrefs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FirstMonthOfFiscalYear', instance.firstMonthOfFiscalYear);
  writeNotNull('UseAccountNumbers', instance.useAccountNumbers);
  writeNotNull('TaxYearMonth', instance.taxYearMonth);
  writeNotNull('ClassTrackingPerTxn', instance.classTrackingPerTxn);
  writeNotNull('TrackDepartments', instance.trackDepartments);
  writeNotNull('TaxForm', instance.taxForm);
  writeNotNull('CustomerTerminology', instance.customerTerminology);
  writeNotNull('BookCloseDate', instance.bookCloseDate);
  writeNotNull('DepartmentTerminology', instance.departmentTerminology);
  writeNotNull('ClassTrackingPerTxnLine', instance.classTrackingPerTxnLine);
  return val;
}

SalesFormsPrefs _$SalesFormsPrefsFromJson(Map<String, dynamic> json) =>
    SalesFormsPrefs(
      estimateMessage: json['EstimateMessage'] as String?,
      customFields: (json['CustomField'] as List<dynamic>?)
          ?.map((e) => CustomField.fromJson(e as Map<String, dynamic>))
          .toList(),
      allowDeposit: json[' AllowDeposit'] as bool?,
      allowDiscount: json['AllowDiscount'] as bool?,
      allowEstimates: json['AllowEstimates'] as bool?,
      allowServiceDate: json['AllowServiceDate'] as bool?,
      allowShipping: json['AllowShipping'] as bool?,
      autoApplyCredit: json['AutoApplyCredit'] as bool?,
      customTxnNumbers: json['CustomTxnNumbers'] as bool?,
      defaultCustomerMessage: json['DefaultCustomerMessage'] as String?,
      defaultDiscountAccount: json['DefaultDiscountAccount'] as String?,
      defaultShippingAccount: json['DefaultShippingAccount'] as bool?,
      defaultTerms: json['DefaultTerms'] == null
          ? null
          : ReferenceType.fromJson(
              json['DefaultTerms'] as Map<String, dynamic>),
      emailCopyToCompany: json['EmailCopyToCompany'] as bool?,
      eTransactionAttachPDF: json['ETransactionAttachPDF'] as bool?,
      eTransactionEnabledStatus: json['ETransactionEnabledStatus'] as String?,
      eTransactionPaymentEnabled: json['ETransactionPaymentEnabled'] as bool?,
      iPNSupportEnabled: json['IPNSupportEnabled'] as bool?,
      salesEmailBcc: json['SalesEmailBcc'] == null
          ? null
          : EmailAddress.fromJson(
              json['SalesEmailBcc'] as Map<String, dynamic>),
      salesEmailCc: json['SalesEmailCc'] == null
          ? null
          : EmailAddress.fromJson(json['SalesEmailCc'] as Map<String, dynamic>),
      usingPriceLevels: json['UsingPriceLevels'] as bool?,
      usingProgressInvoicing: json['UsingProgressInvoicing'] as bool?,
    );

Map<String, dynamic> _$SalesFormsPrefsToJson(SalesFormsPrefs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SalesEmailBcc', instance.salesEmailBcc);
  writeNotNull('SalesEmailCc', instance.salesEmailCc);
  writeNotNull('UsingProgressInvoicing', instance.usingProgressInvoicing);
  writeNotNull('CustomField', instance.customFields);
  writeNotNull('AllowServiceDate', instance.allowServiceDate);
  writeNotNull('EstimateMessage', instance.estimateMessage);
  writeNotNull('EmailCopyToCompany', instance.emailCopyToCompany);
  writeNotNull('DefaultCustomerMessage', instance.defaultCustomerMessage);
  writeNotNull('AllowShipping', instance.allowShipping);
  writeNotNull('DefaultDiscountAccount', instance.defaultDiscountAccount);
  writeNotNull('IPNSupportEnabled', instance.iPNSupportEnabled);
  writeNotNull(
      'ETransactionPaymentEnabled', instance.eTransactionPaymentEnabled);
  writeNotNull('DefaultTerms', instance.defaultTerms);
  writeNotNull(' AllowDeposit', instance.allowDeposit);
  writeNotNull('UsingPriceLevels', instance.usingPriceLevels);
  writeNotNull('DefaultShippingAccount', instance.defaultShippingAccount);
  writeNotNull('ETransactionAttachPDF', instance.eTransactionAttachPDF);
  writeNotNull('CustomTxnNumbers', instance.customTxnNumbers);
  writeNotNull('ETransactionEnabledStatus', instance.eTransactionEnabledStatus);
  writeNotNull('AllowEstimates', instance.allowEstimates);
  writeNotNull('AllowDiscount', instance.allowDiscount);
  writeNotNull('AutoApplyCredit', instance.autoApplyCredit);
  return val;
}

VendorAndPurchasesPrefs _$VendorAndPurchasesPrefsFromJson(
        Map<String, dynamic> json) =>
    VendorAndPurchasesPrefs(
      defaultTerms: json['DefaultTerms'] == null
          ? null
          : ReferenceType.fromJson(
              json['DefaultTerms'] as Map<String, dynamic>),
      billableExpenseTracking: json['BillableExpenseTracking'] as bool?,
      defaultMarkup: (json['DefaultMarkup'] as num?)?.toDouble(),
      defaultMarkupAccount: json['DefaultMarkupAccount'] == null
          ? null
          : ReferenceType.fromJson(
              json['DefaultMarkupAccount'] as Map<String, dynamic>),
      pOCustomFields: (json['POCustomField'] as List<dynamic>?)
          ?.map((e) => CustomField.fromJson(e as Map<String, dynamic>))
          .toList(),
      tPAREnabled: json['TPAREnabled'] as bool?,
      trackingByCustomer: json['TrackingByCustomer'] as bool?,
    );

Map<String, dynamic> _$VendorAndPurchasesPrefsToJson(
    VendorAndPurchasesPrefs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('POCustomField', instance.pOCustomFields);
  writeNotNull('DefaultMarkupAccount', instance.defaultMarkupAccount);
  writeNotNull('TrackingByCustomer', instance.trackingByCustomer);
  writeNotNull('DefaultTerms', instance.defaultTerms);
  writeNotNull('BillableExpenseTracking', instance.billableExpenseTracking);
  writeNotNull('DefaultMarkup', instance.defaultMarkup);
  writeNotNull('TPAREnabled', instance.tPAREnabled);
  return val;
}

TaxPrefs _$TaxPrefsFromJson(Map<String, dynamic> json) => TaxPrefs(
      partnerTaxEnabled: json['PartnerTaxEnabled'] as bool?,
      taxGroupCodeRef: json['TaxGroupCodeRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['TaxGroupCodeRef'] as Map<String, dynamic>),
      usingSalesTax: json['UsingSalesTax'] as bool?,
    );

Map<String, dynamic> _$TaxPrefsToJson(TaxPrefs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PartnerTaxEnabled', instance.partnerTaxEnabled);
  writeNotNull('TaxGroupCodeRef', instance.taxGroupCodeRef);
  writeNotNull('UsingSalesTax', instance.usingSalesTax);
  return val;
}

OtherPrefs _$OtherPrefsFromJson(Map<String, dynamic> json) => OtherPrefs(
      nameValues: (json['NameValue'] as List<dynamic>?)
          ?.map((e) => NameValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OtherPrefsToJson(OtherPrefs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NameValue', instance.nameValues);
  return val;
}

TimeTrackingPrefs _$TimeTrackingPrefsFromJson(Map<String, dynamic> json) =>
    TimeTrackingPrefs(
      usingSalesTax: json['UsingSalesTax'] as bool?,
      billCustomers: json['BillCustomers'] as bool?,
      markTimeEntriesBillable: json['MarkTimeEntriesBillable'] as bool?,
      showBillRateToAll: json['ShowBillRateToAll'] as bool?,
      workWeekStartDate: json['WorkWeekStartDate'] as String?,
    );

Map<String, dynamic> _$TimeTrackingPrefsToJson(TimeTrackingPrefs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('WorkWeekStartDate', instance.workWeekStartDate);
  writeNotNull('MarkTimeEntriesBillable', instance.markTimeEntriesBillable);
  writeNotNull('ShowBillRateToAll', instance.showBillRateToAll);
  writeNotNull('UsingSalesTax', instance.usingSalesTax);
  writeNotNull('BillCustomers', instance.billCustomers);
  return val;
}

CurrencyPrefs _$CurrencyPrefsFromJson(Map<String, dynamic> json) =>
    CurrencyPrefs(
      homeCurrency: json['HomeCurrency'] == null
          ? null
          : ReferenceType.fromJson(
              json['HomeCurrency'] as Map<String, dynamic>),
      multiCurrencyEnabled: json['MultiCurrencyEnabled'] as bool?,
    );

Map<String, dynamic> _$CurrencyPrefsToJson(CurrencyPrefs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HomeCurrency', instance.homeCurrency);
  writeNotNull('MultiCurrencyEnabled', instance.multiCurrencyEnabled);
  return val;
}

ProfitAndLoss _$ProfitAndLossFromJson(Map<String, dynamic> json) =>
    ProfitAndLoss(
      columns: json['Columns'] == null
          ? null
          : ProfitColumns.fromJson(json['Columns'] as Map<String, dynamic>),
      header: json['Header'] == null
          ? null
          : ProfitHeader.fromJson(json['Header'] as Map<String, dynamic>),
      rows: json['Rows'] == null
          ? null
          : ProfitRows.fromJson(json['Rows'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfitAndLossToJson(ProfitAndLoss instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Header', instance.header);
  writeNotNull('Rows', instance.rows);
  writeNotNull('Columns', instance.columns);
  return val;
}

ProfitColumns _$ProfitColumnsFromJson(Map<String, dynamic> json) =>
    ProfitColumns(
      columns: (json['Column'] as List<dynamic>?)
          ?.map((e) => ProfitColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfitColumnsToJson(ProfitColumns instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Column', instance.columns);
  return val;
}

ProfitHeader _$ProfitHeaderFromJson(Map<String, dynamic> json) => ProfitHeader(
      className: json['Class'] as String?,
      currency: json['Currency'] as String?,
      customer: json['Customer'] as String?,
      department: json['Department'] as String?,
      employee: json['Employee'] as String?,
      endPeriod: json['EndPeriod'] as String?,
      item: json['Item'] as String?,
      options: (json['Option'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      reportBasis: json['ReportBasis'] as String?,
      reportName: json['ReportName'] as String?,
      startPeriod: json['StartPeriod'] as String?,
      summarizeColumnsBy: json['SummarizeColumnsBy'] as String?,
      time: json['Time'] as String?,
      vendor: json['Vendor'] as String?,
    );

Map<String, dynamic> _$ProfitHeaderToJson(ProfitHeader instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Customer', instance.customer);
  writeNotNull('ReportName', instance.reportName);
  writeNotNull('Vendor', instance.vendor);
  writeNotNull('Option', instance.options);
  writeNotNull('Item', instance.item);
  writeNotNull('Employee', instance.employee);
  writeNotNull('ReportBasis', instance.reportBasis);
  writeNotNull('StartPeriod', instance.startPeriod);
  writeNotNull('Class', instance.className);
  writeNotNull('Currency', instance.currency);
  writeNotNull('EndPeriod', instance.endPeriod);
  writeNotNull('Time', instance.time);
  writeNotNull('Department', instance.department);
  writeNotNull('SummarizeColumnsBy', instance.summarizeColumnsBy);
  return val;
}

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      name: json['name'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$OptionToJson(Option instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('value', instance.value);
  return val;
}

ProfitRows _$ProfitRowsFromJson(Map<String, dynamic> json) => ProfitRows(
      rows: (json['Row'] as List<dynamic>?)
          ?.map((e) => ProfitRow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfitRowsToJson(ProfitRows instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Row', instance.rows);
  return val;
}

ProfitRow _$ProfitRowFromJson(Map<String, dynamic> json) => ProfitRow(
      rows: (json['Rows'] as List<dynamic>?)
          ?.map((e) => ProfitRow.fromJson(e as Map<String, dynamic>))
          .toList(),
      header: json['Header'] == null
          ? null
          : RowHeader.fromJson(json['Header'] as Map<String, dynamic>),
      columns: (json['Columns'] as List<dynamic>?)
          ?.map((e) => ProfitColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfitRowToJson(ProfitRow instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Header', instance.header);
  writeNotNull('Rows', instance.rows);
  writeNotNull('Columns', instance.columns);
  return val;
}

RowHeader _$RowHeaderFromJson(Map<String, dynamic> json) => RowHeader(
      colData: (json['ColData'] as List<dynamic>?)
          ?.map((e) => ColData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RowHeaderToJson(RowHeader instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ColData', instance.colData);
  return val;
}

ColData _$ColDataFromJson(Map<String, dynamic> json) => ColData(
      value: json['value'] as String?,
      id: json['id'] as String?,
      href: json['href'] as String?,
    );

Map<String, dynamic> _$ColDataToJson(ColData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('value', instance.value);
  writeNotNull('href', instance.href);
  return val;
}

ProfitColumn _$ProfitColumnFromJson(Map<String, dynamic> json) => ProfitColumn(
      colTitle: json['ColTitle'] as String?,
      colType: json['ColType'] as String?,
    );

Map<String, dynamic> _$ProfitColumnToJson(ProfitColumn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ColType', instance.colType);
  writeNotNull('ColTitle', instance.colTitle);
  return val;
}

TaxAgency _$TaxAgencyFromJson(Map<String, dynamic> json) => TaxAgency(
      id: json['Id'] as String?,
      metaData: json['MetaData'] == null
          ? null
          : ModificationMetaData.fromJson(
              json['MetaData'] as Map<String, dynamic>),
      syncToken: json['SyncToken'] as String?,
      displayName: json['DisplayName'] as String?,
      lastFileDate: json['LastFileDate'] as String?,
      taxAgencyConfig: json['TaxAgencyConfig'] as String?,
      taxRegistrationNumber: json['TaxRegistrationNumber'] as String?,
      taxTrackedOnPurchases: json['TaxTrackedOnPurchases'] as bool?,
      taxTrackedOnSales: json['TaxTrackedOnSales'] as bool?,
    );

Map<String, dynamic> _$TaxAgencyToJson(TaxAgency instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('DisplayName', instance.displayName);
  writeNotNull('SyncToken', instance.syncToken);
  writeNotNull('TaxTrackedOnSales', instance.taxTrackedOnSales);
  writeNotNull('TaxTrackedOnPurchases', instance.taxTrackedOnPurchases);
  writeNotNull('LastFileDate', instance.lastFileDate);
  writeNotNull('TaxRegistrationNumber', instance.taxRegistrationNumber);
  writeNotNull('MetaData', instance.metaData);
  writeNotNull('TaxAgencyConfig', instance.taxAgencyConfig);
  return val;
}

Vendor _$VendorFromJson(Map<String, dynamic> json) => Vendor(
      displayName: json['DisplayName'] as String?,
      syncToken: json['SyncToken'] as String?,
      metaData: json['MetaData'] == null
          ? null
          : ModificationMetaData.fromJson(
              json['MetaData'] as Map<String, dynamic>),
      id: json['Id'] as String?,
      source: json['Source'] as String?,
      active: json['Active'] as bool?,
      balance: (json['Balance'] as num?)?.toDouble(),
      currencyRef: json['CurrencyRef'] == null
          ? null
          : CurrencyRefType.fromJson(
              json['CurrencyRef'] as Map<String, dynamic>),
      billAddr: json['BillAddr'] == null
          ? null
          : PhysicalAddress.fromJson(json['BillAddr'] as Map<String, dynamic>),
      costRate: (json['CostRate'] as num?)?.toDouble(),
      billRate: (json['BillRate'] as num?)?.toDouble(),
      primaryPhone: json['PrimaryPhone'] == null
          ? null
          : TelephoneNumber.fromJson(
              json['PrimaryPhone'] as Map<String, dynamic>),
      familyName: json['FamilyName'] as String?,
      givenName: json['GivenName'] as String?,
      middleName: json['MiddleName'] as String?,
      mobile: json['Mobile'] == null
          ? null
          : TelephoneNumber.fromJson(json['Mobile'] as Map<String, dynamic>),
      primaryEmailAddr: json['PrimaryEmailAddr'] == null
          ? null
          : EmailAddress.fromJson(
              json['PrimaryEmailAddr'] as Map<String, dynamic>),
      printOnCheckName: json['PrintOnCheckName'] as String?,
      suffix: json['Suffix'] as String?,
      title: json['Title'] as String?,
      gSTRegistrationType: json['GSTRegistrationType'] as String?,
      gSTIN: json['GSTIN'] as String?,
      fax: json['Fax'] == null
          ? null
          : TelephoneNumber.fromJson(json['Fax'] as Map<String, dynamic>),
      businessNumber: json['BusinessNumber'] as String?,
      alternatePhone: json['AlternatePhone'] == null
          ? null
          : TelephoneNumber.fromJson(
              json['AlternatePhone'] as Map<String, dynamic>),
      companyName: json['CompanyName'] as String?,
      webAddr: json['WebAddr'] == null
          ? null
          : WebSiteAddress.fromJson(json['WebAddr'] as Map<String, dynamic>),
      aPAccountRef: json['APAccountRef'] == null
          ? null
          : ReferenceType.fromJson(
              json['APAccountRef'] as Map<String, dynamic>),
      acctNum: json['AcctNum'] as String?,
      hasTPAR: json['HasTPAR'] as bool?,
      otherContactInfo: json['OtherContactInfo'] == null
          ? null
          : ContactInfo.fromJson(
              json['OtherContactInfo'] as Map<String, dynamic>),
      t4AEligible: json['T4AEligible'] as bool?,
      t5018Eligible: json['T5018Eligible'] as bool?,
      taxIdentifier: json['TaxIdentifier'] as String?,
      taxReportingBasis: json['TaxReportingBasis'] as String?,
      termRef: json['TermRef'] == null
          ? null
          : ReferenceType.fromJson(json['TermRef'] as Map<String, dynamic>),
      vendor1099: json['Vendor1099'] as bool?,
      vendorPaymentBankDetail: json['VendorPaymentBankDetail'] == null
          ? null
          : VendorPaymentBankDetail.fromJson(
              json['VendorPaymentBankDetail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VendorToJson(Vendor instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('SyncToken', instance.syncToken);
  writeNotNull('Title', instance.title);
  writeNotNull('GivenName', instance.givenName);
  writeNotNull('MiddleName', instance.middleName);
  writeNotNull('Suffix', instance.suffix);
  writeNotNull('FamilyName', instance.familyName);
  writeNotNull('PrimaryEmailAddr', instance.primaryEmailAddr);
  writeNotNull('DisplayName', instance.displayName);
  writeNotNull('OtherContactInfo', instance.otherContactInfo);
  writeNotNull('APAccountRef', instance.aPAccountRef);
  writeNotNull('TermRef', instance.termRef);
  writeNotNull('Source', instance.source);
  writeNotNull('GSTIN', instance.gSTIN);
  writeNotNull('T4AEligible', instance.t4AEligible);
  writeNotNull('Fax', instance.fax);
  writeNotNull('BusinessNumber', instance.businessNumber);
  writeNotNull('CurrencyRef', instance.currencyRef);
  writeNotNull('HasTPAR', instance.hasTPAR);
  writeNotNull('TaxReportingBasis', instance.taxReportingBasis);
  writeNotNull('Mobile', instance.mobile);
  writeNotNull('PrimaryPhone', instance.primaryPhone);
  writeNotNull('Active', instance.active);
  writeNotNull('AlternatePhone', instance.alternatePhone);
  writeNotNull('MetaData', instance.metaData);
  writeNotNull('Vendor1099', instance.vendor1099);
  writeNotNull('CostRate', instance.costRate);
  writeNotNull('BillRate', instance.billRate);
  writeNotNull('WebAddr', instance.webAddr);
  writeNotNull('T5018Eligible', instance.t5018Eligible);
  writeNotNull('CompanyName', instance.companyName);
  writeNotNull('VendorPaymentBankDetail', instance.vendorPaymentBankDetail);
  writeNotNull('TaxIdentifier', instance.taxIdentifier);
  writeNotNull('AcctNum', instance.acctNum);
  writeNotNull('GSTRegistrationType', instance.gSTRegistrationType);
  writeNotNull('PrintOnCheckName', instance.printOnCheckName);
  writeNotNull('BillAddr', instance.billAddr);
  writeNotNull('Balance', instance.balance);
  return val;
}

ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) => ContactInfo(
      type: json['Type'] as String?,
      telephone: json['Telephone'] == null
          ? null
          : TelephoneNumber.fromJson(json['Telephone'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactInfoToJson(ContactInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', instance.type);
  writeNotNull('Telephone', instance.telephone);
  return val;
}

VendorPaymentBankDetail _$VendorPaymentBankDetailFromJson(
        Map<String, dynamic> json) =>
    VendorPaymentBankDetail(
      bankAccountName: json['BankAccountName'] as String?,
      bankAccountNumber: json['BankAccountNumber'] as String?,
      bankBranchIdentifier: json['BankBranchIdentifier'] as String?,
      statementText: json['StatementText'] as String?,
    );

Map<String, dynamic> _$VendorPaymentBankDetailToJson(
    VendorPaymentBankDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BankAccountName', instance.bankAccountName);
  writeNotNull('BankBranchIdentifier', instance.bankBranchIdentifier);
  writeNotNull('BankAccountNumber', instance.bankAccountNumber);
  writeNotNull('StatementText', instance.statementText);
  return val;
}

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) => BankAccount(
      id: json['id'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      accountType: $enumDecodeNullable(
          _$BankAccountTypeEnumEnumMap, json['accountType']),
      accountNumber: json['accountNumber'] as String?,
      bankCode: json['bankCode'] as String?,
      created: json['created'] as String?,
      isDefault: json['default'] as bool?,
      entityId: json['entityId'] as String?,
      entityType: json['entityType'] as String?,
      inputType: json['inputType'] as String?,
      phone: json['phone'] as String?,
      routingNumber: json['routingNumber'] as String?,
      updated: json['updated'] as String?,
    );

Map<String, dynamic> _$BankAccountToJson(BankAccount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('accountNumber', instance.accountNumber);
  writeNotNull('phone', instance.phone);
  writeNotNull(
      'accountType', _$BankAccountTypeEnumEnumMap[instance.accountType]);
  writeNotNull('routingNumber', instance.routingNumber);
  writeNotNull('updated', instance.updated);
  writeNotNull('default', instance.isDefault);
  writeNotNull('country', instance.country);
  writeNotNull('inputType', instance.inputType);
  writeNotNull('entityType', instance.entityType);
  writeNotNull('created', instance.created);
  writeNotNull('bankCode', instance.bankCode);
  writeNotNull('entityId', instance.entityId);
  return val;
}

const _$BankAccountTypeEnumEnumMap = {
  BankAccountTypeEnum.PERSONAL_CHECKING: 'PERSONAL_CHECKING',
  BankAccountTypeEnum.PERSONAL_SAVINGS: 'PERSONAL_SAVINGS',
  BankAccountTypeEnum.BUSINESS_CHECKING: 'BUSINESS_CHECKING',
};

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      updated: json['updated'] as String?,
      entityType: json['entityType'] as String?,
      entityId: json['entityId'] as String?,
      created: json['created'] as String?,
      name: json['name'] as String?,
      id: json['id'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      cardType: $enumDecodeNullable(_$CardTypeEnumEnumMap, json['cardType']),
      commercialCardCode: json['commercialCardCode'] as String?,
      cvc: json['cvc'] as String?,
      expMonth: json['expMonth'] as String?,
      expYear: json['expYear'] as String?,
      isBusiness: json['isBusiness'] as bool?,
      isDefault: json['default'] as bool?,
      isLevel3Eligible: json['isLevel3Eligible'] as bool?,
      number: json['number'] as String?,
      zeroDollarVerification: json['zeroDollarVerification'] == null
          ? null
          : ZeroDollarVerification.fromJson(
              json['zeroDollarVerification'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CardToJson(Card instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('number', instance.number);
  writeNotNull('expMonth', instance.expMonth);
  writeNotNull('expYear', instance.expYear);
  writeNotNull('cvc', instance.cvc);
  writeNotNull('updated', instance.updated);
  writeNotNull('cardType', _$CardTypeEnumEnumMap[instance.cardType]);
  writeNotNull('name', instance.name);
  writeNotNull('default', instance.isDefault);
  writeNotNull('commercialCardCode', instance.commercialCardCode);
  writeNotNull('address', instance.address);
  writeNotNull('isBusiness', instance.isBusiness);
  writeNotNull('isLevel3Eligible', instance.isLevel3Eligible);
  writeNotNull('created', instance.created);
  writeNotNull('entityType', instance.entityType);
  writeNotNull('entityId', instance.entityId);
  writeNotNull('zeroDollarVerification', instance.zeroDollarVerification);
  return val;
}

const _$CardTypeEnumEnumMap = {
  CardTypeEnum.AmEx: 'AmEx',
  CardTypeEnum.DebitCard: 'DebitCard',
  CardTypeEnum.Discover: 'Discover',
  CardTypeEnum.GiftCard: 'GiftCard',
  CardTypeEnum.MasterCard: 'MasterCard',
  CardTypeEnum.OtherCreditCard: 'OtherCreditCard',
  CardTypeEnum.Visa: 'Visa',
};

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      country: json['country'] as String?,
      postalCode: json['postalCode'] as String?,
      city: json['city'] as String?,
      region: json['region'] as String?,
      streetAddress: json['streetAddress'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('city', instance.city);
  writeNotNull('streetAddress', instance.streetAddress);
  writeNotNull('country', instance.country);
  writeNotNull('postalCode', instance.postalCode);
  writeNotNull('region', instance.region);
  return val;
}

ZeroDollarVerification _$ZeroDollarVerificationFromJson(
        Map<String, dynamic> json) =>
    ZeroDollarVerification(
      type: json['type'] as String?,
      status: json['status'] as String?,
      transactionId: json['transactionId'] as String?,
    );

Map<String, dynamic> _$ZeroDollarVerificationToJson(
    ZeroDollarVerification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('transactionId', instance.transactionId);
  writeNotNull('type', instance.type);
  writeNotNull('status', instance.status);
  return val;
}

Charge _$ChargeFromJson(Map<String, dynamic> json) => Charge(
      status: $enumDecodeNullable(_$ChargeStatusEnumEnumMap, json['status']),
      id: json['id'] as String?,
      created: json['created'] as String?,
      currency: json['currency'] as String?,
      amount: json['amount'] as String?,
      authCode: json['authCode'] as String?,
      description: json['description'] as String?,
      avsStreet: json['avsStreet'] as String?,
      avsZip: json['avsZip'] as String?,
      capture: json['capture'] as bool?,
      captureDetail: json['captureDetail'] == null
          ? null
          : CaptureDetail.fromJson(
              json['captureDetail'] as Map<String, dynamic>),
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardSecurityCodeMatch: json['cardSecurityCodeMatch'] as String?,
      context: json['context'] == null
          ? null
          : PaymentContext.fromJson(json['context'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$ChargeToJson(Charge instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('currency', instance.currency);
  writeNotNull('amount', instance.amount);
  writeNotNull('context', instance.context);
  writeNotNull('card', instance.card);
  writeNotNull('capture', instance.capture);
  writeNotNull('description', instance.description);
  writeNotNull('authCode', instance.authCode);
  writeNotNull('status', _$ChargeStatusEnumEnumMap[instance.status]);
  writeNotNull('created', instance.created);
  writeNotNull('captureDetail', instance.captureDetail);
  writeNotNull('avsZip', instance.avsZip);
  writeNotNull('token', instance.token);
  writeNotNull('cardSecurityCodeMatch', instance.cardSecurityCodeMatch);
  writeNotNull('avsStreet', instance.avsStreet);
  return val;
}

const _$ChargeStatusEnumEnumMap = {
  ChargeStatusEnum.AUTHORIZED: 'AUTHORIZED',
  ChargeStatusEnum.DECLINED: 'DECLINED',
  ChargeStatusEnum.CAPTURED: 'CAPTURED',
  ChargeStatusEnum.CANCELLED: 'CANCELLED',
  ChargeStatusEnum.SETTLED: 'SETTLED',
  ChargeStatusEnum.REFUNDED: 'REFUNDED',
  ChargeStatusEnum.ISSUED: 'ISSUED',
};

CaptureDetail _$CaptureDetailFromJson(Map<String, dynamic> json) =>
    CaptureDetail(
      context: json['context'] == null
          ? null
          : PaymentContext.fromJson(json['context'] as Map<String, dynamic>),
      description: json['description'] as String?,
      amount: json['amount'] as String?,
      created: json['created'] as String?,
    );

Map<String, dynamic> _$CaptureDetailToJson(CaptureDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('amount', instance.amount);
  writeNotNull('description', instance.description);
  writeNotNull('context', instance.context);
  writeNotNull('created', instance.created);
  return val;
}

PaymentContext _$PaymentContextFromJson(Map<String, dynamic> json) =>
    PaymentContext(
      mobile: json['mobile'] as bool?,
      deviceInfo: json['deviceInfo'] == null
          ? null
          : DeviceInfo.fromJson(json['deviceInfo'] as Map<String, dynamic>),
      isEcommerce: json['isEcommerce'] as bool?,
      lodging: json['lodging'] == null
          ? null
          : Lodging.fromJson(json['lodging'] as Map<String, dynamic>),
      recurring: json['recurring'] as bool?,
      restaurant: json['restaurant'] == null
          ? null
          : Restaurant.fromJson(json['restaurant'] as Map<String, dynamic>),
      tax: json['tax'] as String?,
    );

Map<String, dynamic> _$PaymentContextToJson(PaymentContext instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mobile', instance.mobile);
  writeNotNull('isEcommerce', instance.isEcommerce);
  writeNotNull('tax', instance.tax);
  writeNotNull('deviceInfo', instance.deviceInfo);
  writeNotNull('recurring', instance.recurring);
  writeNotNull('restaurant', instance.restaurant);
  writeNotNull('lodging', instance.lodging);
  return val;
}

DeviceInfo _$DeviceInfoFromJson(Map<String, dynamic> json) => DeviceInfo(
      id: json['id'] as String?,
      type: json['type'] as String?,
      encrypted: json['encrypted'] as bool?,
      ipAddress: json['ipAddress'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      macAddress: json['macAddress'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$DeviceInfoToJson(DeviceInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('macAddress', instance.macAddress);
  writeNotNull('encrypted', instance.encrypted);
  writeNotNull('ipAddress', instance.ipAddress);
  writeNotNull('longitude', instance.longitude);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('latitude', instance.latitude);
  writeNotNull('type', instance.type);
  return val;
}

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => Restaurant(
      taxAmount: (json['taxAmount'] as num?)?.toDouble(),
      beverageAmount: (json['beverageAmount'] as num?)?.toDouble(),
      foodAmount: (json['foodAmount'] as num?)?.toDouble(),
      serverID: json['serverID'] as String?,
      tipAmount: (json['tipAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('beverageAmount', instance.beverageAmount);
  writeNotNull('serverID', instance.serverID);
  writeNotNull('taxAmount', instance.taxAmount);
  writeNotNull('foodAmount', instance.foodAmount);
  writeNotNull('tipAmount', instance.tipAmount);
  return val;
}

Lodging _$LodgingFromJson(Map<String, dynamic> json) => Lodging(
      chargeType:
          $enumDecodeNullable(_$ChargeTypeEnumEnumMap, json['chargeType']),
      checkInDate: json['checkInDate'] as String?,
      checkOutDate: json['checkOutDate'] as String?,
      extraCharges: (json['extraCharges'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      folioID: json['folioID'] as String?,
      lengthOfStay: (json['lengthOfStay'] as num?)?.toDouble(),
      roomRate: (json['roomRate'] as num?)?.toDouble(),
      specialProgram: $enumDecodeNullable(
          _$SpecialProgramEnumEnumMap, json['specialProgram']),
      totalAuthAmount: (json['totalAuthAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LodgingToJson(Lodging instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lengthOfStay', instance.lengthOfStay);
  writeNotNull('checkInDate', instance.checkInDate);
  writeNotNull('roomRate', instance.roomRate);
  writeNotNull(
      'specialProgram', _$SpecialProgramEnumEnumMap[instance.specialProgram]);
  writeNotNull('chargeType', _$ChargeTypeEnumEnumMap[instance.chargeType]);
  writeNotNull('folioID', instance.folioID);
  writeNotNull('extraCharges', instance.extraCharges);
  writeNotNull('checkOutDate', instance.checkOutDate);
  writeNotNull('totalAuthAmount', instance.totalAuthAmount);
  return val;
}

const _$ChargeTypeEnumEnumMap = {
  ChargeTypeEnum.ConventionFees: 'ConventionFees',
  ChargeTypeEnum.GiftShop: 'GiftShop',
  ChargeTypeEnum.Golf: 'Golf',
  ChargeTypeEnum.HealthClub: 'HealthClub',
  ChargeTypeEnum.Hotel: 'Hotel',
  ChargeTypeEnum.Restaurant: 'Restaurant',
  ChargeTypeEnum.Salon: 'Salon',
  ChargeTypeEnum.Tennis: 'Tennis',
};

const _$SpecialProgramEnumEnumMap = {
  SpecialProgramEnum.AdvanceDeposit: 'AdvanceDeposit',
  SpecialProgramEnum.AssuredReservation: 'AssuredReservation',
  SpecialProgramEnum.DelayedCharge: 'DelayedCharge',
  SpecialProgramEnum.ExpressService: 'ExpressService',
  SpecialProgramEnum.NormalCharge: 'NormalCharge',
  SpecialProgramEnum.NoShowCharge: 'NoShowCharge',
};

ECheck _$ECheckFromJson(Map<String, dynamic> json) => ECheck(
      id: json['id'] as String?,
      created: json['created'] as String?,
      amount: json['amount'] as String?,
      description: json['description'] as String?,
      context: json['context'] == null
          ? null
          : PaymentContext.fromJson(json['context'] as Map<String, dynamic>),
      token: json['token'] as String?,
      authCode: json['authCode'] as String?,
      status: $enumDecodeNullable(_$ECheckStatusEnumMap, json['status']),
      bankAccount: json['bankAccount'] == null
          ? null
          : BankAccount.fromJson(json['bankAccount'] as Map<String, dynamic>),
      bankAccountOnFile: json['bankAccountOnFile'] as String?,
      checkNumber: json['checkNumber'] as String?,
      paymentMode: json['paymentMode'] as String?,
    );

Map<String, dynamic> _$ECheckToJson(ECheck instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('paymentMode', instance.paymentMode);
  writeNotNull('amount', instance.amount);
  writeNotNull('description', instance.description);
  writeNotNull('checkNumber', instance.checkNumber);
  writeNotNull('authCode', instance.authCode);
  writeNotNull('context', instance.context);
  writeNotNull('status', _$ECheckStatusEnumMap[instance.status]);
  writeNotNull('bankAccount', instance.bankAccount);
  writeNotNull('created', instance.created);
  writeNotNull('token', instance.token);
  writeNotNull('bankAccountOnFile', instance.bankAccountOnFile);
  return val;
}

const _$ECheckStatusEnumMap = {
  ECheckStatus.PENDING: 'PENDING',
  ECheckStatus.SUCCEEDED: 'SUCCEEDED',
  ECheckStatus.DECLINED: 'DECLINED',
  ECheckStatus.VOIDED: 'VOIDED',
  ECheckStatus.REFUNDED: 'REFUNDED',
};

UrlDiscovery _$UrlDiscoveryFromJson(Map<String, dynamic> json) => UrlDiscovery(
      authorization_endpoint: json['authorization_endpoint'] as String,
      claims_supported: (json['claims_supported'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      id_token_signing_alg_values_supported:
          (json['id_token_signing_alg_values_supported'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      issuer: json['issuer'] as String?,
      jwks_uri: json['jwks_uri'] as String,
      response_types_supported:
          (json['response_types_supported'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      revocation_endpoint: json['revocation_endpoint'] as String,
      scopes_supported: (json['scopes_supported'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      subject_types_supported:
          (json['subject_types_supported'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      token_endpoint: json['token_endpoint'] as String,
      token_endpoint_auth_methods_supported:
          (json['token_endpoint_auth_methods_supported'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      userinfo_endpoint: json['userinfo_endpoint'] as String,
    );

Map<String, dynamic> _$UrlDiscoveryToJson(UrlDiscovery instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('issuer', instance.issuer);
  val['authorization_endpoint'] = instance.authorization_endpoint;
  val['token_endpoint'] = instance.token_endpoint;
  val['userinfo_endpoint'] = instance.userinfo_endpoint;
  val['revocation_endpoint'] = instance.revocation_endpoint;
  val['jwks_uri'] = instance.jwks_uri;
  val['response_types_supported'] = instance.response_types_supported;
  val['subject_types_supported'] = instance.subject_types_supported;
  val['id_token_signing_alg_values_supported'] =
      instance.id_token_signing_alg_values_supported;
  val['scopes_supported'] = instance.scopes_supported;
  val['token_endpoint_auth_methods_supported'] =
      instance.token_endpoint_auth_methods_supported;
  val['claims_supported'] = instance.claims_supported;
  return val;
}

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) =>
    TokenResponse(
      refresh_token: json['refresh_token'] as String?,
      access_token: json['access_token'] as String?,
      expires_in: json['expires_in'] as int?,
      idToken: json['idToken'] as String?,
      x_refresh_token_expires_in: json['x_refresh_token_expires_in'] as int?,
    );

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('refresh_token', instance.refresh_token);
  writeNotNull('access_token', instance.access_token);
  writeNotNull('expires_in', instance.expires_in);
  writeNotNull(
      'x_refresh_token_expires_in', instance.x_refresh_token_expires_in);
  writeNotNull('idToken', instance.idToken);
  return val;
}

QueryResponse _$QueryResponseFromJson(Map<String, dynamic> json) =>
    QueryResponse(
      account: (json['Account'] as List<dynamic>?)
          ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
      companyInfo: (json['CompanyInfo'] as List<dynamic>?)
          ?.map((e) => CompanyInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      bill: (json['Bill'] as List<dynamic>?)
          ?.map((e) => Bill.fromJson(e as Map<String, dynamic>))
          .toList(),
      customer: (json['Customer'] as List<dynamic>?)
          ?.map((e) => Customer.fromJson(e as Map<String, dynamic>))
          .toList(),
      employee: (json['Employee'] as List<dynamic>?)
          ?.map((e) => Employee.fromJson(e as Map<String, dynamic>))
          .toList(),
      estimate: (json['Estimate'] as List<dynamic>?)
          ?.map((e) => Estimate.fromJson(e as Map<String, dynamic>))
          .toList(),
      invoice: (json['Invoice'] as List<dynamic>?)
          ?.map((e) => Invoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      item: (json['Item'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      payment: (json['Payment'] as List<dynamic>?)
          ?.map((e) => Payment.fromJson(e as Map<String, dynamic>))
          .toList(),
      preferences: (json['Preferences'] as List<dynamic>?)
          ?.map((e) => Preferences.fromJson(e as Map<String, dynamic>))
          .toList(),
      taxAgency: (json['TaxAgency'] as List<dynamic>?)
          ?.map((e) => TaxAgency.fromJson(e as Map<String, dynamic>))
          .toList(),
      vendor: (json['Vendor'] as List<dynamic>?)
          ?.map((e) => Vendor.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxResults: json['maxResults'] as int?,
      startPosition: json['startPosition'] as int?,
    );

Map<String, dynamic> _$QueryResponseToJson(QueryResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Account', instance.account);
  writeNotNull('CompanyInfo', instance.companyInfo);
  writeNotNull('Bill', instance.bill);
  writeNotNull('Customer', instance.customer);
  writeNotNull('Employee', instance.employee);
  writeNotNull('Estimate', instance.estimate);
  writeNotNull('Invoice', instance.invoice);
  writeNotNull('Item', instance.item);
  writeNotNull('Payment', instance.payment);
  writeNotNull('Preferences', instance.preferences);
  writeNotNull('TaxAgency', instance.taxAgency);
  writeNotNull('Vendor', instance.vendor);
  writeNotNull('startPosition', instance.startPosition);
  writeNotNull('maxResults', instance.maxResults);
  return val;
}

DeleteResponse _$DeleteResponseFromJson(Map<String, dynamic> json) =>
    DeleteResponse(
      status: json['status'] as String?,
      domain: json['domain'] as String?,
      id: json['Id'] as String?,
    );

Map<String, dynamic> _$DeleteResponseToJson(DeleteResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('domain', instance.domain);
  writeNotNull('Id', instance.id);
  return val;
}

ProfitAndLossQuery _$ProfitAndLossQueryFromJson(Map<String, dynamic> json) =>
    ProfitAndLossQuery(
      customer: json['customer'] as String?,
      vendor: json['vendor'] as String?,
      item: json['item'] as String?,
      department: json['department'] as String?,
      accounting_method: json['accounting_method'] as String?,
      adjusted_gain_loss: json['adjusted_gain_loss'] as String?,
      date_macro: json['date_macro'] as String?,
      end_date: json['end_date'] as String?,
      qzurl: json['qzurl'] as String?,
      reportClass: json['class'] as String?,
      sort_order: json['sort_order'] as String?,
      start_date: json['start_date'] as String?,
      summarize_column_by: json['summarize_column_by'] as String?,
    );

Map<String, dynamic> _$ProfitAndLossQueryToJson(ProfitAndLossQuery instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('customer', instance.customer);
  writeNotNull('qzurl', instance.qzurl);
  writeNotNull('accounting_method', instance.accounting_method);
  writeNotNull('end_date', instance.end_date);
  writeNotNull('date_macro', instance.date_macro);
  writeNotNull('adjusted_gain_loss', instance.adjusted_gain_loss);
  writeNotNull('class', instance.reportClass);
  writeNotNull('item', instance.item);
  writeNotNull('sort_order', instance.sort_order);
  writeNotNull('summarize_column_by', instance.summarize_column_by);
  writeNotNull('department', instance.department);
  writeNotNull('vendor', instance.vendor);
  writeNotNull('start_date', instance.start_date);
  return val;
}

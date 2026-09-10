@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZRAP_LOTTERY_ITM'
}
@AccessControl.authorizationCheck: #MANDATORY
define view entity ZC_RAP_LOTTERY_ITM
  as projection on ZR_RAP_LOTTERY_ITM
  association [1..1] to ZR_RAP_LOTTERY_ITM as _BaseEntity on $projection.ID = _BaseEntity.ID and $projection.ItemNo = _BaseEntity.ItemNo
{
  key ID,
  ParentID,
  ItemNo,
  @Consumption.valueHelpDefinition: [{ 
    entity: { 
      name: 'ZCE_BUSINESS_PARTNER_VH', 
      element: 'businesspartner' }   
  }]
  CustomerID,
  LotteryNumber,
  IsWinner,
  @Semantics: {
    user.createdBy: true
  }
  Createdby,
  @Semantics: {
    user.lastChangedBy: true
  }
  Changedby,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  LocalLastChanged,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  LastChanged,
  _BaseEntity,
  _LotteryHeader : redirected to parent ZC_RAP_LOTTERY
}

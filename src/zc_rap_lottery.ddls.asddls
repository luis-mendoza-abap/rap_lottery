@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: 'Lottery App'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZRAP_LOTTERY'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_RAP_LOTTERY
  provider contract transactional_query
  as projection on ZR_RAP_LOTTERY
  association [1..1] to ZR_RAP_LOTTERY as _BaseEntity on $projection.ID = _BaseEntity.ID
{
  key ID,
  LotteryDate,
  Text,
  @Consumption.valueHelpDefinition: [{
    entity: { name: 'ZI_RAP_LOTTERY_STATUS_VH', element: 'Status' }
}]
  Status,
  Discount,
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
  _LotteryItem : redirected to composition child ZC_RAP_LOTTERY_ITM
}

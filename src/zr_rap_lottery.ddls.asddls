@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZRAP_LOTTERY'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_RAP_LOTTERY
  as select from zrap_lottery
  composition [0..*] of ZR_RAP_LOTTERY_ITM as _LotteryItem
{
  @Semantics.uuid: true
  key id as ID,
  lottery_date as LotteryDate,
  text as Text,
  status as Status,
  discount as Discount,
  @Semantics.user.createdBy: true
  createdby as Createdby,
  @Semantics.user.lastChangedBy: true
  changedby as Changedby,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed as LocalLastChanged,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed as LastChanged,
  /* Associations */
  _LotteryItem
}

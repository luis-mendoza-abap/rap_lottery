@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZRAP_LOTTERY_ITM'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define view entity ZR_RAP_LOTTERY_ITM
  as select from zrap_lottery_itm
  association to parent ZR_RAP_LOTTERY as _LotteryHeader
    on $projection.ID = _LotteryHeader.ID
{
  key id as ID,
  key item_no as ItemNo,
  customer_id as CustomerID,
  lottery_number as LotteryNumber,
  is_winner as IsWinner,
  @Semantics.user.createdBy: true
  createdby as Createdby,
  @Semantics.user.lastChangedBy: true
  changedby as Changedby,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed as LocalLastChanged,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed as LastChanged,
  /* Associations */
  _LotteryHeader
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Lottery status selection'
@ObjectModel.resultSet.sizeCategory: #XS
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_RAP_LOTTERY_STATUS_VH
  as select from zrap_lottery
{
  @UI.textArrangement: #TEXT_ONLY
  key 'Created'     as Status,
      'Created'     as StatusText
}
union all select from zrap_lottery
{
  key 'In Progress' as Status,
      'In Progress' as StatusText
}
union all select from zrap_lottery
{
  key 'Completed'   as Status,
      'Completed'   as StatusText
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Lottery status selection'
@ObjectModel.resultSet.sizeCategory: #XS
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_RAP_LOTTERY_STATUS_VH
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZDOM_LOTTERY_STATUS' )
{
  @UI.hidden: true
  key value_low as Status,

      @UI.textArrangement: #TEXT_ONLY
      text      as StatusText
}
where language = $session.system_language

@EndUserText.label: 'Value Help customers from Sandbox'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_CE_BUSINESS_PARTNER'
define custom entity ZCE_BusinessPartner
 {
  key BusinessPartner : abap.char( 10 );
      FirstName       : abap.char( 40 );
      LastName        : abap.char( 40 );
      OrganizationName: abap.char( 40 );
}

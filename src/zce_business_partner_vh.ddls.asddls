@EndUserText.label: 'Value Help Business Partner'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_BP_VH_MOCK_QUERY'
define custom entity ZCE_BUSINESS_PARTNER_VH
{
  @UI.lineItem: [{ position: 10 }]
  @UI.selectionField: [{ position: 10 }]
  key businesspartner          : abap.char( 10 );

  @UI.lineItem: [{ position: 20 }]
  @UI.selectionField: [{ position: 20 }]
  firstname                    : abap.char( 40 );

  @UI.lineItem: [{ position: 30 }]
  @UI.selectionField: [{ position: 30 }]
  lastname                     : abap.char( 40 );

  @UI.lineItem: [{ position: 40 }]
  organizationname             : abap.char( 80 );

  @UI.lineItem: [{ position: 50 }]
  businesspartnercategory      : abap.char( 1 );
}

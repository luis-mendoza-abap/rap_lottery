CLASS zcl_ce_business_partner DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ce_business_partner IMPLEMENTATION.


  METHOD if_rap_query_provider~select.
    " 1. Get BTP destination 'SAP_HUB_SANDBOX'
    DATA(lo_dest) = cl_http_destination_provider=>create_by_cloud_destination(
                      i_name = 'SAP_HUB_SANDBOX' ).
    DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_dest ).

    " 2. Create OData client
    DATA(lo_client_proxy) = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
      is_proxy_model_key = VALUE #( repository_id = 'DEFAULT' proxy_model_id = 'ZHUB_BU_PARTNER' )
      io_http_client     = lo_http_client
      iv_relative_service_root = '/s4hanacloud/sap/opu/odata/sap/API_BUSINESS_PARTNER' ).

    " 3. Execute read request (GET)
    DATA(lo_request) = lo_client_proxy->create_resource_for_entity_set( 'A_BusinessPartner' )->create_request_for_read( ).
    DATA(lo_response) = lo_request->execute( ).

    DATA lt_business_partners TYPE TABLE OF zce_businesspartner.
    lo_response->get_business_data( IMPORTING et_business_data = lt_business_partners ).

    " 4. Return the list
    io_response->set_data( lt_business_partners ).
    io_response->set_total_number_of_records( lines( lt_business_partners ) ).
  ENDMETHOD.
ENDCLASS.


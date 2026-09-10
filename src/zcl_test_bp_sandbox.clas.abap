CLASS zcl_test_bp_sandbox DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_test_bp_sandbox IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lo_http_client        TYPE REF TO if_web_http_client,
          lo_odata_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_read_list_request  TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_read_list_response TYPE REF TO /iwbep/if_cp_response_read_lst,
          lt_business_data      TYPE TABLE OF zcl_hub_bu_partner=>tys_a_business_partner_type.

    TRY.
        " 1. Instanciar el destino HTTP a partir del Communication Scenario en BTP
        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
                                 comm_scenario = 'ZBTP_TRIAL_SAP_COM_0309' ).

        " 2. Crear la instancia del cliente HTTP
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

        " 3. Crear el OData Remote Proxy asociando el Service Consumption Model
        lo_odata_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
                                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                                     proxy_model_id      = 'ZHUB_BU_PARTNER'
                                                                     proxy_model_version = '0001' )
                                 io_http_client           = lo_http_client
                                 iv_relative_service_root = '' ).

        " 4. Crear la solicitud de lectura para la entidad A_BusinessPartner
        lo_read_list_request = lo_odata_client_proxy->create_resource_for_entity_set(
                                 zcl_hub_bu_partner=>gcs_entity_set-a_business_partner
                               )->create_request_for_read( ).

        " 5. Definir la paginación de la consulta
        lo_read_list_request->set_top( 5 ).

        " 6. Ejecutar la llamada OData remota
        lo_read_list_response = lo_read_list_request->execute( ).

        " 7. Extraer los datos mapeados a la estructura ABAP del modelo
        lo_read_list_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        " Presentar resultados
        out->write( |¡Consulta ejecutada exitosamente!| ).
        out->write( |Registros recuperados: { lines( lt_business_data ) }| ).
        out->write( lt_business_data ).

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        out->write( |Error remoto OData: { lx_remote->get_text( ) }| ).

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        out->write( |Error de Gateway: { lx_gateway->get_text( ) }| ).

      CATCH cx_http_dest_provider_error INTO DATA(lx_dest).
        out->write( |Error en Destination Provider: { lx_dest->get_text( ) }| ).

      CATCH cx_web_http_client_error INTO DATA(lx_http).
        out->write( |Error en cliente HTTP: { lx_http->get_text( ) }| ).

      CATCH cx_root INTO DATA(lx_root).
        out->write( |Error general: { lx_root->get_text( ) }| ).
    ENDTRY.

  ENDMETHOD.

ENDCLASS.

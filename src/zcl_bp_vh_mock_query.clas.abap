CLASS zcl_bp_vh_mock_query DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider .

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_bp_vh_mock_query IMPLEMENTATION.

  METHOD if_rap_query_provider~select.

DATA: lt_create TYPE STANDARD TABLE OF  zce_business_partner_vh WITH EMPTY KEY.

    lt_create = VALUE #(
          ( businesspartner = '1000001' firstname = 'Carlos'   lastname = 'Mendoza'   organizationname = 'Tech Solutions S.A.'     businesspartnercategory = '1' )
          ( businesspartner = '1000002' firstname = 'Ana'      lastname = 'Gómez'     organizationname = 'Innovación Digital'      businesspartnercategory = '1' )
          ( businesspartner = '1000003' firstname = 'Luis'     lastname = 'Hernández' organizationname = 'Logística Global S.A.'  businesspartnercategory = '2' )
          ( businesspartner = '1000004' firstname = 'María'    lastname = 'Torres'    organizationname = 'Servicios Industriales' businesspartnercategory = '2' )
          ( businesspartner = '1000005' firstname = 'Roberto'  lastname = 'Sánchez'   organizationname = 'Consultoría ABAP Cloud'  businesspartnercategory = '1' )
        ).


    IF io_request->is_data_requested( ).
      io_response->set_data( lt_create ).
    ENDIF.

    IF io_request->is_total_numb_of_rec_requested( ).
      io_response->set_total_number_of_records( lines( lt_create ) ).
    ENDIF.

    io_request->get_sort_elements( ).
    io_request->get_paging( ).

  ENDMETHOD.

ENDCLASS.

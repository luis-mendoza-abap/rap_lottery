CLASS lhc_lotteryitem DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS getposition FOR DETERMINE ON MODIFY
      keys FOR LotteryItem~getposition.

ENDCLASS.

CLASS lhc_lotteryitem IMPLEMENTATION.

  METHOD getposition.
   DATA lv_max_item TYPE i.

  READ ENTITIES OF ZR_RAP_LOTTERY IN LOCAL MODE
    ENTITY LotteryItem
      FIELDS ( ParentID ItemNo )
      WITH CORRESPONDING #( keys )
    RESULT DATA(lt_items).

  IF lt_items IS INITIAL.
    RETURN.
  ENDIF.

  LOOP AT lt_items ASSIGNING FIELD-SYMBOL(<fs_item>).

    READ ENTITIES OF ZR_RAP_LOTTERY IN LOCAL MODE
      ENTITY LotteryHeader BY \_LotteryItem
        FIELDS ( ItemNo )
        WITH VALUE #( ( ID        = <fs_item>-ParentID
                        %is_draft = <fs_item>-%is_draft ) )
      RESULT DATA(lt_existing_items).

    lv_max_item = 0.
    LOOP AT lt_existing_items INTO DATA(ls_existing).
      IF ls_existing-ItemNo > lv_max_item.
        lv_max_item = ls_existing-ItemNo.
      ENDIF.
    ENDLOOP.

    DATA(lv_next_item) = lv_max_item + 10.

    MODIFY ENTITIES OF ZR_RAP_LOTTERY IN LOCAL MODE
      ENTITY LotteryItem
        UPDATE FIELDS ( ItemNo )
        WITH VALUE #( ( %tky   = <fs_item>-%tky
                        ItemNo = lv_next_item ) ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

CLASS LHC_ZR_RAP_LOTTERY DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR LotteryHeader
        RESULT result.
ENDCLASS.

CLASS LHC_ZR_RAP_LOTTERY IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
ENDCLASS.

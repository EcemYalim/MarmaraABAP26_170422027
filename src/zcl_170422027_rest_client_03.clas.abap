CLASS zcl_170422027_rest_client_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_170422027_rest_client_03 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.



    DATA(lo_rest_client) =
      NEW lcl_rest_client( io_out = out ).

    DATA(lo_eml_service) =
      NEW lcl_eml_service( io_out = out ).


    DATA(ls_user) =
      lo_rest_client->get_user_from_rest(
        iv_username = 'duygukilic_2' ).


    out->write( '--- USER FROM REST ---' ).
    out->write( ls_user ).


    lo_eml_service->save_user(
      is_user = ls_user ).

  ENDMETHOD.

ENDCLASS.

CLASS zcl_bp_abstr_170422027 DEFINITION ABSTRACT PUBLIC.

  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_bp_number TYPE numc5
                                   iv_name      TYPE string
                                   iv_city      TYPE string,

      get_bp_number RETURNING VALUE(rv_bp) TYPE numc5,
      get_name RETURNING VALUE(rv_name) TYPE string,
      get_city RETURNING VALUE(rv_city) TYPE string,

      get_role ABSTRACT RETURNING VALUE(rv_role) TYPE string,
      display_specific_data ABSTRACT,
      display.

  PROTECTED SECTION.
    DATA: mv_bp_number TYPE numc5,
          mv_name      TYPE string,
          mv_city      TYPE string.


  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_bp_abstr_170422027 IMPLEMENTATION.

  METHOD constructor.
    mv_bp_number = iv_bp_number.
    mv_name = iv_name.
    mv_city = iv_city.
  ENDMETHOD.

  METHOD get_name.
    rv_name = mv_name.

  ENDMETHOD.
METHOD get_bp_number.
 rv_bp = mv_bp_number.

ENDMETHOD.

  METHOD get_city.
    rv_city = mv_city.

  ENDMETHOD.

  METHOD display.

  ENDMETHOD.



ENDCLASS.

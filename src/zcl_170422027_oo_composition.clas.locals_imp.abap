*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS zcl_pricing_service DEFINITION.

  PUBLIC SECTION.

    METHODS calculate_total

      IMPORTING
        iv_qty        TYPE i
        iv_price      TYPE any
        iv_tax_rate   TYPE any

      RETURNING
        VALUE(rv_net) TYPE dmbtr.


ENDCLASS.


CLASS zcl_pricing_service IMPLEMENTATION.
  METHOD calculate_total.
    DATA(lv_subtotal) = iv_qty * iv_price.
    rv_net = lv_subtotal + (  lv_subtotal * iv_tax_rate ).

  ENDMETHOD..

ENDCLASS.

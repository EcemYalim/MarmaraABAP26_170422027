CLASS zcl_cust_cl2fr_if_170422027 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_cust_intf_170422027 .

    METHODS: constructor IMPORTING iv_customer_no TYPE kunnr
                                   iv_name        TYPE string
                                   iv_credit_limit TYPE i
                                   iv_country TYPE land1.

  PROTECTED SECTION.
  PRIVATE SECTION.
     DATA: mv_customer_no TYPE kunnr,
           mv_name TYPE string,
           mv_credit_limit TYPE i,
           mv_country TYPE land1.


ENDCLASS.


CLASS zcl_cust_cl2fr_if_170422027 IMPLEMENTATION.

  METHOD constructor.
     mv_customer_no = iv_customer_no.
     mv_name = iv_name.
     mv_credit_limit = iv_credit_limit.
     mv_country = iv_country.

 ENDMETHOD.

  METHOD zif_cust_intf_170422027~calculate_tax.

   rv_tax = 0.
  ENDMETHOD.


  METHOD zif_cust_intf_170422027~check_credit.
    DATA(lv_allowed) = mv_credit_limit * 80 / 100.
    IF iv_order_amount <= lv_allowed.
      rv_ok = abap_true.

   ELSE.
     rv_ok = abap_false.

   ENDIF.
  ENDMETHOD.


  METHOD zif_cust_intf_170422027~get_credit_limit.
    rv_limit = mv_credit_limit.
  ENDMETHOD.


  METHOD zif_cust_intf_170422027~get_customer_no.
    rv_cust = mv_customer_no.
  ENDMETHOD.


  METHOD zif_cust_intf_170422027~get_name.
    rv_name = mv_name.
  ENDMETHOD.
ENDCLASS.

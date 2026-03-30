*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations





CLASS lcl_connection_eml DEFINITION.

  PUBLIC SECTION.

    CLASS-METHODS:
      insert_data,
      read_data,
      update_data,
      delete_data.
ENDCLASS.



CLASS lcl_connection_eml IMPLEMENTATION.

  METHOD insert_data.

    DATA: lt_create TYPE TABLE FOR CREATE zr_tcon_170422027.

    lt_create = VALUE #(
    ( %cid = 'C1'
       Carrid = 'LH'
       Connid = '0400'
       AirportFrom = 'FRA'
       CityFrom = 'Frankfurt'
       CountryFrom = 'DE'
       AirportTo = 'JFK'
       CityTo = 'New York'
       CountryTo = 'US' )

       ( %cid = 'C2'
       Carrid = 'TK'
       Connid = '1923'
       AirportFrom = 'IST'
       CityFrom = 'Istyanbul'
       CountryFrom = 'tkp'
       AirportTo = 'ASD'
       CityTo = 'Ankara'
       CountryTo = 'TR' )


        ( %cid = 'C3'
       Carrid = 'AA'
       Connid = '0010'
       AirportFrom = 'LHR'
       CityFrom = 'London'
       CountryFrom = 'gb'
       AirportTo = 'sfo'
       CityTo = 'san fransisco'
       CountryTo = 'US' ) ).

    MODIFY ENTITIES OF zr_tcon_170422027
     ENTITY ZrTcon170422027
         CREATE FIELDS (

    Carrid
    Connid
    AirportFrom
    CityFrom
    CountryFrom
    AirportTo
    CityTo
    CountryTo ) WITH lt_create

    FAILED DATA(ls_failed).

    IF ls_failed IS INITIAL.
      COMMIT ENTITIES.

    ENDIF.

  ENDMETHOD.

  METHOD read_data.
    DATA read_keys TYPE TABLE FOR READ IMPORT zr_tcon_170422027.
    DATA connections TYPE TABLE FOR READ RESULT zr_tcon_170422027.

    read_keys = VALUE #( (  uuid = '167A341893551FD18B86B2CAE7C48F8C' ) ).

    READ ENTITIES OF zr_tcon_170422027

    ENTITY ZrTcon170422027

    ALL FIELDS
    WITH CORRESPONDING #( read_keys )
    RESULT connections.

    ENDMETHOD.



    METHOD update_data.

    DATA lt_update TYPE TABLE FOR UPDATE zr_tcon_170422027.

    SELECT uuid
    FROM ztcon_170422027
    where uuid = '167A341893551FD18B86B2CAE7C48F8C'
    INTO TABLE @DATA(lt_keys)
    UP TO 1 ROWS.


    LOOP AT lt_keys INTO DATA(ls_key).

    lt_update = VALUE #( (

    uuid = ls_key-uuid
    CityTo = 'Paris2'
    %control-CityTo = if_abap_behv=>mk-on ) ).

    ENDLOOP.

    "EML"
    MODIFY ENTITIES OF zr_tcon_170422027
    ENTITY ZrTcon170422027
    UPDATE FROM lt_update
    FAILED DATA(ls_failed).

    IF ls_failed IS INITIAL.
        COMMIT ENTITIES.

    ENDIF.

 ENDMETHOD.

     METHOD delete_data.

    DATA lt_delete TYPE TABLE FOR DELETE zr_tcon_170422027.

     lt_delete = VALUE #( ( uuid = '167A341893551FD18B86AE766533CF8C'  ) ).


    MODIFY ENTITIES OF zr_tcon_170422027
    ENTITY ZrTcon170422027
    DELETE FROM lt_delete
    FAILED DATA(ls_failed).

    IF ls_failed IS INITIAL.
        COMMIT ENTITIES.

    ENDIF.

 ENDMETHOD.




ENDCLASS.

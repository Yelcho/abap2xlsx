*&---------------------------------------------------------------------*
*& Report  ZDEMO_EXCEL1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zdemo_excel1.


DATA: lo_excel                TYPE REF TO zcl_excel,
      lo_worksheet            TYPE REF TO zcl_excel_worksheet,
      lo_hyperlink            TYPE REF TO zcl_excel_hyperlink,
      column_dimension        TYPE REF TO zcl_excel_worksheet_columndime.

CONSTANTS: gc_save_file_name TYPE string VALUE '01_HelloWorld.xlsx'.
INCLUDE zdemo_excel_outputopt_incl.


START-OF-SELECTION.
  " Creates active sheet
  CREATE OBJECT lo_excel.

  " Get active sheet
  lo_worksheet = lo_excel->get_active_worksheet( ).
*  lo_worksheet->set_title( ip_title = 'Sheet1' ).
  lo_worksheet->set_cell( ip_column = 'B' ip_row = 2 ip_value = 'Hello world' ).
  lo_worksheet->set_cell( ip_column = 'B' ip_row = 3 ip_value = sy-datum ).
  lo_worksheet->set_cell( ip_column = 'C' ip_row = 3 ip_value = sy-uzeit ).
  lo_hyperlink = zcl_excel_hyperlink=>create_external_link( iv_url = 'http://www.abap2xlsx.org' ).
  lo_worksheet->set_cell( ip_column = 'B' ip_row = 4 ip_value = 'Click here to visit abap2xlsx homepage' ip_hyperlink = lo_hyperlink ).

  column_dimension = lo_worksheet->get_column_dimension( ip_column = 'B' ).
  column_dimension->set_width( ip_width = 11 ).



*** Create output
  lcl_output=>output( lo_excel ).

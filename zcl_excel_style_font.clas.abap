class ZCL_EXCEL_STYLE_FONT definition
  public
  final
  create public .

public section.
  type-pools ABAP .

  data BOLD type FLAG .
  data COLOR type ZEXCEL_S_STYLE_COLOR .
  constants C_FAMILY_DECORATIVE type ZEXCEL_STYLE_FONT_FAMILY value 5 ##NO_TEXT.
  constants C_FAMILY_MODERN type ZEXCEL_STYLE_FONT_FAMILY value 3 ##NO_TEXT.
  constants C_FAMILY_NONE type ZEXCEL_STYLE_FONT_FAMILY value 0 ##NO_TEXT.
  constants C_FAMILY_ROMAN type ZEXCEL_STYLE_FONT_FAMILY value 1 ##NO_TEXT.
  constants C_FAMILY_SCRIPT type ZEXCEL_STYLE_FONT_FAMILY value 4 ##NO_TEXT.
  constants C_FAMILY_SWISS type ZEXCEL_STYLE_FONT_FAMILY value 2 ##NO_TEXT.
  constants C_NAME_ARIAL type ZEXCEL_STYLE_FONT_NAME value 'Arial' ##NO_TEXT.
  constants C_NAME_CALIBRI type ZEXCEL_STYLE_FONT_NAME value 'Calibri' ##NO_TEXT.
  constants C_NAME_CAMBRIA type ZEXCEL_STYLE_FONT_NAME value 'Cambria' ##NO_TEXT.
  constants C_NAME_ROMAN type ZEXCEL_STYLE_FONT_NAME value 'Times New Roman' ##NO_TEXT.
  constants C_SCHEME_MAJOR type ZEXCEL_STYLE_FONT_SCHEME value 'major' ##NO_TEXT.
  constants C_SCHEME_NONE type ZEXCEL_STYLE_FONT_SCHEME value '' ##NO_TEXT.
  constants C_SCHEME_MINOR type ZEXCEL_STYLE_FONT_SCHEME value 'minor' ##NO_TEXT.
  constants C_UNDERLINE_DOUBLE type ZEXCEL_STYLE_FONT_UNDERLINE value 'double' ##NO_TEXT.
  constants C_UNDERLINE_DOUBLEACCOUNTING type ZEXCEL_STYLE_FONT_UNDERLINE value 'doubleAccounting' ##NO_TEXT.
  constants C_UNDERLINE_NONE type ZEXCEL_STYLE_FONT_UNDERLINE value 'none' ##NO_TEXT.
  constants C_UNDERLINE_SINGLE type ZEXCEL_STYLE_FONT_UNDERLINE value 'single' ##NO_TEXT.
  constants C_UNDERLINE_SINGLEACCOUNTING type ZEXCEL_STYLE_FONT_UNDERLINE value 'singleAccounting' ##NO_TEXT.
  data FAMILY type ZEXCEL_STYLE_FONT_FAMILY value 2 ##NO_TEXT.
  data ITALIC type FLAG .
  data NAME type ZEXCEL_STYLE_FONT_NAME value 'Calibri' ##NO_TEXT.
  data SCHEME type ZEXCEL_STYLE_FONT_SCHEME value 'minor' ##NO_TEXT.
  data SIZE type ZEXCEL_STYLE_FONT_SIZE value 11 ##NO_TEXT.
  data STRIKETHROUGH type FLAG .
  data UNDERLINE type FLAG .
  data UNDERLINE_MODE type ZEXCEL_STYLE_FONT_UNDERLINE .

  methods CONSTRUCTOR .
  methods GET_STRUCTURE
    returning
      value(ES_FONT) type ZEXCEL_S_STYLE_FONT .
  methods CALCULATE_TEXT_WIDTH
    importing
      !I_TEXT type ZEXCEL_CELL_VALUE
    returning
      value(R_WIDTH) type I .
protected section.
private section.
ENDCLASS.



CLASS ZCL_EXCEL_STYLE_FONT IMPLEMENTATION.


method CALCULATE_TEXT_WIDTH.
  " Addition to solve issue #120, contribution by Stefan Schmoecker
  r_width = strlen( i_text ).
  " use scale factor based on default 11
  " ( don't know where defaultsetting is stored currently )
  r_width = r_width * me->size / 11.
  endmethod.


method CONSTRUCTOR.
  me->color-rgb       = zcl_excel_style_color=>c_black.
  me->color-theme     = zcl_excel_style_color=>c_theme_not_set.
  me->color-indexed   = zcl_excel_style_color=>c_indexed_not_set.
  me->scheme          = zcl_excel_style_font=>c_scheme_minor.
  me->underline_mode  = zcl_excel_style_font=>c_underline_single.
  endmethod.


method GET_STRUCTURE.

  es_font-bold            = me->bold.
  es_font-italic          = me->italic.
  es_font-underline       = me->underline.
  es_font-underline_mode  = me->underline_mode.
  es_font-strikethrough   = me->strikethrough.
  es_font-size            = me->size.
  es_font-color           = me->color.
  es_font-name            = me->name.
  es_font-family          = me->family.
  es_font-scheme          = me->scheme.

  endmethod.
ENDCLASS.

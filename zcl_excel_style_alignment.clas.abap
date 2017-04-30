class ZCL_EXCEL_STYLE_ALIGNMENT definition
  public
  final
  create public .

public section.
  type-pools ABAP .

  constants C_HORIZONTAL_GENERAL type ZEXCEL_ALIGNMENT value 'general' ##NO_TEXT.
  constants C_HORIZONTAL_LEFT type ZEXCEL_ALIGNMENT value 'left' ##NO_TEXT.
  constants C_HORIZONTAL_RIGHT type ZEXCEL_ALIGNMENT value 'right' ##NO_TEXT.
  constants C_HORIZONTAL_CENTER type ZEXCEL_ALIGNMENT value 'center' ##NO_TEXT.
  constants C_HORIZONTAL_CENTER_CONTINUOUS type ZEXCEL_ALIGNMENT value 'centerContinuous' ##NO_TEXT.
  constants C_HORIZONTAL_JUSTIFY type ZEXCEL_ALIGNMENT value 'justify' ##NO_TEXT.
  constants C_VERTICAL_BOTTOM type ZEXCEL_ALIGNMENT value 'bottom' ##NO_TEXT.
  constants C_VERTICAL_TOP type ZEXCEL_ALIGNMENT value 'top' ##NO_TEXT.
  constants C_VERTICAL_CENTER type ZEXCEL_ALIGNMENT value 'center' ##NO_TEXT.
  constants C_VERTICAL_JUSTIFY type ZEXCEL_ALIGNMENT value 'justify' ##NO_TEXT.
  data HORIZONTAL type ZEXCEL_ALIGNMENT .
  data VERTICAL type ZEXCEL_ALIGNMENT .
  data TEXTROTATION type ZEXCEL_TEXT_ROTATION value 0 ##NO_TEXT.
  data WRAPTEXT type FLAG .
  data SHRINKTOFIT type FLAG .
  data INDENT type ZEXCEL_INDENT value 0 ##NO_TEXT.

  methods CONSTRUCTOR .
  methods GET_STRUCTURE
    returning
      value(ES_ALIGNMENT) type ZEXCEL_S_STYLE_ALIGNMENT .
protected section.
private section.
ENDCLASS.



CLASS ZCL_EXCEL_STYLE_ALIGNMENT IMPLEMENTATION.


method CONSTRUCTOR.
  horizontal  = me->c_horizontal_general.
  vertical    = me->c_vertical_bottom.
  wrapText    = abap_false.
  shrinkToFit = abap_false.
  endmethod.


method GET_STRUCTURE.

  es_alignment-horizontal   = me->horizontal.
  es_alignment-vertical     = me->vertical.
  es_alignment-textrotation = me->textrotation.
  es_alignment-wraptext     = me->wraptext.
  es_alignment-shrinktofit  = me->shrinktofit.
  es_alignment-indent       = me->indent.

  endmethod.
ENDCLASS.

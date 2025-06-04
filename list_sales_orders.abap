REPORT zlist_sales_orders.

*----------------------------------------------------------------------
* Display list of sales orders
*----------------------------------------------------------------------
TABLES: vbak.

SELECT * FROM vbak INTO TABLE @DATA(lt_vbak) UP TO 100 ROWS.

LOOP AT lt_vbak INTO DATA(ls_vbak).
  WRITE: / ls_vbak-vbeln, ls_vbak-auart, ls_vbak-erdat, ls_vbak-kunnr.
ENDLOOP.


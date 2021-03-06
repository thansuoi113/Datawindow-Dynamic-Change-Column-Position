$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cbx_print from checkbox within w_main
end type
type st_1 from statictext within w_main
end type
type cb_exit from commandbutton within w_main
end type
type cb_print from commandbutton within w_main
end type
type cb_down from commandbutton within w_main
end type
type cb_right from commandbutton within w_main
end type
type cb_left from commandbutton within w_main
end type
type cb_up from commandbutton within w_main
end type
type lb_1 from listbox within w_main
end type
type dw_1 from datawindow within w_main
end type
end forward

global type w_main from window
integer x = 503
integer y = 212
integer width = 2912
integer height = 1588
boolean titlebar = true
string title = "Dynamic Change Column Position"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
cbx_print cbx_print
st_1 st_1
cb_exit cb_exit
cb_print cb_print
cb_down cb_down
cb_right cb_right
cb_left cb_left
cb_up cb_up
lb_1 lb_1
dw_1 dw_1
end type
global w_main w_main

type variables
integer yunit = 50
integer xunit = 50
end variables

forward prototypes
public subroutine wf_v_move (string acolumn, integer amoved)
public subroutine wf_h_move (string acolumn, integer amoved)
end prototypes

public subroutine wf_v_move (string acolumn, integer amoved);Long oldy,newy

dw_1.SetRedraw(False)

oldy = Long(dw_1.Describe(acolumn + '.y'))
newy = oldy + amoved
dw_1.Modify(acolumn + ".y = '" + String(newy) + "'")

dw_1.SetRedraw(True)

end subroutine

public subroutine wf_h_move (string acolumn, integer amoved);Long oldx,newx

dw_1.SetRedraw(False)

oldx = Long(dw_1.Describe(acolumn + '.x'))
newx = oldx + amoved
dw_1.Modify(acolumn + ".x = '" + String(newx) + "'")

dw_1.SetRedraw(True)

end subroutine

on w_main.create
this.cbx_print=create cbx_print
this.st_1=create st_1
this.cb_exit=create cb_exit
this.cb_print=create cb_print
this.cb_down=create cb_down
this.cb_right=create cb_right
this.cb_left=create cb_left
this.cb_up=create cb_up
this.lb_1=create lb_1
this.dw_1=create dw_1
this.Control[]={this.cbx_print,&
this.st_1,&
this.cb_exit,&
this.cb_print,&
this.cb_down,&
this.cb_right,&
this.cb_left,&
this.cb_up,&
this.lb_1,&
this.dw_1}
end on

on w_main.destroy
destroy(this.cbx_print)
destroy(this.st_1)
destroy(this.cb_exit)
destroy(this.cb_print)
destroy(this.cb_down)
destroy(this.cb_right)
destroy(this.cb_left)
destroy(this.cb_up)
destroy(this.lb_1)
destroy(this.dw_1)
end on

event open;String ls_objects,ls_obj
Long ll_pos,ll_len

lb_1.Reset()

ls_objects = Trim(dw_1.Describe('datawindow.Objects'))

Do While (Pos(ls_objects,"~t") > 0)
	ll_pos = Pos(ls_objects,"~t")
	ll_len = ll_pos - 1
	ls_obj = Left(ls_objects,ll_len)
	ls_objects = Right(ls_objects,Len(ls_objects) - ll_pos)
	If Right(ls_obj,2) <> '_t' Then
		lb_1.AddItem(ls_obj + ' - ' +  dw_1.Describe(ls_obj + '.tag'))
	End If
Loop

If Right(ls_objects,2) <> '_t' Then
	lb_1.AddItem(ls_objects + ' - ' +  dw_1.Describe(ls_objects + '.tag'))
End If

dw_1.Object.datawindow.Print.Preview = True

// Read information from the registry or ini file here and set the initial style

end event

type cbx_print from checkbox within w_main
integer x = 2391
integer y = 1128
integer width = 302
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Visible"
boolean lefttext = true
end type

event clicked;String ls_Item

ls_Item = lb_1.SelectedItem()

If ls_Item = "" Then
	MessageBox("Note", "You did not select an object to set!")
	Return
Else
	If IsNull(ls_Item) Then
		MessageBox("Note", "There is no settable object in the data window!")
		Return
	End If
End If

ls_Item = Left(ls_Item,Pos(ls_Item," ") - 1)

If Checked Then
	dw_1.Modify(ls_Item + ".visible = '1'")
Else
	dw_1.Modify(ls_Item + ".visible = '0'")
End If

end event

type st_1 from statictext within w_main
integer x = 2235
integer y = 60
integer width = 617
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Column DataWindow"
boolean focusrectangle = false
end type

type cb_exit from commandbutton within w_main
integer x = 2382
integer y = 1356
integer width = 334
integer height = 108
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Exit"
boolean cancel = true
end type

event clicked;// Read the data window information here and write it into the registry or ini file

close(parent)
end event

type cb_print from commandbutton within w_main
integer x = 2382
integer y = 1232
integer width = 334
integer height = 108
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Print Page"
end type

event clicked;dw_1.print()
end event

type cb_down from commandbutton within w_main
integer x = 2446
integer y = 996
integer width = 201
integer height = 108
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Down"
end type

event clicked;String ls_Item

ls_Item = lb_1.SelectedItem()

If ls_Item = "" Then
	MessageBox("Note", "You did not select an object to set!")
	Return
Else
	If IsNull(ls_Item) Then
		MessageBox("Note", "There is no settable object in the data window!")
		Return
	End If
End If

ls_Item = Left(ls_Item,Pos(ls_Item," ") - 1)

wf_v_move(ls_Item,yunit)

end event

type cb_right from commandbutton within w_main
integer x = 2583
integer y = 876
integer width = 201
integer height = 108
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Right"
end type

event clicked;String ls_Item

ls_Item = lb_1.SelectedItem()

If ls_Item = "" Then
	MessageBox("Note", "You did not select an object to set!")
	Return
Else
	If IsNull(ls_Item) Then
		MessageBox("Note", "There is no settable object in the data window!")
		Return
	End If
End If

ls_Item = Left(ls_Item,Pos(ls_Item," ") - 1)

wf_h_move(ls_Item,xunit)

end event

type cb_left from commandbutton within w_main
integer x = 2309
integer y = 876
integer width = 201
integer height = 108
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Left"
end type

event clicked;String ls_Item

ls_Item = lb_1.SelectedItem()

If ls_Item = "" Then
	MessageBox("Note", "You did not select an object to set!")
	Return
Else
	If IsNull(ls_Item) Then
		MessageBox("Note", "There is no settable object in the data window!")
		Return
	End If
End If

ls_Item = Left(ls_Item,Pos(ls_Item," ") - 1)

wf_h_move(ls_Item,0 - xunit)

end event

type cb_up from commandbutton within w_main
integer x = 2446
integer y = 756
integer width = 201
integer height = 108
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Up"
end type

event clicked;String ls_Item

ls_Item = lb_1.SelectedItem()

If ls_Item = "" Then
	MessageBox("Note", "You did not select an object to set!")
	Return
Else
	If IsNull(ls_Item) Then
		MessageBox("Note", "There is no settable object in the data window!")
		Return
	End If
End If

ls_Item = Left(ls_Item,Pos(ls_Item," ") - 1)

wf_v_move(ls_Item,0 - yunit)

end event

type lb_1 from listbox within w_main
integer x = 2226
integer y = 140
integer width = 635
integer height = 604
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;String ls_Item

ls_Item = lb_1.SelectedItem()

If ls_Item = "" Or IsNull(ls_Item) Then
	Return
End If

String ls_print

ls_Item = Left(ls_Item,Pos(ls_Item," ") - 1)

ls_print = dw_1.Describe(ls_Item + ".visible")

If ls_print = '1' Then
	cbx_print.Checked = True
Else
	cbx_print.Checked = False
End If

end event

type dw_1 from datawindow within w_main
integer x = 32
integer y = 28
integer width = 2167
integer height = 1428
integer taborder = 10
string dataobject = "d_person"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


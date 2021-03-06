$PBExportHeader$w_demo2.srw
forward
global type w_demo2 from window
end type
type cb_add from commandbutton within w_demo2
end type
type sle_itemtext from singlelineedit within w_demo2
end type
type st_2 from statictext within w_demo2
end type
type st_1 from statictext within w_demo2
end type
type sle_parenttext from singlelineedit within w_demo2
end type
end forward

global type w_demo2 from window
integer width = 1586
integer height = 1196
boolean titlebar = true
string title = "Dynamic Menu"
string menuname = "m_main"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_add cb_add
sle_itemtext sle_itemtext
st_2 st_2
st_1 st_1
sle_parenttext sle_parenttext
end type
global w_demo2 w_demo2

type variables

end variables

forward prototypes
public subroutine wf_dynamicmenuitems (menu am_item)
end prototypes

public subroutine wf_dynamicmenuitems (menu am_item);string ls_text, ls_tag, ls_micro

ls_text = am_item.text
ls_tag = am_item.tag
ls_micro = am_item.MicroHelp

messagebox(ls_tag, ls_text)
end subroutine

on w_demo2.create
if this.MenuName = "m_main" then this.MenuID = create m_main
this.cb_add=create cb_add
this.sle_itemtext=create sle_itemtext
this.st_2=create st_2
this.st_1=create st_1
this.sle_parenttext=create sle_parenttext
this.Control[]={this.cb_add,&
this.sle_itemtext,&
this.st_2,&
this.st_1,&
this.sle_parenttext}
end on

on w_demo2.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_add)
destroy(this.sle_itemtext)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_parenttext)
end on

event open;n_dynamicmenu ln_dynamicmenu
Menu lm_menu, lm_itemsub
Integer li_item

ln_dynamicmenu.of_setparent( This)

lm_menu = This.MenuID

lm_itemsub = lm_menu.item[1]

li_item = ln_dynamicmenu.of_additem(lm_itemsub, "menu 1 1" )
li_item = ln_dynamicmenu.of_additem(lm_itemsub, "menu 1 2" )
li_item = ln_dynamicmenu.of_additem(lm_itemsub, "menu 1 3" )
li_item = ln_dynamicmenu.of_additem(lm_itemsub, "menu 1 4" )
li_item = ln_dynamicmenu.of_additem(lm_itemsub, "menu 1 5" )
li_item = ln_dynamicmenu.of_additem(lm_itemsub, "menu 1 6" )

lm_itemsub = lm_itemsub.item[li_item]

li_item = ln_dynamicmenu.of_additem(lm_itemsub, "menu 2 1" )
li_item = ln_dynamicmenu.of_additem(lm_itemsub, "menu 2 2" )
li_item = ln_dynamicmenu.of_additem(lm_itemsub, "menu 2 3" )
li_item = ln_dynamicmenu.of_additem(lm_itemsub, "menu 2 4" )
li_item = ln_dynamicmenu.of_additem(lm_itemsub, "menu 2 5" )
li_item = ln_dynamicmenu.of_additem(lm_itemsub, "menu 2 6" )


end event

type cb_add from commandbutton within w_demo2
integer x = 914
integer y = 736
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Add Menu"
end type

event clicked;String ls_parent, ls_item
Int li_item
menu lm_main
menu lm_itemsub

n_dynamicmenu ln_dynamicmenu

lm_main = Parent.MenuID

ls_parent = sle_parenttext.Text
ls_item = Trim(sle_itemtext.Text)

If Len(ls_item) = 0 Then Return

ln_dynamicmenu.of_SetParent(Parent)

lm_itemsub = ln_dynamicmenu.of_find_menuitem( lm_main, ls_parent,"text")
If Not IsValid(lm_itemsub) Then
	If MessageBox("Result", ls_parent + " MenuItem can't be find, Add To Parent Menu?",   Exclamation!, YESNO!, 2) = 2 Then Return
	
	li_item = ln_dynamicmenu.of_additem(lm_main, ls_item)
	If li_item > 1 Then
		lm_main.Item[li_item - 1].Hide()
		lm_main.Item[li_item - 1].Show()
	End If
Else
	li_item = ln_dynamicmenu.of_additem(lm_itemsub, ls_item)
End If

end event

type sle_itemtext from singlelineedit within w_demo2
integer x = 512
integer y = 448
integer width = 878
integer height = 128
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "New Item"
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_demo2
integer x = 37
integer y = 480
integer width = 457
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Item Text:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_demo2
integer x = 37
integer y = 224
integer width = 457
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parrent Text:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_parenttext from singlelineedit within w_demo2
integer x = 512
integer y = 192
integer width = 878
integer height = 128
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Edit"
borderstyle borderstyle = stylelowered!
end type


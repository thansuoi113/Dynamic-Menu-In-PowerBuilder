$PBExportHeader$w_demo1.srw
forward
global type w_demo1 from window
end type
type cb_add from commandbutton within w_demo1
end type
type sle_itemtext from singlelineedit within w_demo1
end type
type st_2 from statictext within w_demo1
end type
type st_1 from statictext within w_demo1
end type
type sle_parenttext from singlelineedit within w_demo1
end type
end forward

global type w_demo1 from window
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
global w_demo1 w_demo1

type variables

end variables

forward prototypes
public subroutine wf_dynamicmenus (integer ai_index)
end prototypes

public subroutine wf_dynamicmenus (integer ai_index);// Dynamic Menu Item Clicked

m_main lm_menu
String ls_text

lm_menu = This.MenuID

ls_text = lm_menu.in_dyn.of_GetItemString(ai_index, "text")

Choose Case ls_text
	Case "File3"
		If lm_menu.in_dyn.of_GetItemBool(ai_index, "checked") Then
			lm_menu.in_dyn.of_SetItem(ai_index, "checked", False)
		Else
			lm_menu.in_dyn.of_SetItem(ai_index, "checked", True)
		End If
	Case Else
		MessageBox("Clicked", ls_text)
End Choose


end subroutine

on w_demo1.create
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

on w_demo1.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_add)
destroy(this.sle_itemtext)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_parenttext)
end on

event open;m_main lm_menu
Menu lm_item
Integer li_item, li_index

// get reference to the menu
lm_menu = this.MenuID

lm_menu.in_dyn.of_SetParent(this)


// get reference to the menu item
lm_item = lm_menu.m_file

// set the parent window


// add the items
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 1 1")
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 1 2")
li_item = lm_menu.in_dyn.of_AddSeparator(lm_item, li_index)
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 1 3")

// turn on the checked property
lm_menu.in_dyn.of_SetItem(li_index, "checked", True)

lm_item = lm_item.item[li_item]
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 2")
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 2")
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 2")
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 2")
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 2")

lm_item = lm_item.item[li_item]
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 3")
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 3")
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 3")
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 3")
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 3")

lm_item = lm_menu.m_edit

// add the items
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 1")
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 1")
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 1")

lm_item = lm_item.item[li_item]
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 2")
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 2")
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 2")
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 2")
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 2")

lm_item = lm_item.item[li_item]
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 3")
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 3")
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 3")
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 3")
li_item = lm_menu.in_dyn.of_AddItem(lm_item, li_index,  "SubMenu 3")


end event

type cb_add from commandbutton within w_demo1
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
Int li_item, li_index
m_main lm_main
menu lm_itemsub

lm_main = Parent.MenuID

ls_parent = sle_parenttext.Text
ls_item = Trim(sle_itemtext.Text)

If Len(ls_item) = 0 Then Return

lm_main.in_dyn.of_SetParent(Parent)

lm_itemsub = lm_main.in_dyn.of_find_menuitem( lm_main, ls_parent,"text")
If Not IsValid(lm_itemsub) Then
	If MessageBox("Result", ls_parent + " MenuItem can't be find, Add To Parent Menu?",   Exclamation!, YESNO!, 2) = 2 Then Return
	
	li_item = lm_main.in_dyn.of_additem(lm_main, li_index, ls_item)
	If li_item > 1 Then
		lm_main.Item[li_item - 1].Hide()
		lm_main.Item[li_item - 1].Show()
	End If
Else
	li_item = lm_main.in_dyn.of_additem(lm_itemsub, li_index, ls_item)
End If




end event

type sle_itemtext from singlelineedit within w_demo1
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

type st_2 from statictext within w_demo1
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

type st_1 from statictext within w_demo1
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

type sle_parenttext from singlelineedit within w_demo1
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


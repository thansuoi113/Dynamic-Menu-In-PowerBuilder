$PBExportHeader$n_dynamicmenu.sru
forward
global type n_dynamicmenu from nonvisualobject
end type
end forward

global type n_dynamicmenu from nonvisualobject autoinstantiate
end type

type variables
window iw_parent
end variables

forward prototypes
public subroutine of_setparent (readonly window aw_parent)
public function integer of_additem (menu am_parent, string as_text, string as_tag, string as_microhelp)
public function integer of_additem (menu am_parent, string as_text, string as_tag)
public function integer of_additem (menu am_parent, string as_text)
public function integer of_addseparator (ref menu am_parent)
public function menu of_find_menuitem (menu am_parent, string as_itemtext, string as_key)
public subroutine of_setitem (menu am_parent, string as_propname, boolean ab_value)
public subroutine of_setitem (menu am_parent, string as_propname, string as_value)
public subroutine of_setitem (menu am_parent, string as_propname, integer ai_value)
public function integer of_additem (menu am_parent, string as_text, string as_tag, string as_microhelp, string as_image)
end prototypes

public subroutine of_setparent (readonly window aw_parent);// set the parent window
iw_parent = aw_parent
end subroutine

public function integer of_additem (menu am_parent, string as_text, string as_tag, string as_microhelp);Return of_additem(am_parent, as_text, as_tag, as_microhelp, "")

end function

public function integer of_additem (menu am_parent, string as_text, string as_tag);Return of_additem(am_parent, as_text, as_tag, "","")

end function

public function integer of_additem (menu am_parent, string as_text);
Return of_additem(am_parent, as_text, "", "","")


end function

public function integer of_addseparator (ref menu am_parent);// create a new separator item
Return of_AddItem(am_parent, "-")

end function

public function menu of_find_menuitem (menu am_parent, string as_itemtext, string as_key);menu lm_Null
Integer li_Item,li_row

li_Item = UpperBound(am_parent.Item)

For li_row = 1 To li_Item
	
	Choose Case Lower(Trim(as_key))
		Case "text"
			If Lower(am_parent.Item[li_row].Text) = Lower(as_itemtext) Then
				Return am_parent.Item[li_row]
				Exit
			End If
		Case "tag"
			If Lower(am_parent.Item[li_row].Tag) = Lower(as_itemtext) Then
				Return am_parent.Item[li_row]
				Exit
			End If
		Case "mic"
			If Lower(am_parent.Item[li_row].MicroHelp) = Lower(as_itemtext) Then
				Return am_parent.Item[li_row]
				Exit
			End If
	End Choose
	
	lm_Null = of_find_menuitem(am_parent.Item[li_row],as_itemtext, as_key)
	If IsValid(lm_Null) Then Exit
Next
Return lm_Null

end function

public subroutine of_setitem (menu am_parent, string as_propname, boolean ab_value);//====================================================================
// Function: n_dynamicmenu.of_setitem()
//--------------------------------------------------------------------
// Description: set the specified item boolean property
//--------------------------------------------------------------------
// Arguments:
// 	menu   	am_parent  	
// 	string 	as_propname	
// 	boolean	ab_value   	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Usage: n_dynamicmenu.of_setitem()
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Choose Case Lower(as_propname)
	Case "checked"
		am_parent.Item[1].Checked = ab_value
	Case "default"
		am_parent.Item[1].Default = ab_value
	Case "enabled"
		am_parent.Item[1].Enabled = ab_value
	Case "visible"
		am_parent.Item[1].Visible = ab_value
	Case "toolbaritemdown"
		am_parent.Item[1].ToolbarItemDown = ab_value
	Case "toolbaritemvisible"
		am_parent.Item[1].ToolbarItemVisible = ab_value
	Case Else
		MessageBox("SetItem Error", "Invalid boolean property name: " + as_propname, StopSign!)
End Choose


end subroutine

public subroutine of_setitem (menu am_parent, string as_propname, string as_value);//====================================================================
// Function: n_dynamicmenu.of_setitem()
//--------------------------------------------------------------------
// Description: set the specified item string property
//--------------------------------------------------------------------
// Arguments:
// 	menu  	am_parent  	
// 	string	as_propname	
// 	string	as_value   	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Usage: n_dynamicmenu.of_setitem()
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

choose case Lower(as_propname)
	case "microhelp"
		am_parent.Item[1].Microhelp = as_value
	case "tag"
		am_parent.Item[1].Tag = as_value
	case "text"
		am_parent.Item[1].Text = as_value
	case "toolbaritemdownname"
		am_parent.Item[1].ToolbarItemDownName = as_value
	case "toolbaritemname"
		am_parent.Item[1].ToolbarItemName = as_value
	case "toolbaritemtext"
		am_parent.Item[1].ToolbarItemText = as_value
	case else
		MessageBox("SetItem Error", "Invalid string property name: " + as_propname, StopSign!)
end choose

end subroutine

public subroutine of_setitem (menu am_parent, string as_propname, integer ai_value);//====================================================================
// Function: n_dynamicmenu.of_setitem()
//--------------------------------------------------------------------
// Description: set the specified item integer property
//--------------------------------------------------------------------
// Arguments:
// 	menu   	am_parent  	
// 	string 	as_propname	
// 	integer	ai_value   	
//--------------------------------------------------------------------
// Usage: n_dynamicmenu.of_setitem()
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Choose Case Lower(as_propname)
	Case "toolbaritembarindex"
		am_parent.Item[1].ToolbarItemBarIndex = ai_value
	Case "toolbaritemorder"
		am_parent.Item[1].ToolbarItemOrder = ai_value
	Case "toolbaritemspace"
		am_parent.Item[1].ToolbarItemSpace = ai_value
	Case Else
		MessageBox("SetItem Error", "Invalid integer property name: " + as_propname, StopSign!)
End Choose


end subroutine

public function integer of_additem (menu am_parent, string as_text, string as_tag, string as_microhelp, string as_image);//====================================================================
// Function: n_dynamicmenu.of_additem()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	menu  	am_parent   	
// 	string	as_text     	
// 	string	as_tag      	
// 	string	as_microhelp	
// 	string	as_image    	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Usage: n_dynamicmenu.of_additem()
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Integer li_Item

// create a new item
li_Item = UpperBound(am_parent.Item)+1 // can only append now

// create a new item
m_template lm
lm = Create m_template

// create the menu item
am_parent.Item[li_Item] = lm.Item[1] //must be item[1], or you'll find a funny result

// save references in the newly created item
lm.iw_parent = iw_parent

// set the Text property
of_SetItem(lm, "text", as_text)
of_SetItem(lm, "tag", as_tag)
of_SetItem(lm, "microhelp", as_microhelp)

If Len(Trim(as_image)) > 0 Then
	of_SetItem(lm, "toolbaritemdownname", as_image)
	of_SetItem(lm, "toolbaritemname", as_image)
	of_SetItem(lm, "toolbaritemtext", as_text)
End If

// force redraw
am_parent.Hide()
am_parent.Show()

Return li_Item


end function

on n_dynamicmenu.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_dynamicmenu.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


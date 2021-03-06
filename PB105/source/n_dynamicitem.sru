$PBExportHeader$n_dynamicitem.sru
forward
global type n_dynamicitem from nonvisualobject
end type
end forward

global type n_dynamicitem from nonvisualobject autoinstantiate
end type

type variables
m_dynamicitem im_dynamic[]
Window iw_parent

end variables

forward prototypes
public function boolean of_getitembool (integer ai_index, string as_propname)
public function integer of_getitemcount ()
public function string of_getitemstring (integer ai_index, string as_propname)
public subroutine of_setitem (integer ai_index, string as_propname, boolean ab_value)
public subroutine of_setitem (integer ai_index, string as_propname, string as_value)
public subroutine of_setparent (readonly window aw_parent)
public subroutine of_setitem (integer ai_index, string as_propname, integer ai_value)
public function integer of_getiteminteger (integer ai_index, string as_propname)
public function menu of_find_menuitem (menu am_parent, string as_itemtext, string as_key)
public function integer of_additem (ref menu am_parent, ref integer ai_index, string as_text, string as_tag, string as_microhelp)
public function integer of_additem (ref menu am_parent, ref integer ai_index, string as_text)
public function integer of_addseparator (ref menu am_parent, ref integer ai_index)
public function integer of_additem (ref menu am_parent, ref integer ai_index, string as_text, string as_tag)
end prototypes

public function boolean of_getitembool (integer ai_index, string as_propname);//====================================================================
// Function: n_dynamicitem.of_getitembool()
//--------------------------------------------------------------------
// Description:  get properties
//--------------------------------------------------------------------
// Arguments:
// 	value	integer	ai_index   	
// 	value	string 	as_propname	
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Usage: n_dynamicitem.of_getitembool()
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Boolean lb_value

Choose Case Lower(as_propname)
	Case "checked"
		lb_value = im_dynamic[ai_index].Item[1].Checked
	Case "default"
		lb_value = im_dynamic[ai_index].Item[1].Default
	Case "enabled"
		lb_value = im_dynamic[ai_index].Item[1].Enabled
	Case "visible"
		lb_value = im_dynamic[ai_index].Item[1].Visible
	Case "toolbaritemdown"
		lb_value = im_dynamic[ai_index].Item[1].ToolbarItemDown
	Case "toolbaritemvisible"
		lb_value = im_dynamic[ai_index].Item[1].ToolbarItemVisible
	Case Else
		MessageBox("GetItemBoolean Error", "Invalid property name: " + as_propname, StopSign!)
End Choose

Return lb_value


end function

public function integer of_getitemcount ();// return the number of items
Return UpperBound(im_dynamic)

end function

public function string of_getitemstring (integer ai_index, string as_propname);//====================================================================
// Function: n_dynamicitem.of_getitemstring()
//--------------------------------------------------------------------
// Description: get properties
//--------------------------------------------------------------------
// Arguments:
// 	value	integer	ai_index   	
// 	value	string 	as_propname	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Usage: n_dynamicitem.of_getitemstring()
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String ls_value

Choose Case Lower(as_propname)
	Case "microhelp"
		ls_value = im_dynamic[ai_index].Item[1].MicroHelp
	Case "tag"
		ls_value = im_dynamic[ai_index].Item[1].Tag
	Case "text"
		ls_value = im_dynamic[ai_index].Item[1].Text
	Case "toolbaritemdownname"
		ls_value = im_dynamic[ai_index].Item[1].ToolbarItemDownName
	Case "toolbaritemname"
		ls_value = im_dynamic[ai_index].Item[1].ToolbarItemName
	Case "toolbaritemtext"
		ls_value = im_dynamic[ai_index].Item[1].ToolbarItemText
	Case Else
		MessageBox("GetItemString Error", "Invalid property name: " + as_propname, StopSign!)
End Choose

Return ls_value


end function

public subroutine of_setitem (integer ai_index, string as_propname, boolean ab_value);//====================================================================
// Function: n_dynamicitem.of_setitem()
//--------------------------------------------------------------------
// Description: set properties
//--------------------------------------------------------------------
// Arguments:
// 	integer	ai_index   	
// 	string 	as_propname	
// 	boolean	ab_value   	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/01/26
//--------------------------------------------------------------------
// Usage: n_dynamicitem.of_setitem()
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Choose Case Lower(as_propname)
	Case "checked"
		im_dynamic[ai_index].Item[1].Checked = ab_value
	Case "default"
		im_dynamic[ai_index].Item[1].Default = ab_value
	Case "enabled"
		im_dynamic[ai_index].Item[1].Enabled = ab_value
	Case "visible"
		im_dynamic[ai_index].Item[1].Visible = ab_value
	Case "toolbaritemdown"
		im_dynamic[ai_index].Item[1].ToolbarItemDown = ab_value
	Case "toolbaritemvisible"
		im_dynamic[ai_index].Item[1].ToolbarItemVisible = ab_value
	Case Else
		MessageBox("SetItem Error", "Invalid boolean property name: " + as_propname, StopSign!)
End Choose


end subroutine

public subroutine of_setitem (integer ai_index, string as_propname, string as_value);//====================================================================
// Function: n_dynamicitem.of_setitem()
//--------------------------------------------------------------------
// Description: set properties
//--------------------------------------------------------------------
// Arguments:
// 	integer	ai_index   	
// 	string 	as_propname	
// 	string 	as_value   	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Usage: n_dynamicitem.of_setitem()
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Choose Case Lower(as_propname)
	Case "microhelp"
		im_dynamic[ai_index].Item[1].MicroHelp = as_value
	Case "tag"
		im_dynamic[ai_index].Item[1].Tag = as_value
	Case "text"
		im_dynamic[ai_index].Item[1].Text = as_value
	Case "toolbaritemdownname"
		im_dynamic[ai_index].Item[1].ToolbarItemDownName = as_value
	Case "toolbaritemname"
		im_dynamic[ai_index].Item[1].ToolbarItemName = as_value
	Case "toolbaritemtext"
		im_dynamic[ai_index].Item[1].ToolbarItemText = as_value
	Case Else
		MessageBox("SetItem Error", "Invalid string property name: " + as_propname, StopSign!)
End Choose


end subroutine

public subroutine of_setparent (readonly window aw_parent);// set the parent window
iw_parent = aw_parent

end subroutine

public subroutine of_setitem (integer ai_index, string as_propname, integer ai_value);//====================================================================
// Function: n_dynamicitem.of_setitem()
//--------------------------------------------------------------------
// Description: set properties
//--------------------------------------------------------------------
// Arguments:
// 	integer	ai_index   	
// 	string 	as_propname	
// 	integer	ai_value   	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Usage: n_dynamicitem.of_setitem()
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Choose Case Lower(as_propname)
	Case "toolbaritembarindex"
		im_dynamic[ai_index].Item[1].ToolbarItemBarIndex = ai_value
	Case "toolbaritemorder"
		im_dynamic[ai_index].Item[1].ToolbarItemOrder = ai_value
	Case "toolbaritemspace"
		im_dynamic[ai_index].Item[1].ToolbarItemSpace = ai_value
	Case Else
		MessageBox("SetItem Error","Invalid integer property name: " + as_propname, StopSign!)
End Choose


end subroutine

public function integer of_getiteminteger (integer ai_index, string as_propname);//====================================================================
// Function: n_dynamicitem.of_getiteminteger()
//--------------------------------------------------------------------
// Description: get properties
//--------------------------------------------------------------------
// Arguments:
// 	value	integer	ai_index   	
// 	value	string 	as_propname	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Usage: n_dynamicitem.of_getiteminteger()
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Integer li_value

Choose Case Lower(as_propname)
	Case "toolbaritembarindex"
		li_value = im_dynamic[ai_index].Item[1].ToolbarItemBarIndex
	Case "toolbaritemorder"
		li_value = im_dynamic[ai_index].Item[1].ToolbarItemOrder
	Case "toolbaritemspace"
		li_value = im_dynamic[ai_index].Item[1].ToolbarItemSpace
	Case Else
		MessageBox("GetItemInteger Error", "Invalid property name: " + as_propname, StopSign!)
End Choose

Return li_value


end function

public function menu of_find_menuitem (menu am_parent, string as_itemtext, string as_key);//====================================================================
// Function: n_dynamicitem.of_find_menuitem()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value	menu  	am_parent  	
// 	value	string	as_itemtext	
// 	value	string	as_key     	
//--------------------------------------------------------------------
// Returns:  menu
//--------------------------------------------------------------------
// Usage: n_dynamicitem.of_find_menuitem()
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

menu lmNull
Integer liNumber,li

liNumber = UpperBound(am_parent.Item)
For li = 1 To liNumber
	Choose Case Lower(Trim(as_key))
		Case "text"
			If Lower(am_parent.Item[li].Text) = Lower(as_itemtext) Then
				Return am_parent.Item[li]
				Exit
			End If
		Case "tag"
			If Lower(am_parent.Item[li].Tag) = Lower(as_itemtext) Then
				Return am_parent.Item[li]
				Exit
			End If
		Case "mic"
			If Lower(am_parent.Item[li].MicroHelp ) = Lower(as_itemtext) Then
				Return am_parent.Item[li]
				Exit
			End If
	End Choose
	lmNull = of_find_menuitem(am_parent.Item[li],as_itemtext, as_key)
	If IsValid(lmNull) Then Exit
Next
Return lmNull

end function

public function integer of_additem (ref menu am_parent, ref integer ai_index, string as_text, string as_tag, string as_microhelp);//====================================================================
// Function: n_dynamicitem.of_additem()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	reference	menu   	am_parent   	
// 	reference	integer	ai_index    	
// 	value    	string 	as_text     	
// 	value    	string 	as_tag      	
// 	value    	string 	as_microhelp	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Usage: n_dynamicitem.of_additem()
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Integer li_item
Integer li_index

// get next index
li_item = UpperBound(am_parent.Item) + 1
li_index = UpperBound(im_dynamic) + 1

// create the menu item
im_dynamic[li_index] = Create m_dynamicitem
am_parent.Item[li_item] = im_dynamic[li_index].Item[1]

// save references in the newly created item
im_dynamic[li_index].iw_parent = iw_parent
im_dynamic[li_index].ii_index = li_index

// set the Text property
of_SetItem(li_index, "text", as_text)
of_SetItem(li_index, "tag", as_text)
of_SetItem(li_index, "microhelp", as_text)

// force redraw
am_parent.Hide()
am_parent.Show()

ai_index = li_index
Return li_item


end function

public function integer of_additem (ref menu am_parent, ref integer ai_index, string as_text);Return of_additem(am_parent, ai_index, as_text, "", "")
end function

public function integer of_addseparator (ref menu am_parent, ref integer ai_index);// create a new separator item
Return of_AddItem(am_parent, ai_index, "-")

end function

public function integer of_additem (ref menu am_parent, ref integer ai_index, string as_text, string as_tag);Return of_additem(am_parent, ai_index, as_text, as_tag, "")

end function

on n_dynamicitem.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_dynamicitem.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


$PBExportHeader$dynamicmenu.sra
$PBExportComments$Generated Application Object
forward
global type dynamicmenu from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type dynamicmenu from application
string appname = "dynamicmenu"
end type
global dynamicmenu dynamicmenu

on dynamicmenu.create
appname="dynamicmenu"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on dynamicmenu.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_demo2)
end event


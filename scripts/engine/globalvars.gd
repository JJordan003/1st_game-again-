extends Node2D
#paths for loading (always set)
var EXTPATH_MAINMENU = "res://scenes/mainmenu.tscn"
var EXTPATH_LEVEL1 = "res://scenes/level.tscn"
var EXTPATH_PLAYER = "res://scenes/entities/player.tscn"

#paths for internal referencing (can be set or not)
var INTPATH_VIEWPORT = "/root/control/container"

#objects for referencing in scripts (never set)
var OBJECT_PLAYER
var OBJECT_LEVEL

#other
var VERSION = "0.5c"
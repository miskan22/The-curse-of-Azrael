extends CanvasLayer

var currItem = 0
var select = 0
var globalScript = preload("res://Scenes/Global.gd")

func _on_Close_pressed():
	get_node("Anim").play("TransOut")
	get_tree().paused = false

func switchItem(select):
	for i in range(Global.items.size()):
		if select == i:
			currItem = select
			get_node("Control/AnimSprite").play(Global.items[currItem]["Name"])
			get_node("Control/Name").text = Global.items[currItem]["Name"]
			get_node("Control/Des").text = Global.items[currItem]["Des"]
			get_node("Control/Des").text += "\nCost: " +str(Global.items[currItem]["Cost"])


func _on_Buy_pressed():
	
	var hasItem = false
	if Global.score > Global.items[currItem]["Cost"]:
		for i in Global.inventory:
			if Global.inventory[i]["Name"] == Global.items[currItem]["Name"]:
				Global.inventory[i]["Count"] += 1
				hasItem = true
		if hasItem == false:
			var tempDic = Global.items[currItem]
			tempDic["Count"] = 1
			Global.inventory[Global.inventory.size()] = tempDic[currItem]
		Global.score -= Global.items[currItem]["Cost"]

func _on_Next_pressed():
	switchItem(currItem+1)


func _on_Prev_pressed():
	switchItem(currItem-1)


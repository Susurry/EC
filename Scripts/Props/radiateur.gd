extends GenericProp


func _init() -> void:
	onInteract.connect(onGenericPropInteract)
	onInteract.connect(_onRadiatorInteract)


func _onRadiatorInteract() :
	print("je suis un radiateur :D")
